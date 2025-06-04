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

-- UPLOAD THE CSV files