drop table if exists events cascade;
drop table if exists teams cascade;
drop table if exists targets cascade;
drop table if exists spass_types cascade;
drop table if exists requests cascade;
drop table if exists event_types cascade;

create schema if not exists import;
drop table if exists import.master_plan;
create table import.master_plan(
start_time_utc text,
duration text,
date text,
team text,
spass_type text,
target text,
request_name text,
library_definition text,
title text,
description text
);

drop table if exists events;
create table events(
id serial primary key,
time_stamp timestamptz not null,
title varchar(500),
description text,
event_type_id int references event_types(id),
target_id int references targets(id),
team_id int references teams(id),
request_id int references requests(id),
spass_type_id int references spass_types(id)
);
