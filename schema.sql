
-- Optional real database version for Supabase
create table if not exists matches (id uuid primary key default gen_random_uuid(), team_a text not null, team_b text not null, kickoff timestamptz not null, round text, venue text, final_a int, final_b int, created_at timestamptz default now());
create table if not exists predictions (id uuid primary key default gen_random_uuid(), match_id uuid references matches(id), full_name text not null, phone text not null, apartment text not null, score_a int not null, score_b int not null, created_at timestamptz default now(), unique(match_id, phone, apartment));
create table if not exists draws (id uuid primary key default gen_random_uuid(), match_id uuid references matches(id), winner_prediction_id uuid references predictions(id), created_at timestamptz default now());
