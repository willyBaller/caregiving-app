-- Schema definition for the caregiving app

create extension if not exists "uuid-ossp";

create table if not exists clients (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  dob date,
  primary_language text,
  mobility_level text,
  risk_level text,
  inserted_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists care_plans (
  id uuid primary key default uuid_generate_v4(),
  client_id uuid references clients(id) on delete cascade,
  version integer not null,
  created_by uuid,
  status text,
  effective_from date,
  effective_to date,
  inserted_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists plan_items (
  id uuid primary key default uuid_generate_v4(),
  care_plan_id uuid references care_plans(id) on delete cascade,
  type text,
  title text not null,
  details text,
  schedule_rule_json jsonb,
  is_active boolean default true,
  inserted_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists shifts (
  id uuid primary key default uuid_generate_v4(),
  client_id uuid references clients(id) on delete cascade,
  caregiver_id uuid,
  start timestamptz not null,
  "end" timestamptz not null,
  status text,
  inserted_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists tasks (
  id uuid primary key default uuid_generate_v4(),
  shift_id uuid references shifts(id) on delete cascade,
  plan_item_id uuid references plan_items(id),
  source text,
  title text not null,
  details text,
  due_time timestamptz,
  required boolean default false,
  status text default 'PENDING',
  inserted_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists progress_reports (
  id uuid primary key default uuid_generate_v4(),
  shift_id uuid references shifts(id) on delete cascade,
  created_by uuid,
  started_at timestamptz,
  submitted_at timestamptz,
  summary text,
  overall_flag text,
  inserted_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists observations (
  id uuid primary key default uuid_generate_v4(),
  progress_report_id uuid references progress_reports(id) on delete cascade,
  domain text,
  value text,
  unit text,
  flag text default 'OK',
  note text,
  template_key text,
  inserted_at timestamptz default now(),
  updated_at timestamptz default now()
);
