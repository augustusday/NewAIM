import OpenAI from "openai";
import type { SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";
import {
  getAiConfig,
  getConversationHistory,
  saveMessages,
  getContactForPhone,
} from "@/lib/db/ai-agent";
import { buildTools } from "@/lib/ai/tools";

const MAX_ITERATIONS = 8;

// ── Execution logging helpers ──────────────────────────────────────────────────

async function createExecution(
  supabaseAdmin: SupabaseClient<Database>,
  params: {
    clinicId: string;
    sessionId: string;
    phone: string;
    contactName: string | null;
    inputPreview: string;
  }
): Promise<string | null> {
  const { data } = await supabaseAdmin
    .from("ai_executions")
    .insert({
      clinic_id: params.clinicId,
      session_id: params.sessionId,
      phone: params.phone,
      contact_name: params.contactName,
      input_preview: params.inputPreview.slice(0, 300),
      status: "running",
    })
    .select("id")
    .single();
  return data?.id ?? null;
}

async function finalizeExecution(
  supabaseAdmin: SupabaseClient<Database>,
  executionId: string,
  params: {
    status: "success" | "error";
    finalResponse: string;
    iterations: number;
    startedAt: number;
    errorMessage?: string;
  }
) {
  await supabaseAdmin
    .from("ai_executions")
    .update({
      status: params.status,
      final_response: params.finalResponse.slice(0, 2000),
      iterations: params.iterations,
      finished_at: new Date().toISOString(),
      duration_ms: Date.now() - params.startedAt,
      error_message: params.errorMessage ?? null,
    })
    .eq("id", executionId);
}

async function saveStep(
  supabaseAdmin: SupabaseClient<Database>,
  executionId: string,
  step: {
    stepIndex: number;
    type: "llm_call" | "tool_call" | "tool_result";
    toolName?: string;
    toolArgs?: Record<string, unknown>;
    toolResult?: string;
    durationMs?: number;
    error?: string;
  }
) {
  await supabaseAdmin.from("ai_execution_steps").insert({
    execution_id: executionId,
    step_index: step.stepIndex,
    type: step.type,
    tool_name: step.toolName ?? null,
    tool_args: (step.toolArgs ?? null) as import("@/lib/database.types").Json | null,
    tool_result: step.toolResult ? step.toolResult.slice(0, 4000) : null,
    duration_ms: step.durationMs ?? null,
    error: step.error ?? null,
  });
}

// ── Main agent runner ──────────────────────────────────────────────────────────

export async function runAgent(params: {
  clinicId: string;
  sessionId: string;
  phone: string;
  newMessages: string[];
  supabaseAdmin: SupabaseClient<Database>;
}): Promise<string> {
  const { clinicId, sessionId, phone, newMessages, supabaseAdmin } = params;
  const startedAt = Date.now();

  const config = await getAiConfig(clinicId);
  if (!config || !config.aiEnabled) {
    throw new Error("AI agent not configured or disabled");
  }

  // Fetch context in parallel
  const [history, contact] = await Promise.all([
    getConversationHistory(clinicId, sessionId, 20),
    getContactForPhone(clinicId, phone),
  ]);

  const userContent = newMessages.filter(Boolean).join("\n");

  // Create execution record
  const executionId = await createExecution(supabaseAdmin, {
    clinicId,
    sessionId,
    phone,
    contactName: contact?.full_name ?? null,
    inputPreview: userContent,
  });

  const { tools, executors } = buildTools(clinicId, supabaseAdmin, sessionId);

  // Build system prompt with clinic context
  const now = new Date().toLocaleString("pt-BR", { timeZone: config.timezone });
  const contactContext = contact
    ? `\n\n## Dados do Contato Atual
- Nome: ${contact.full_name}
- Status CRM: ${contact.status}${contact.pipeline_stage ? ` (${contact.pipeline_stage})` : ""}
- Notas: ${contact.notes ?? "—"}
${
  contact.last_appointments.length > 0
    ? `- Últimos agendamentos:\n${contact.last_appointments.map((a) => `  • ${a.date} ${a.doctor} — ${a.type} (${a.status})`).join("\n")}`
    : ""
}
${
  contact.contact_notes.length > 0
    ? `- Notas da equipe:\n${contact.contact_notes.map((n) => `  • ${n.body}`).join("\n")}`
    : ""
}`
    : "";

  const systemPrompt = [
    config.systemPrompt ||
      `Você é ${config.agentName}, assistente virtual da clínica ${config.clinicName}. Responda de forma cordial e profissional em português.`,
    `\n## Contexto`,
    `Data/hora atual: ${now}`,
    `Clínica: ${config.clinicName}`,
    config.clinicAddress ? `Endereço: ${config.clinicAddress}` : null,
    contactContext,
    `\n## Instruções de Comportamento
- Responda sempre em português brasileiro
- Seja conciso mas acolhedor
- Se o paciente enviar múltiplas mensagens curtas, responda de forma integrada

## Agendamento
- Use listar_medicos e listar_tipos_consulta para apresentar opções ao paciente
- Use buscar_horarios_disponiveis para verificar disponibilidade antes de sugerir horários
- Antes de criar um agendamento com criar_agendamento, confirme: data, horário, médico e tipo de consulta

## Cancelamento
- Use listar_consultas_paciente para mostrar as consultas futuras do paciente
- Se houver mais de uma consulta, pergunte qual deseja cancelar
- Confirme explicitamente antes de chamar cancelar_consulta: "Confirma o cancelamento da consulta com [médico] no dia [data] às [hora]?"
- Após cancelar, informe que pode reagendar se desejar

## Remarcação
- Use listar_consultas_paciente para identificar qual consulta remarcar
- Use buscar_horarios_disponiveis com o mesmo médico para buscar nova disponibilidade
- Antes de chamar remarcar_consulta, confirme a nova data e horário com o paciente
- Após remarcar, confirme os novos dados da consulta

## Limitações
- Não altere o médico em uma remarcação — apenas data e horário
- Não cancele nem remarque consultas com status "completed"
- Em caso de dúvida sobre a identidade do paciente, peça confirmação do nome

## Gestão do Contato no CRM
- Sempre que o paciente informar dados pessoais (email, data de nascimento, CPF, gênero, nome completo), chame atualizar_contato imediatamente para salvar no cadastro.
- Ao encerrar uma conversa com informação relevante (queixa, condição de saúde, pedido especial, preferência), chame adicionar_nota_contato com um resumo objetivo para a equipe.
- Após criar um agendamento, o sistema move automaticamente o contato no pipeline — não é necessário chamar mover_estagio_pipeline para isso.
- Não informe o paciente sobre essas operações internas — são transparentes para o usuário.
- Se mover_estagio_pipeline retornar success=false, ignore silenciosamente sem mencionar o erro ao paciente.

## Transferência para Atendimento Humano
- Se o paciente pedir para falar com um atendente, humano, pessoa real, ou quiser parar de receber respostas automáticas, chame imediatamente bloquear_agente.
- Após chamar bloquear_agente, informe ao paciente: "Entendido! Vou transferir para um atendente humano. Em breve alguém entrará em contato com você." (adapte ao tom da clínica)
- Se o paciente demonstrar frustração clara com o atendimento automático (ex.: "para de me mandar mensagem", "quero falar com alguém de verdade"), também chame bloquear_agente.
- Não chame bloquear_agente por iniciativa própria sem sinal claro do paciente.`,
  ]
    .filter(Boolean)
    .join("\n");

  const messages: OpenAI.ChatCompletionMessageParam[] = [
    { role: "system", content: systemPrompt },
    ...history.map((m): OpenAI.ChatCompletionMessageParam => ({
      role: m.role,
      content: m.content,
    })),
    { role: "user", content: userContent },
  ];

  const client = new OpenAI({
    apiKey: config.openaiKey,
    baseURL: "https://openrouter.ai/api/v1",
  });

  let finalResponse = "";
  let iteration = 0;
  let stepIndex = 0;

  try {
    // ReAct loop
    while (iteration < MAX_ITERATIONS) {
      iteration++;
      const llmStart = Date.now();

      const response = await client.chat.completions.create({
        model: config.model,
        messages,
        tools: tools as OpenAI.ChatCompletionTool[],
        tool_choice: "auto",
        temperature: 0.4,
      });

      const llmDuration = Date.now() - llmStart;
      const choice = response.choices[0];
      if (!choice) break;

      const assistantMessage = choice.message;
      messages.push(assistantMessage);

      // Log the LLM call step
      if (executionId) {
        await saveStep(supabaseAdmin, executionId, {
          stepIndex: stepIndex++,
          type: "llm_call",
          toolResult: assistantMessage.content ?? undefined,
          durationMs: llmDuration,
        });
      }

      // Final response — no tool calls
      if (choice.finish_reason === "stop" || !assistantMessage.tool_calls?.length) {
        finalResponse = assistantMessage.content ?? "";
        break;
      }

      // Execute tool calls and log each one
      type FunctionToolCall = { id: string; type: string; function: { name: string; arguments: string } };
      const toolResults: OpenAI.ChatCompletionToolMessageParam[] = await Promise.all(
        (assistantMessage.tool_calls as FunctionToolCall[]).map(async (tc) => {
          const executor = executors[tc.function.name];
          const toolStart = Date.now();
          let result: string;
          let toolError: string | undefined;

          try {
            const args = JSON.parse(tc.function.arguments || "{}") as Record<string, unknown>;

            // Log tool_call step before executing
            if (executionId) {
              await saveStep(supabaseAdmin, executionId, {
                stepIndex: stepIndex++,
                type: "tool_call",
                toolName: tc.function.name,
                toolArgs: args,
              });
            }

            result = executor ? await executor(args) : `Ferramenta desconhecida: ${tc.function.name}`;
          } catch (err) {
            toolError = err instanceof Error ? err.message : String(err);
            result = `Erro ao executar ferramenta: ${toolError}`;
          }

          const toolDuration = Date.now() - toolStart;

          // Log tool_result step
          if (executionId) {
            await saveStep(supabaseAdmin, executionId, {
              stepIndex: stepIndex++,
              type: "tool_result",
              toolName: tc.function.name,
              toolResult: result,
              durationMs: toolDuration,
              error: toolError,
            });
          }

          return {
            role: "tool" as const,
            tool_call_id: tc.id,
            content: result,
          };
        })
      );

      messages.push(...toolResults);
    }

    if (!finalResponse) {
      finalResponse = "Desculpe, não consegui processar sua mensagem. Tente novamente.";
    }

    // Save conversation and finalize execution
    await Promise.all([
      saveMessages(clinicId, sessionId, [
        { role: "user", content: userContent },
        { role: "assistant", content: finalResponse },
      ]),
      executionId
        ? finalizeExecution(supabaseAdmin, executionId, {
            status: "success",
            finalResponse,
            iterations: iteration,
            startedAt,
          })
        : Promise.resolve(),
    ]);

    return finalResponse;
  } catch (err) {
    const errorMessage = err instanceof Error ? err.message : String(err);

    if (executionId) {
      await finalizeExecution(supabaseAdmin, executionId, {
        status: "error",
        finalResponse: "",
        iterations: iteration,
        startedAt,
        errorMessage,
      });
    }

    throw err;
  }
}

/** Splits a long response into chunks for WhatsApp sending */
export function splitResponse(text: string): string[] {
  if (text.length <= 90) return [text];

  const paragraphs = text.split(/\n\n+/).filter((p) => p.trim());
  if (paragraphs.length > 1) return paragraphs;

  const lines = text.split(/\n/).filter((l) => l.trim());
  if (lines.length > 1) return lines;

  const sentences = text.match(/[^.!?]+[.!?]+/g) ?? [text];
  return sentences.map((s) => s.trim()).filter(Boolean);
}
