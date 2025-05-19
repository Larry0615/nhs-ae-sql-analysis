# 🏥 NHS A&E SQL Analysis (UK Public Health Data)

📌 **Project Overview**  
This project analyzes monthly A&E (Accident & Emergency) activity and performance data from NHS England.  
The goal is to uncover patterns in hospital attendances, wait times, and emergency admissions using SQL-based analysis — and communicate insights through an interactive Tableau dashboard. This project reflects real-world, public-sector analytics with a UK health system focus.

---

🔍 **Business Problem**  
The NHS is under pressure to meet operational targets, especially the 4-hour A&E wait time standard. This project aims to address:

📈 How have A&E attendances changed over time?  
⏱️ How well are hospitals performing against the 4-hour target?  
📍 Which NHS providers or regions perform best or worst?  
❄️ Are there seasonal patterns in attendances or admissions?  
🏥 Which providers experience the greatest pressure?

---

🛠️ **Tools & Technologies**  
- PostgreSQL – for data storage and SQL analysis  
- DBeaver – SQL client for writing and managing queries  
- Excel – for initial data cleaning and CSV conversion  
- Tableau – for interactive dashboards and data storytelling  
- Git & GitHub – for version control and project sharing

---

📊 **Project Workflow**

1. **Data Collection & Cleaning**
   - Source: NHS England – A&E Attendances and Emergency Admissions
   - Cleaned raw `.xls` file in Excel and exported to `.csv`

2. **SQL Table Setup & Data Loading**
   - Created a table schema in PostgreSQL
   - Imported cleaned dataset using DBeaver

3. **SQL Analysis**
   - Monthly A&E attendances by provider
   - Performance trends against 4-hour target
   - Identification of top/bottom performing hospitals
   - Exploration of seasonal and regional trends

4. **Dashboard Development**
   - Designed an interactive Tableau dashboard
   - Integrated SQL summaries into visual narratives
   - Dashboard includes filters for region, provider, and key KPIs

---

🔗 **Data Source**  
[NHS England A&E Statistics](https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/)  
📅 **Time Frame:** March 2025  
(Provider-level performance metrics for all NHS trusts in England)

---

📈 **Key Findings** *(to be added after analysis)*  
🗓️ Trends in A&E attendances and delays  
⚠️ Top trusts consistently missing 4-hour target  
📍 Regional performance variations  
❄️ Winter pressures and monthly spikes  
🏥 Volume-to-performance comparison across providers

---

📢 **Public Sector Recommendations** *(to be added)*  
🚑 Prioritize support for high-volume, underperforming trusts  
📉 Investigate systemic causes of long wait times  
📆 Use temporal insights to adjust seasonal staffing  
📍 Learn from high-performing trusts and regions

---

📂 **Repository Structure**
```
nhs-ae-sql-analysis/
├── data/
│ ├── raw/                        # Original NHS files (.xls)
│ │ └── march_2025_ae_raw.xls
│ └── processed/                  # Cleaned version for import (.csv)
│   └── march_2025_ae_cleaned.csv
│
├── sql/                          # SQL scripts (schema, analysis, insights)
│ ├── create_table.sql
│ └── analysis_queries.sql
│
├── visuals/                      # Static exported charts or figures
│ └── (exported static charts)
│
├── dashboard/                    # Tableau workbook or BI dashboards
│ └── nhs_ae_dashboard.twbx
│
└── README.md
```

---

🚀 **Future Work**
- Expand analysis across multiple months or years  
- Automate SQL transformations and dashboard refresh  
- Add geospatial mapping of provider locations  
- Integrate anomaly detection for outlier wait times

---

📬 **Let’s Connect**  
Interested in collaborating or giving feedback?  
🔗 Explore more projects at: [github.com/Larry0615](https://github.com/Larry0615)
