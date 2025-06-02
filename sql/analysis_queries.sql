drop table if exists nhs_ae_data;

-- create table schema
create table nhs_ae_data(
	month DATE,
	provider_code VARCHAR(10),
	provider_name TEXT,
	type1_attendances INTEGER,
	type2_attendances INTEGER,
	type3_attendances INTEGER,
	type23_attendances INTEGER,
	total_attendances INTEGER,
	over_4hr_waits INTEGER,
	pct_within_4hrs NUMERIC(5,2),
	admissions INTEGER
);

-- ** Quick view of the data **
select * from nhs_ae_data limit 10
;

-- ** Count the total number of rows **
select count(*) as total_rows from nhs_ae_data;

-- ** Peek at the Unique Trusts **
select distinct provider_name
from nhs_ae_data
order by provider_name;

-- summary stats
select 
	min(month) as earliest_month,
	max(month) as latest_month,
	count(distinct provider_name) as total_providers,
	count(*) as total_rows
from
	nhs_ae_data;

-- National totals
select 
	sum(type1_attendances) as total_type1,
	sum(type23_attendances) as total_type23,
	sum(total_attendances) as national_attendances,
	round(Avg(pct_within_4hrs),2) as avg_pct_within_4hrs
from nhs_ae_data;

-- attendance per trust(top 10)
select
	provider_name,
	total_attendances,
	pct_within_4hrs
from nhs_ae_data 
order by total_attendances desc 
limit 10;

-- Trust with lowest 4-hour compliance
select
	provider_name,
	pct_within_4hrs,
	over_4hr_waits,
	total_attendances
from nhs_ae_data
order by pct_within_4hrs asc 
limit 10;

-- calculate % of patients who waited more than 4 hours
SELECT 
    provider_name,
    ROUND(over_4hr_waits::decimal / NULLIF(total_attendances, 0) * 100, 2) AS pct_over_4hr 
    -- NULLIF(total_attendances, 0) turns a 0 into NULL, which prevents division by zero
FROM nhs_ae_data
WHERE total_attendances IS NOT NULL AND over_4hr_waits IS NOT NULL
ORDER BY pct_over_4hr desc nulls last -- Push NULLs to the bottom
LIMIT 10;

-- Alternative version using CASE WHEN for clarity
-- select
--	provider_name,
--	case 
--	  when total_attendances > 0
--	  then ROUND(over_4hr_waits::decimal / total_attendances * 100, 2)
--	  else null
--	end as pct_over_4hrs
--from nhs_ae_data 
--order by pct_over_4hrs desc nulls last
--limit 10; 


-- view and export data for dashboard building
select
	month,
	provider_code,
	provider_name,
	type1_attendances,
	type2_attendances,
	type3_attendances,
	type23_attendances,
	total_attendances,
	over_4hr_waits,
	Round(over_4hr_waits::decimal / nullif(total_attendances , 0) * 100, 2) as pct_over_4hrs,
	pct_within_4hrs,
	admissions
from nhs_ae_data 
where over_4hr_waits is not null 
	and total_attendances is not null;
	
-- Key performance indicators(KPI)
-- 198 total providers is inclusive of providers with null pct_with_4hrs and zero total attendances
select
	count(distinct provider_name) as total_providers,
	sum(over_4hr_waits) as over_4hr_total,
	sum(total_attendances) as national_attendance
from nhs_ae_data;

-- Actual total providers reporting
select
	count(distinct provider_name) as total_providers,
	sum(over_4hr_waits) as over_4hr_total,
	sum(total_attendances) as national_attendance
from nhs_ae_data
where
	over_4hr_waits is not null 
	and pct_within_4hrs is not null
	and total_attendances is not null
	and total_attendances > 0;

-- to confirm null pct_with_4hrs and zero total attendances(can also be filtered out in Tableau)
select
	provider_name,
	pct_within_4hrs,
	Round(over_4hr_waits::decimal / nullif(total_attendances , 0) * 100, 2) as pct_over_4hrs,
	total_attendances
from nhs_ae_data
where
	pct_within_4hrs is null;

-- Alternative version view and export data for dashboard building
-- filters out null pct_with_4hrs and zero total attendances
--select
--	month,
--	provider_code,
--	provider_name,
--	type1_attendances,
--	type2_attendances,
--	type3_attendances,
--	type23_attendances,
--	total_attendances,
--	over_4hr_waits,
--	Round(over_4hr_waits::decimal / nullif(total_attendances , 0) * 100, 2) as pct_over_4hrs,
--	pct_within_4hrs,
--	admissions
--from nhs_ae_data 
--where 
--	over_4hr_waits is not null 
--	and pct_within_4hrs is not null
--	and total_attendances is not null
--	and total_attendances > 0;

