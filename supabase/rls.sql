-- Enable row level security and define simple policies

alter table clients enable row level security;
alter table care_plans enable row level security;
alter table plan_items enable row level security;
alter table shifts enable row level security;
alter table tasks enable row level security;
alter table progress_reports enable row level security;
alter table observations enable row level security;

-- For demonstration purposes, allow full access to authenticated users
-- In production you should restrict these policies based on user roles.
create policy "authenticated can read clients" on clients
  for select using (auth.role() = 'authenticated');

create policy "authenticated can write clients" on clients
  for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

create policy "authenticated can read care_plans" on care_plans
  for select using (auth.role() = 'authenticated');

create policy "authenticated can write care_plans" on care_plans
  for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

create policy "authenticated can read plan_items" on plan_items
  for select using (auth.role() = 'authenticated');

create policy "authenticated can write plan_items" on plan_items
  for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

create policy "authenticated can read shifts" on shifts
  for select using (auth.role() = 'authenticated');

create policy "authenticated can write shifts" on shifts
  for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

create policy "authenticated can read tasks" on tasks
  for select using (auth.role() = 'authenticated');

create policy "authenticated can write tasks" on tasks
  for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

create policy "authenticated can read progress_reports" on progress_reports
  for select using (auth.role() = 'authenticated');

create policy "authenticated can write progress_reports" on progress_reports
  for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

create policy "authenticated can read observations" on observations
  for select using (auth.role() = 'authenticated');

create policy "authenticated can write observations" on observations
  for all using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
