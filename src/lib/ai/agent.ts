import OpenAI from "openai";
import type { SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";
import {
  getAiConfig,
  getConversationHistory,
  saveMessages,
  getContactForPhone,
  type ConversationMessage,
} from "@/lib/db/ai-agent";
import { buildTools } from "@/lib/ai/tools";

const MAX_ITERATIONS = 8;

export async function runAgent(params: {
  clinicId: string;
  sessionId: string;
  phone: string;
  newMessages: string[];
  supabaseAdmin: SupabaseClient<Database>;
}): Promise<string> {
  const { clinicId, sessionId, phone, newMessages, supabaseAdmin } = params;

  const config = await getAiConfig(clinicId);
  if (!config || !config.aiEnabled) {
    throw new Error("AI agent not configured or disabled");
  }

  // Fetch context in parallel
  const [history, contact] = await Promise.all([
    getConversationHistory(clinicId, sessionId, 20),
    getContactForPhone(clinicId, phone),
  ]);

  const { tools, executors } = buildTools(clinicId, supabaseAdmin, config.timezone);

  // Build system prompt with clinic context
  const now = new Date().toLocaleString("pt-BR", { timeZone: config.timezone });
  const contactContext = contact
    ? `\n\n## Dados do Contato Atual
- Nome: ${contact.full_name}
- Status CRM: ${contact.status}${contact.pipeline_stage ? ` (${contact.pipeline_stage})` : ""}
- Notas: ${contact.notes ?? "—"}
${
  contact.last_appointments.length > 0
    ? `- Últimos agendamentos:
${contact.last_appointments.map((a) => `  • ${a.date} ${a.doctor} — ${a.type} (${a.status})`).join("\n")}`
    : ""
}
${
  contact.contact_notes.length > 0
    ? `- Notas da equipe:
${contact.contact_notes.map((n) => `  • ${n.body}`).join("\n")}`
    : ""
}`
    : "";

  const systemPrompt = [
    config.systemPrompt ||
      `Você é ${config.agentName}, assistente virtual da clínica ${config.clinicName}. Responda de forma cordial e profissional em português.`,
    `\n## Contexto`,
    `Data/hora atual: ${now}`,
    `Clínica: ${config.clinicName}`,
    contactContext,
    `\n## Instruções de Comportamento
- Responda sempre em português brasileiro
- Seja conciso mas acolhedor
- Use as ferramentas disponíveis para buscar horários e criar agendamentos
- Antes de criar um agendamento, confirme data, horário, médico e tipo de consulta com o paciente
- Se o paciente enviar múltiplas mensagens curtas, responda de forma integrada`,
  ]
    .filter(Boolean)
    .join("\n");

  // Build message history for the LLM
  const messages: OpenAI.ChatCompletionMessageParam[] = [
    { role: "system", content: systemPrompt },
    ...history.map((m): OpenAI.ChatCompletionMessageParam => ({
      role: m.role,
      content: m.content,
    })),
    // Combine all new accumulated messages into one user message
    {
      role: "user",
      content: newMessages.filter(Boolean).join("\n"),
    },
  ];

  const client = new OpenAI({
    baseURL: "https://openrouter.ai/api/v1",
    apiKey: config.openrouterKey,
    defaultHeaders: {
      "HTTP-Referer": "https://zelusapp.com.br",
      "X-Title": "Zelus AI Agent",
    },
  });

  let finalResponse = "";
  let iteration = 0;

  // ReAct loop
  while (iteration < MAX_ITERATIONS) {
    iteration++;

    const response = await client.chat.completions.create({
      model: config.model,
      messages,
      tools: tools as OpenAI.ChatCompletionTool[],
      tool_choice: "auto",
      temperature: 0.4,
    });

    const choice = response.choices[0];
    if (!choice) break;

    const assistantMessage = choice.message;
    messages.push(assistantMessage);

    if (choice.finish_reason === "stop" || !assistantMessage.tool_calls?.length) {
      finalResponse = assistantMessage.content ?? "";
      break;
    }

    // Execute all tool calls
    type FunctionToolCall = { id: string; type: string; function: { name: string; arguments: string } };
    const toolResults: OpenAI.ChatCompletionToolMessageParam[] = await Promise.all(
      (assistantMessage.tool_calls as FunctionToolCall[]).map(async (tc) => {
        const executor = executors[tc.function.name];
        let result: string;
        try {
          const args = JSON.parse(tc.function.arguments || "{}") as Record<string, unknown>;
          result = executor ? await executor(args) : `Ferramenta desconhecida: ${tc.function.name}`;
        } catch (err) {
          result = `Erro ao executar ferramenta: ${err instanceof Error ? err.message : String(err)}`;
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

  // Save conversation to DB
  const userContent = newMessages.filter(Boolean).join("\n");
  await saveMessages(clinicId, sessionId, [
    { role: "user", content: userContent },
    { role: "assistant", content: finalResponse },
  ]);

  return finalResponse;
}

/** Splits a long response into chunks for WhatsApp sending */
export function splitResponse(text: string): string[] {
  if (text.length <= 90) return [text];

  // Split by double newlines (paragraphs) first
  const paragraphs = text.split(/\n\n+/).filter((p) => p.trim());
  if (paragraphs.length > 1) return paragraphs;

  // Split by single newlines
  const lines = text.split(/\n/).filter((l) => l.trim());
  if (lines.length > 1) return lines;

  // Split by sentences (. ! ?)
  const sentences = text.match(/[^.!?]+[.!?]+/g) ?? [text];
  return sentences.map((s) => s.trim()).filter(Boolean);
}
