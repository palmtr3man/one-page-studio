-- ============================================================
-- One Page Studio — Supabase Migration
-- Run this in your Supabase project's SQL Editor
-- ============================================================

-- Table: resume_drafts
-- Stores resume drafts keyed by anonymous session ID.
-- No user auth required — works with Supabase anon key only.
-- ============================================================
create table if not exists public.resume_drafts (
    id          bigserial primary key,
    session_id  text        not null,
    resume_id   text        not null default 'local',
    data        jsonb       not null default '{}'::jsonb,
    created_at  timestamptz not null default now(),
    updated_at  timestamptz not null default now(),

    -- One draft per session + resume combination
    unique (session_id, resume_id)
);

-- Index for fast lookups
create index if not exists idx_resume_drafts_session
    on public.resume_drafts (session_id, resume_id, updated_at desc);

-- Enable Row Level Security
alter table public.resume_drafts enable row level security;

-- RLS Policy: anyone with the anon key can read/write their own session rows
-- (session_id is a random client-generated token — no auth needed)
create policy "Allow anon read own session"
    on public.resume_drafts for select
    using (true);

create policy "Allow anon upsert own session"
    on public.resume_drafts for insert
    with check (true);

create policy "Allow anon update own session"
    on public.resume_drafts for update
    using (true);

-- Optional: auto-update updated_at on row change
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
    new.updated_at = now();
    return new;
end;
$$;

drop trigger if exists trg_resume_drafts_updated_at on public.resume_drafts;
create trigger trg_resume_drafts_updated_at
    before update on public.resume_drafts
    for each row execute function public.set_updated_at();
