--overview of the data
select * from nhs_ae_data nad limit 10
;
-- check distinct months
select distinct month
from nhs_ae_data
order by month
;
-- count total number of rows/observations
select count(*) as total_rows
from nhs_ae_data nad
;
-- count observations for each month
select month, count(*) as total_month_observation
from nhs_ae_data nad
group by month
order by month
;
-- Query 1: Monthly trend of total A&E attendances
-- Purpose: Used for timeline visualization in Tableau
select month, sum (total_attendances) as total_ae_attendances
from nhs_ae_data nad 
group by month
order by month
;
-- Query 2: Monthly percentage of A&E attendances breaching the 4-hour wait time
-- Purpose: Tracks system-wide performance against NHS targets (for Tableau line chart)
select 
	month, 
	round(sum(over_4hr_waits)::decimal / nullif(sum(total_attendances),0) * 100, 2) as pct_breached
from nhs_ae_data nad 
group by month
order by month
;
-- Query 3: Top 5 NHS trusts with highest breach % per month
-- Purpose: Identify underperforming providers using RANK and CTEs (used for flagging or bar charts in Tableau)
with ranked_trusts as (
	select
		month,
		provider_name,
		round(over_4hr_waits ::decimal / nullif(total_attendances, 0) * 100, 2) as pct_breached,
		rank() over(
		partition by month
		order by over_4hr_waits ::decimal / nullif(total_attendances, 0) DESC) as breach_rank
	from nhs_ae_data
	where total_attendances > 0
)
select * from ranked_trusts
where breach_rank <= 5
order by month, breach_rank
;
-- Query 4: Flag provider performance level based on % breaching 4-hour target
-- Purpose: Categorize trusts as Critical, High, or Acceptable for use in Tableau filters and KPI color coding
select 
	month,
	provider_name,
	total_attendances,
	over_4hr_waits,
	round(over_4hr_waits ::decimal / nullif(total_attendances, 0) * 100, 2) as pct_breached,
	case
		when over_4hr_waits :: decimal / nullif(total_attendances, 0) > 0.4 then 'Critical'
		when over_4hr_waits :: decimal / nullif(total_attendances, 0) > 0.3 then 'High'
		else 'Acceptable'
	end as perfomance_flag
from nhs_ae_data
where total_attendances > 0 -- Excluding rows where total_attendances = 0 to avoid NULL % values
order by month, pct_breached desc;
	

	


