CREATE TABLE predictive_maintenance(
	udi INT,
	product_id VARCHAR(20),
	type VARCHAR(5),
	air_temperature FLOAT,
	process_temperature FLOAT,
	rotational_speed INT,
	torque FLOAT,
	tool_wear INT,
	machine_failure INT,
	twf INT,
	hdf INT,
	pwf INT,
	osf INT,
	rnf INT
);

select count(*) from predictive_maintenance;

select count(*) from predictive_maintenance
where machine_failure = 1;

select
	case
		when twf = 1 then 'Tool Wear Failure'
		when hdf = 1 then 'Heat Dissipation Failure'
		when pwf = 1 then 'Power Failure'
		when osf = 1 then 'Overstrain Failure'
		when rnf = 1 then 'Random Failure'
		else 'No Failure'
	end as failure_type,
	count(*)
from predictive_maintenance
group by failure_type
order by count(*) desc;

select
	count(*) as total_records,
	SUM(machine_failure) as total_failures,
	round((sum(machine_failure)::numeric / count(*)) * 100, 2) as failure_rate_percent
from predictive_maintenance;

select
	type,
	count(*) as total_cycles,
	sum(machine_failure) as total_failures,
	round((sum(machine_failure)::numeric / count(*)) * 100, 2) as failure_rate_percent
from predictive_maintenance
group by type
order by failure_rate_percent desc;

select
	machine_failure,
	round(avg(air_temperature)::numeric,2) as avg_air_temp,
	round(avg(process_temperature)::numeric,2) as avg_process_temp,
	round(avg(rotational_speed)::numeric,2) as avg_rot_speed,
	round(avg(torque)::numeric,2) as avg_torque,
	round(avg(tool_wear)::numeric,2) as avg_tool_wear
from predictive_maintenance
group by machine_failure;

select
	case
		when tool_wear between 0 and 50 then '0-50'
		when tool_wear between 51 and 100 then '51-100'
		when tool_wear between 101 and 150 then '101-150'
		else '150+'
	end as tool_wear_bucket,
	count(*) as total_cycles,
	sum(machine_failure) as failures,
	round((sum(machine_failure)::numeric / count(*))*100,2) as failure_rate_percent
from predictive_maintenance
group by tool_wear_bucket
order by tool_wear_bucket;

select
	case
		when tool_wear between 0 and 50 then '0-50'
		when tool_wear between 51 and 100 then '51-100'
		when tool_wear between 101 and 150 then '101-150'
		else '150+'
	end as tool_wear_bucket,
	round(avg(torque)::numeric,2) as avg_torque,
	round(avg(machine_failure)::numeric * 100,2) as failure_rate_percent
from predictive_maintenance
group by tool_wear_bucket
order by tool_wear_bucket;

select
	machine_failure,
	round(avg(torque)::numeric, 2) as avg_torque
from predictive_maintenance
group by machine_failure;

with failure_rows as(
	select
		udi,
		LAG(udi) over (order by udi) as previous_failure_udi
	from predictive_maintenance
	where machine_failure = 1
)
select
	round(avg(udi - previous_failure_udi)::numeric,2) as approx_cycles_between_failures
from failure_rows
where previous_failure_udi is not null;








