export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.4"
  }
  public: {
    Tables: {
      ai_conversation_messages: {
        Row: {
          clinic_id: string
          content: string
          created_at: string
          id: string
          role: string
          session_id: string
        }
        Insert: {
          clinic_id: string
          content: string
          created_at?: string
          id?: string
          role: string
          session_id: string
        }
        Update: {
          clinic_id?: string
          content?: string
          created_at?: string
          id?: string
          role?: string
          session_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "ai_conversation_messages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "ai_conversation_messages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
        ]
      }
      appointment_types: {
        Row: {
          active: boolean
          clinic_id: string
          color: string
          created_at: string
          duration_minutes: number
          id: string
          name: string
        }
        Insert: {
          active?: boolean
          clinic_id: string
          color?: string
          created_at?: string
          duration_minutes?: number
          id?: string
          name: string
        }
        Update: {
          active?: boolean
          clinic_id?: string
          color?: string
          created_at?: string
          duration_minutes?: number
          id?: string
          name?: string
        }
        Relationships: [
          {
            foreignKeyName: "appointment_types_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "appointment_types_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
        ]
      }
      appointments: {
        Row: {
          chat_session_id: string | null
          clinic_id: string
          contact_id: string | null
          created_at: string
          created_by: string | null
          doctor_id: string
          end_time: string
          id: string
          notes: string | null
          patient_name: string
          patient_phone: string | null
          scheduled_date: string
          source: string
          start_time: string
          status: string
          type_id: string | null
          type_name_snapshot: string | null
          updated_at: string
        }
        Insert: {
          chat_session_id?: string | null
          clinic_id: string
          contact_id?: string | null
          created_at?: string
          created_by?: string | null
          doctor_id: string
          end_time: string
          id?: string
          notes?: string | null
          patient_name: string
          patient_phone?: string | null
          scheduled_date: string
          source?: string
          start_time: string
          status?: string
          type_id?: string | null
          type_name_snapshot?: string | null
          updated_at?: string
        }
        Update: {
          chat_session_id?: string | null
          clinic_id?: string
          contact_id?: string | null
          created_at?: string
          created_by?: string | null
          doctor_id?: string
          end_time?: string
          id?: string
          notes?: string | null
          patient_name?: string
          patient_phone?: string | null
          scheduled_date?: string
          source?: string
          start_time?: string
          status?: string
          type_id?: string | null
          type_name_snapshot?: string | null
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "appointments_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "appointments_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "appointments_contact_id_fkey"
            columns: ["contact_id"]
            isOneToOne: false
            referencedRelation: "contacts"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "appointments_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "appointments_doctor_id_fkey"
            columns: ["doctor_id"]
            isOneToOne: false
            referencedRelation: "doctors"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "appointments_type_id_fkey"
            columns: ["type_id"]
            isOneToOne: false
            referencedRelation: "appointment_types"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_appointments_chat_session"
            columns: ["chat_session_id"]
            isOneToOne: false
            referencedRelation: "chat_sessions"
            referencedColumns: ["id"]
          },
        ]
      }
      availability_blocks: {
        Row: {
          clinic_id: string
          created_at: string
          doctor_id: string
          ends_at: string
          id: string
          reason: string | null
          starts_at: string
        }
        Insert: {
          clinic_id: string
          created_at?: string
          doctor_id: string
          ends_at: string
          id?: string
          reason?: string | null
          starts_at: string
        }
        Update: {
          clinic_id?: string
          created_at?: string
          doctor_id?: string
          ends_at?: string
          id?: string
          reason?: string | null
          starts_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "availability_blocks_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "availability_blocks_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "availability_blocks_doctor_id_fkey"
            columns: ["doctor_id"]
            isOneToOne: false
            referencedRelation: "doctors"
            referencedColumns: ["id"]
          },
        ]
      }
      availability_templates: {
        Row: {
          active: boolean
          clinic_id: string
          day_of_week: number
          doctor_id: string
          end_time: string
          id: string
          slot_duration_min: number
          start_time: string
        }
        Insert: {
          active?: boolean
          clinic_id: string
          day_of_week: number
          doctor_id: string
          end_time: string
          id?: string
          slot_duration_min?: number
          start_time: string
        }
        Update: {
          active?: boolean
          clinic_id?: string
          day_of_week?: number
          doctor_id?: string
          end_time?: string
          id?: string
          slot_duration_min?: number
          start_time?: string
        }
        Relationships: [
          {
            foreignKeyName: "availability_templates_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "availability_templates_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "availability_templates_doctor_id_fkey"
            columns: ["doctor_id"]
            isOneToOne: false
            referencedRelation: "doctors"
            referencedColumns: ["id"]
          },
        ]
      }
      chat_session_events: {
        Row: {
          actor_id: string | null
          clinic_id: string
          created_at: string
          event_type: string
          id: string
          payload: Json
          session_id: string
        }
        Insert: {
          actor_id?: string | null
          clinic_id: string
          created_at?: string
          event_type: string
          id?: string
          payload?: Json
          session_id: string
        }
        Update: {
          actor_id?: string | null
          clinic_id?: string
          created_at?: string
          event_type?: string
          id?: string
          payload?: Json
          session_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "chat_session_events_actor_id_fkey"
            columns: ["actor_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "chat_session_events_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "chat_session_events_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "chat_session_events_session_id_fkey"
            columns: ["session_id"]
            isOneToOne: false
            referencedRelation: "chat_sessions"
            referencedColumns: ["id"]
          },
        ]
      }
      chat_sessions: {
        Row: {
          ai_paused: boolean
          ai_paused_until: string | null
          assigned_to: string | null
          clinic_id: string
          contact_id: string | null
          created_at: string
          id: string
          last_message_at: string | null
          last_message_from_me: boolean
          last_message_text: string | null
          metadata: Json
          status: string
          tags: string[]
          unread_count: number
          updated_at: string
          wa_chat_id: string
          wa_contact_name: string | null
          wa_is_group: boolean
          wa_phone: string | null
          wa_profile_pic: string | null
        }
        Insert: {
          ai_paused?: boolean
          ai_paused_until?: string | null
          assigned_to?: string | null
          clinic_id: string
          contact_id?: string | null
          created_at?: string
          id?: string
          last_message_at?: string | null
          last_message_from_me?: boolean
          last_message_text?: string | null
          metadata?: Json
          status?: string
          tags?: string[]
          unread_count?: number
          updated_at?: string
          wa_chat_id: string
          wa_contact_name?: string | null
          wa_is_group?: boolean
          wa_phone?: string | null
          wa_profile_pic?: string | null
        }
        Update: {
          ai_paused?: boolean
          ai_paused_until?: string | null
          assigned_to?: string | null
          clinic_id?: string
          contact_id?: string | null
          created_at?: string
          id?: string
          last_message_at?: string | null
          last_message_from_me?: boolean
          last_message_text?: string | null
          metadata?: Json
          status?: string
          tags?: string[]
          unread_count?: number
          updated_at?: string
          wa_chat_id?: string
          wa_contact_name?: string | null
          wa_is_group?: boolean
          wa_phone?: string | null
          wa_profile_pic?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "chat_sessions_assigned_to_fkey"
            columns: ["assigned_to"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "chat_sessions_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "chat_sessions_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "chat_sessions_contact_id_fkey"
            columns: ["contact_id"]
            isOneToOne: false
            referencedRelation: "contacts"
            referencedColumns: ["id"]
          },
        ]
      }
      clinic_members: {
        Row: {
          active: boolean
          clinic_id: string
          id: string
          invited_at: string
          joined_at: string | null
          role: string
          user_id: string
        }
        Insert: {
          active?: boolean
          clinic_id: string
          id?: string
          invited_at?: string
          joined_at?: string | null
          role?: string
          user_id: string
        }
        Update: {
          active?: boolean
          clinic_id?: string
          id?: string
          invited_at?: string
          joined_at?: string | null
          role?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "clinic_members_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "clinic_members_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "clinic_members_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      clinic_settings: {
        Row: {
          ai_agent_name: string | null
          ai_enabled: boolean
          ai_model: string | null
          ai_openai_key: string | null
          ai_system_prompt: string | null
          appointment_slot_min: number
          business_hours: Json
          clinic_id: string
          uazapi_instance_token: string | null
          uazapi_is_business: boolean
          uazapi_last_synced_at: string | null
          uazapi_profile_name: string | null
          uazapi_profile_pic: string | null
          uazapi_server_url: string | null
          uazapi_status: string
          updated_at: string
        }
        Insert: {
          ai_agent_name?: string | null
          ai_enabled?: boolean
          ai_model?: string | null
          ai_openai_key?: string | null
          ai_system_prompt?: string | null
          appointment_slot_min?: number
          business_hours?: Json
          clinic_id: string
          uazapi_instance_token?: string | null
          uazapi_is_business?: boolean
          uazapi_last_synced_at?: string | null
          uazapi_profile_name?: string | null
          uazapi_profile_pic?: string | null
          uazapi_server_url?: string | null
          uazapi_status?: string
          updated_at?: string
        }
        Update: {
          ai_agent_name?: string | null
          ai_enabled?: boolean
          ai_model?: string | null
          ai_openai_key?: string | null
          ai_system_prompt?: string | null
          appointment_slot_min?: number
          business_hours?: Json
          clinic_id?: string
          uazapi_instance_token?: string | null
          uazapi_is_business?: boolean
          uazapi_last_synced_at?: string | null
          uazapi_profile_name?: string | null
          uazapi_profile_pic?: string | null
          uazapi_server_url?: string | null
          uazapi_status?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "clinic_settings_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: true
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "clinic_settings_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: true
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
        ]
      }
      clinics: {
        Row: {
          active: boolean
          created_at: string
          id: string
          logo_url: string | null
          name: string
          plan: string
          settings: Json
          slug: string
          timezone: string
          updated_at: string
        }
        Insert: {
          active?: boolean
          created_at?: string
          id?: string
          logo_url?: string | null
          name: string
          plan?: string
          settings?: Json
          slug: string
          timezone?: string
          updated_at?: string
        }
        Update: {
          active?: boolean
          created_at?: string
          id?: string
          logo_url?: string | null
          name?: string
          plan?: string
          settings?: Json
          slug?: string
          timezone?: string
          updated_at?: string
        }
        Relationships: []
      }
      contact_notes: {
        Row: {
          author_id: string | null
          body: string
          clinic_id: string
          contact_id: string
          created_at: string
          id: string
        }
        Insert: {
          author_id?: string | null
          body: string
          clinic_id: string
          contact_id: string
          created_at?: string
          id?: string
        }
        Update: {
          author_id?: string | null
          body?: string
          clinic_id?: string
          contact_id?: string
          created_at?: string
          id?: string
        }
        Relationships: [
          {
            foreignKeyName: "contact_notes_author_id_fkey"
            columns: ["author_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "contact_notes_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "contact_notes_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "contact_notes_contact_id_fkey"
            columns: ["contact_id"]
            isOneToOne: false
            referencedRelation: "contacts"
            referencedColumns: ["id"]
          },
        ]
      }
      contacts: {
        Row: {
          assigned_to: string | null
          birth_date: string | null
          clinic_id: string
          created_at: string
          created_by: string | null
          custom_fields: Json
          document: string | null
          email: string | null
          full_name: string
          gender: string | null
          id: string
          notes: string | null
          phone: string | null
          status: string
          tags: string[]
          updated_at: string
          wa_chat_id: string | null
          wa_last_msg_at: string | null
        }
        Insert: {
          assigned_to?: string | null
          birth_date?: string | null
          clinic_id: string
          created_at?: string
          created_by?: string | null
          custom_fields?: Json
          document?: string | null
          email?: string | null
          full_name: string
          gender?: string | null
          id?: string
          notes?: string | null
          phone?: string | null
          status?: string
          tags?: string[]
          updated_at?: string
          wa_chat_id?: string | null
          wa_last_msg_at?: string | null
        }
        Update: {
          assigned_to?: string | null
          birth_date?: string | null
          clinic_id?: string
          created_at?: string
          created_by?: string | null
          custom_fields?: Json
          document?: string | null
          email?: string | null
          full_name?: string
          gender?: string | null
          id?: string
          notes?: string | null
          phone?: string | null
          status?: string
          tags?: string[]
          updated_at?: string
          wa_chat_id?: string | null
          wa_last_msg_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "contacts_assigned_to_fkey"
            columns: ["assigned_to"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "contacts_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "contacts_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "contacts_created_by_fkey"
            columns: ["created_by"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      doctors: {
        Row: {
          active: boolean
          clinic_id: string
          color: string
          created_at: string
          crm_number: string | null
          id: string
          name: string
          specialty: string | null
          updated_at: string
          user_id: string | null
        }
        Insert: {
          active?: boolean
          clinic_id: string
          color?: string
          created_at?: string
          crm_number?: string | null
          id?: string
          name: string
          specialty?: string | null
          updated_at?: string
          user_id?: string | null
        }
        Update: {
          active?: boolean
          clinic_id?: string
          color?: string
          created_at?: string
          crm_number?: string | null
          id?: string
          name?: string
          specialty?: string | null
          updated_at?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "doctors_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "doctors_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "doctors_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      notifications: {
        Row: {
          body: string | null
          clinic_id: string
          created_at: string
          data: Json
          id: string
          read: boolean
          title: string
          type: string
          user_id: string
        }
        Insert: {
          body?: string | null
          clinic_id: string
          created_at?: string
          data?: Json
          id?: string
          read?: boolean
          title: string
          type: string
          user_id: string
        }
        Update: {
          body?: string | null
          clinic_id?: string
          created_at?: string
          data?: Json
          id?: string
          read?: boolean
          title?: string
          type?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "notifications_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "notifications_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "notifications_user_id_fkey"
            columns: ["user_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      pipeline_cards: {
        Row: {
          assigned_to: string | null
          clinic_id: string
          contact_id: string
          created_at: string
          due_date: string | null
          id: string
          metadata: Json
          pipeline_id: string
          position: number
          stage_id: string
          title: string | null
          updated_at: string
        }
        Insert: {
          assigned_to?: string | null
          clinic_id: string
          contact_id: string
          created_at?: string
          due_date?: string | null
          id?: string
          metadata?: Json
          pipeline_id: string
          position?: number
          stage_id: string
          title?: string | null
          updated_at?: string
        }
        Update: {
          assigned_to?: string | null
          clinic_id?: string
          contact_id?: string
          created_at?: string
          due_date?: string | null
          id?: string
          metadata?: Json
          pipeline_id?: string
          position?: number
          stage_id?: string
          title?: string | null
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "pipeline_cards_assigned_to_fkey"
            columns: ["assigned_to"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipeline_cards_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipeline_cards_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "pipeline_cards_contact_id_fkey"
            columns: ["contact_id"]
            isOneToOne: false
            referencedRelation: "contacts"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipeline_cards_pipeline_id_fkey"
            columns: ["pipeline_id"]
            isOneToOne: false
            referencedRelation: "pipelines"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipeline_cards_stage_id_fkey"
            columns: ["stage_id"]
            isOneToOne: false
            referencedRelation: "pipeline_stages"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipeline_cards_stage_id_fkey"
            columns: ["stage_id"]
            isOneToOne: false
            referencedRelation: "v_pipeline_funnel"
            referencedColumns: ["stage_id"]
          },
        ]
      }
      pipeline_stages: {
        Row: {
          clinic_id: string
          color: string
          created_at: string
          id: string
          name: string
          pipeline_id: string
          position: number
        }
        Insert: {
          clinic_id: string
          color?: string
          created_at?: string
          id?: string
          name: string
          pipeline_id: string
          position?: number
        }
        Update: {
          clinic_id?: string
          color?: string
          created_at?: string
          id?: string
          name?: string
          pipeline_id?: string
          position?: number
        }
        Relationships: [
          {
            foreignKeyName: "pipeline_stages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipeline_stages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "pipeline_stages_pipeline_id_fkey"
            columns: ["pipeline_id"]
            isOneToOne: false
            referencedRelation: "pipelines"
            referencedColumns: ["id"]
          },
        ]
      }
      pipelines: {
        Row: {
          clinic_id: string
          created_at: string
          id: string
          is_default: boolean
          name: string
          position: number
        }
        Insert: {
          clinic_id: string
          created_at?: string
          id?: string
          is_default?: boolean
          name: string
          position?: number
        }
        Update: {
          clinic_id?: string
          created_at?: string
          id?: string
          is_default?: boolean
          name?: string
          position?: number
        }
        Relationships: [
          {
            foreignKeyName: "pipelines_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipelines_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
        ]
      }
      platform_settings: {
        Row: {
          key: string
          updated_at: string
          value: string | null
        }
        Insert: {
          key: string
          updated_at?: string
          value?: string | null
        }
        Update: {
          key?: string
          updated_at?: string
          value?: string | null
        }
        Relationships: []
      }
      profiles: {
        Row: {
          active_clinic_id: string | null
          avatar_url: string | null
          created_at: string
          full_name: string
          id: string
          is_super_admin: boolean
          updated_at: string
        }
        Insert: {
          active_clinic_id?: string | null
          avatar_url?: string | null
          created_at?: string
          full_name?: string
          id: string
          is_super_admin?: boolean
          updated_at?: string
        }
        Update: {
          active_clinic_id?: string | null
          avatar_url?: string | null
          created_at?: string
          full_name?: string
          id?: string
          is_super_admin?: boolean
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "profiles_active_clinic_id_fkey"
            columns: ["active_clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "profiles_active_clinic_id_fkey"
            columns: ["active_clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
        ]
      }
    }
    Views: {
      v_ai_execution_log: {
        Row: {
          agent_responses: number | null
          clinic_id: string | null
          first_user_message: string | null
          last_message_at: string | null
          session_id: string | null
          started_at: string | null
          total_messages: number | null
          user_messages: number | null
          wa_contact_name: string | null
          wa_phone: string | null
        }
        Relationships: [
          {
            foreignKeyName: "ai_conversation_messages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "ai_conversation_messages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
        ]
      }
      v_appointments_by_day: {
        Row: {
          cancelled: number | null
          clinic_id: string | null
          completed: number | null
          confirmed: number | null
          no_show: number | null
          scheduled_date: string | null
          total: number | null
        }
        Relationships: [
          {
            foreignKeyName: "appointments_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "appointments_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
        ]
      }
      v_dashboard_stats: {
        Row: {
          appointments_month: number | null
          appointments_today: number | null
          cancellations_today: number | null
          clinic_id: string | null
          confirmed_today: number | null
          leads_count: number | null
          new_contacts_month: number | null
          open_chats: number | null
          patients_count: number | null
          resolved_today: number | null
          total_contacts: number | null
          total_unread: number | null
        }
        Relationships: []
      }
      v_pipeline_funnel: {
        Row: {
          card_count: number | null
          clinic_id: string | null
          color: string | null
          pipeline_id: string | null
          pipeline_name: string | null
          position: number | null
          stage_id: string | null
          stage_name: string | null
        }
        Relationships: [
          {
            foreignKeyName: "pipeline_stages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "clinics"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "pipeline_stages_clinic_id_fkey"
            columns: ["clinic_id"]
            isOneToOne: false
            referencedRelation: "v_dashboard_stats"
            referencedColumns: ["clinic_id"]
          },
          {
            foreignKeyName: "pipeline_stages_pipeline_id_fkey"
            columns: ["pipeline_id"]
            isOneToOne: false
            referencedRelation: "pipelines"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Functions: {
      get_active_clinic_id: { Args: never; Returns: string }
      get_ai_execution_logs: {
        Args: { p_clinic_id: string; p_limit?: number; p_offset?: number }
        Returns: {
          agent_responses: number
          first_user_message: string
          last_message_at: string
          session_id: string
          started_at: string
          total_messages: number
          user_messages: number
          wa_contact_name: string
          wa_phone: string
        }[]
      }
      get_ai_session_messages: {
        Args: { p_clinic_id: string; p_session_id: string }
        Returns: {
          content: string
          created_at: string
          role: string
        }[]
      }
      get_available_slots: {
        Args: { p_date: string; p_doctor_id: string }
        Returns: {
          available: boolean
          ends_at: string
          starts_at: string
        }[]
      }
      get_dashboard_metrics: { Args: never; Returns: Json }
      get_my_role: { Args: never; Returns: string }
      has_role: { Args: { required_role: string }; Returns: boolean }
      is_super_admin: { Args: never; Returns: boolean }
      upsert_chat_session: {
        Args: {
          p_clinic_id: string
          p_increment_unread?: boolean
          p_last_message_from_me?: boolean
          p_last_message_text?: string
          p_wa_chat_id: string
          p_wa_contact_name?: string
          p_wa_phone?: string
        }
        Returns: {
          ai_paused: boolean
          ai_paused_until: string | null
          assigned_to: string | null
          clinic_id: string
          contact_id: string | null
          created_at: string
          id: string
          last_message_at: string | null
          last_message_from_me: boolean
          last_message_text: string | null
          metadata: Json
          status: string
          tags: string[]
          unread_count: number
          updated_at: string
          wa_chat_id: string
          wa_contact_name: string | null
          wa_is_group: boolean
          wa_phone: string | null
          wa_profile_pic: string | null
        }
        SetofOptions: {
          from: "*"
          to: "chat_sessions"
          isOneToOne: true
          isSetofReturn: false
        }
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {},
  },
} as const

// ── Convenience aliases ───────────────────────────────────────────────────────
export type Appointment           = Tables<"appointments">
export type AppointmentType       = Tables<"appointment_types">
export type AvailabilityTemplate  = Tables<"availability_templates">
export type Doctor                = Tables<"doctors">
export type Contact               = Tables<"contacts">
export type ContactNote           = Tables<"contact_notes">
export type ChatSession           = Tables<"chat_sessions">
export type ClinicSettings        = Tables<"clinic_settings">
export type AiConversationMessage = Tables<"ai_conversation_messages">
export type DashboardStats        = Tables<"v_dashboard_stats">
export type AppointmentsByDay     = Tables<"v_appointments_by_day">
export type Pipeline              = Tables<"pipelines">
export type PipelineStage         = Tables<"pipeline_stages">
export type PipelineCard          = Tables<"pipeline_cards">
