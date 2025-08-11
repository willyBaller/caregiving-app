-- Seed data for the caregiving app

insert into clients (id, name, dob, primary_language, mobility_level, risk_level)
values (
  uuid_generate_v4(),
  'Jan',
  '1945-06-10',
  'English',
  'Moderate',
  'Medium'
);

-- Insert care plan for Jan
insert into care_plans (id, client_id, version, status, effective_from, created_by)
select uuid_generate_v4(), id, 1, 'active', current_date, null from clients where name = 'Jan';

-- Insert plan item for Tuesday library visit
insert into plan_items (id, care_plan_id, type, title, details, schedule_rule_json, is_active)
select
  uuid_generate_v4(),
  cp.id,
  'routine',
  'Library visit',
  'Jan goes to the library with a friend on Tuesday mornings',
  '{"rrule":"FREQ=WEEKLY;BYDAY=TU;BYHOUR=10;BYMINUTE=0","window":{"start_offset_min":-60,"end_offset_min":120},"required":true,"handover_notes":"Meet Sarah at Central Library. Bring library card."}',
  true
from care_plans cp
join clients c on c.id = cp.client_id
where c.name = 'Jan';
