# 🏥 NHS A\&E SQL Analysis (March 2025 – UK Public Health)

📌 **Project Overview**
This project analyzes NHS A&E (Accident & Emergency) activity and performance across England for March 2025. Using SQL and Tableau, I extracted insights from official NHS data to assess operational pressures, performance against the 4-hour wait target, and identify top and underperforming providers. This case study mirrors real-world public sector analysis with a strong focus on data storytelling and executive dashboards.

---

## 🔍 Business Questions

* 📈 Which NHS providers handled the highest A\&E volumes?
* ⏱️ How many patients waited more than 4 hours?
* ❗ Which providers had the lowest compliance with the 4-hour target?
* 📊 Are there any patterns between volume and performance?
* 👥 How many providers reported valid A&E data for the month?

---

## 🛠️ Tools & Technologies

* **PostgreSQL** – data import and SQL analysis
* **DBeaver** – query editor and schema management
* **Excel** – raw data cleanup and CSV export
* **Tableau Public** – interactive dashboard
* **Git & GitHub** – version control and project sharing

---

## 📊 Project Workflow

### 1. **Data Source**

* 📦 Source: [NHS England – A\&E Attendances and Emergency Admissions](https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/)
* 📅 Time frame: **March 2025**
* 📄 Sheet used: `Provider Level Data`
* 📥 Raw format: `.xls`, cleaned and converted to `.csv`

### 2. **Data Cleaning (Excel)**

* Removed footnotes, headers, and summary rows
* Renamed columns using `snake_case`
* Added `month` column manually (since it was implied, not explicit)
* Cleaned out providers with all metrics = NULL or zero

### 3. **SQL Analysis (PostgreSQL)**

* Created `nhs_ae_data` table via DBeaver
* Imported cleaned CSV
* Filtered out `total_attendances = 0` and `NULL` performance rows
* Calculated:

  * `pct_over_4hrs` = % of patients waiting > 4hrs
  * `total_providers_reporting` = 188 (out of 198 original)

Sample query:

```sql
SELECT 
  provider_name,
  ROUND(over_4hr_waits::decimal / NULLIF(total_attendances, 0) * 100, 2) AS pct_over_4hr
FROM nhs_ae_data
WHERE total_attendances > 0 AND pct_within_4hrs IS NOT NULL
ORDER BY pct_over_4hr DESC
LIMIT 10;
```

---

## 📈 Tableau Dashboard

### 🔗 **Live Dashboard**:

🌐 [View on Tableau Public](https://public.tableau.com/views/NHSAEPerformance-March2025SQLTableau/nhs_ae_march_2025)

### 📊 Key Features:

* ✅ KPI Cards:

  * AVG % Seen Within 4hrs: **81.1%**
  * Total Attendances: **2.39M**
  * Over-4hr Waits: **597,748**
  * Reporting Providers: **188**
* 📌 Top 10 NHS Trusts by Attendance
* 🚨 Bottom 10 by 4-Hour Compliance
* 🎛 Interactive filters:

  * 4-hour % compliance
  * Attendance volume

### 🎨 Design Notes:

* Color intensity used to reflect performance
* Tooltips show volume and breach % together
* Providers with no data excluded for clarity

---

## 🧠 Key Findings

* 👥 Manchester, Barts, and Royal Free were the busiest trusts
* ⚠ Some trusts had <60% compliance with the 4-hour target
* 📉 10 providers had zero attendances and were excluded from final reporting
* ✅ Only 188 out of 198 trusts submitted valid data for March 2025

---

## 📂 Project Structure

```
nhs-ae-sql-analysis/
│
├── data/
│   ├── raw/
│   │   └── march_2025_ae_raw.xls
│   └── processed/
│       └── march_2025_ae_cleaned.csv
│
├── sql/
│   └── analysis_queries.sql
│   
│
├── dashboard/
│   ├── nhs_ae_dashboard.twbx
│   └── ae_sql_insights.csv
│
├── visuals/
│   └── dashboard_preview.png  ← (screenshots)
│
└── README.md
```

---

## 🚀 Future Improvements

* Add historical data (e.g. monthly trend analysis)
* Join with regional/geospatial NHS data
* Add patient outcome metrics (if available)
* Publish a multi-page Tableau story

---

## 📬 Let’s Connect

Interested in collaborating or giving feedback?
Explore more projects at: [github.com/Larry0615](https://github.com/Larry0615)

---
