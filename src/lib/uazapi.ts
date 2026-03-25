/**
 * UAZAPI client — all requests go through /api/uazapi to avoid CORS issues.
 * Pass { serverUrl, instanceToken } for per-request config.
 */

export interface UazapiConfig {
  serverUrl: string;
  instanceToken: string;
}

export interface UazapiInstance {
  id: string;
  token: string;
  status: "disconnected" | "connecting" | "connected";
  name: string;
  profileName?: string;
  profilePicUrl?: string;
  isBusiness?: boolean;
  qrcode?: string;
  paircode?: string;
  owner?: string;
  lastDisconnect?: string;
  lastDisconnectReason?: string;
  chatbot_enabled?: boolean;
  created?: string;
  updated?: string;
}

export interface UazapiInstanceStatus {
  instance: UazapiInstance;
  status: {
    connected: boolean;
    loggedIn: boolean;
    jid: { user: string; server: string } | null;
  };
}

export interface UazapiChat {
  id: string;
  wa_chatid: string;
  wa_fastid?: string;
  wa_contactName: string;
  wa_name: string;
  name: string;
  image?: string;
  phone?: string;
  wa_isGroup: boolean;
  wa_isPinned: boolean;
  wa_isBlocked: boolean;
  wa_unreadCount: number;
  wa_lastMsgTimestamp: number;
  wa_lastMessageType?: string;
  wa_lastMessageTextVote?: string;
  lead_name?: string;
  lead_fullName?: string;
  lead_email?: string;
  lead_status?: string;
  lead_tags?: string[];
  lead_isTicketOpen?: boolean;
  lead_assignedAttendant_id?: string;
  lead_notes?: string;
  chatbot_disableUntil?: number;
}

export interface UazapiMessage {
  id: string;
  messageid: string;
  chatid: string;
  body?: string;
  type: string;
  fromMe: boolean;
  timestamp: number;
  status?: string;
  mediaUrl?: string;
  mediaType?: string;
  caption?: string;
  quotedMsg?: UazapiMessage;
}

async function request<T>(
  config: UazapiConfig,
  method: "GET" | "POST" | "DELETE",
  path: string,
  body?: unknown
): Promise<T> {
  const res = await fetch("/api/uazapi", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      serverUrl: config.serverUrl,
      instanceToken: config.instanceToken,
      method,
      path,
      body,
    }),
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({ error: res.statusText }));
    throw new Error(err.error || `UAZAPI error ${res.status}`);
  }

  return res.json();
}

// ── Instance ──────────────────────────────────────────────
export const uazapi = {
  /** Get instance connection status + QR code if connecting */
  getStatus(config: UazapiConfig): Promise<UazapiInstanceStatus> {
    return request(config, "GET", "/instance/status");
  },

  /** Start connection — returns QR code (no phone) or pairing code (with phone) */
  connect(config: UazapiConfig, phone?: string): Promise<{
    connected: boolean;
    loggedIn: boolean;
    instance: UazapiInstance;
  }> {
    return request(config, "POST", "/instance/connect", phone ? { phone } : undefined);
  },

  /** Disconnect instance */
  disconnect(config: UazapiConfig): Promise<{ response: string }> {
    return request(config, "POST", "/instance/disconnect");
  },

  // ── Chats ──────────────────────────────────────────────
  /** Find chats with optional filters */
  findChats(
    config: UazapiConfig,
    opts?: {
      limit?: number;
      offset?: number;
      sort?: string;
      wa_isGroup?: boolean;
      name?: string;
    }
  ): Promise<{
    chats: UazapiChat[];
    pagination: {
      totalRecords: number;
      currentPage: number;
      totalPages: number;
      hasNextPage: boolean;
    };
  }> {
    return request(config, "POST", "/chat/find", {
      limit: opts?.limit ?? 30,
      offset: opts?.offset ?? 0,
      sort: opts?.sort ?? "-wa_lastMsgTimestamp",
      ...(opts?.wa_isGroup !== undefined && { wa_isGroup: opts.wa_isGroup }),
      ...(opts?.name && { name: `~${opts.name}` }),
    });
  },

  /** Find messages in a chat */
  findMessages(
    config: UazapiConfig,
    chatid: string,
    opts?: { limit?: number; offset?: number }
  ): Promise<{
    messages: UazapiMessage[];
    returnedMessages: number;
    hasMore: boolean;
  }> {
    return request(config, "POST", "/message/find", {
      chatid,
      limit: opts?.limit ?? 50,
      offset: opts?.offset ?? 0,
    });
  },

  /** Send a text message */
  sendText(
    config: UazapiConfig,
    number: string,
    text: string,
    opts?: { replyid?: string; readchat?: boolean }
  ): Promise<{ messageid: string }> {
    return request(config, "POST", "/send/text", {
      number,
      text,
      readchat: opts?.readchat ?? true,
      ...(opts?.replyid && { replyid: opts.replyid }),
    });
  },

  /** Mark messages as read */
  markRead(
    config: UazapiConfig,
    chatid: string
  ): Promise<unknown> {
    return request(config, "POST", "/chat/read", { id: chatid });
  },

  /** Edit lead info on a chat */
  editLead(
    config: UazapiConfig,
    id: string,
    data: Partial<Pick<UazapiChat,
      | "lead_name" | "lead_fullName" | "lead_email"
      | "lead_status" | "lead_tags" | "lead_notes"
      | "lead_isTicketOpen" | "lead_assignedAttendant_id"
    >>
  ): Promise<unknown> {
    return request(config, "POST", "/chat/editLead", { id, ...data });
  },
};
