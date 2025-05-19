# 🏥 NHS A&E SQL Analysis (UK Public Health Data)

📌 **Project Overview**  
This project analyzes monthly A&E (Accident & Emergency) activity and performance data from NHS England.  
The goal is to uncover patterns in hospital attendances, wait times, and emergency admissions using SQL-based analysis, and to communicate insights through a Tableau dashboard.

---

🔍 **Business Problem**  
The NHS is under pressure to meet operational targets, particularly the 4-hour A&E wait time standard. This project aims to answer:

📈 How have A&E attendances changed over time?  
⏱️ How well are hospitals performing against the 4-hour target?  
📍 Which NHS providers or regions perform best or worst?  
❄️ Are there seasonal patterns in admissions or waiting times?  
🏥 Which providers are under the most pressure based on volume?

---

🛠️ **Tools & Technologies**  
- PostgreSQL (SQL querying and data analysis)  
- DBeaver (SQL client and database management)  
- Excel (initial data cleanup)  
- Tableau (dashboard development)  
- Git & GitHub (version control and portfolio hosting)

---

📊 **Project Workflow**  
1. **Data Collection & Cleaning**
   - Source: NHS England — A&E Attendances & Emergency Admissions (Provider Level)
   - File: March 2025 monthly `.xls` report
   - Cleaned in Excel and saved as `.csv`

2. **SQL Table Setup & Data Loading**
   - Created schema in PostgreSQL
   - Imported cleaned `.csv` using DBeaver

3. **SQL Analysis**
   - Attendance trends by month and region
   - Performance against 4-hour targets
   - Hospital-level ranking by volume and delays
   - Seasonality and winter surge detection

4. **Data Visualization**
   - Tableau dashboard to showcase:
     - Provider performance
     - Attendance and wait time trends
     - Regional comparisons

---

🔗 **Data Source**  
[NHS England A&E Statistics](https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/)  
Provider-level monthly reports showing attendances, 4-hour waits, and admissions across NHS trusts in England.

---

📈 **Key Findings** *(to be added after analysis)*  
🗓️ Monthly A&E attendance trends  
⚠️ Providers missing the 95% 4-hour target  
📍 Regional outliers in performance  
❄️ Winter surge impact analysis  
📊 Provider clustering based on volume and compliance

---

📢 **Public Sector Recommendations** *(to be updated)*  
🚑 Target underperforming trusts for support  
📉 Analyze the root causes of >4hr waits  
📆 Use monthly patterns for staffing/resource planning  
🏥 Identify best practices from top-performing trusts

---

📂 **Repository Structure**
```
nhs-ae-sql-analysis/
├── data/
│ ├── raw/
│ │ └── march_2025_ae_raw.xls     # Original NHS files (.xls)
│ └── clean/
│ └── march_2025_ae_cleaned.csv   # Cleaned version (.csv)
│
├── sql/                          # SQL scripts (schema, analysis, insights)
│ ├── create_table.sql            
│ └── analysis_queries.sql        
│
├── visuals/                      # Static exported charts
│ └── (charts to be added)
│
├── dashboard/
│ └── nhs_ae_dashboard.twbx       # Tableau workbook or BI dashboards
│
└── README.md
```

---

🚀 **Future Work**
- ✅ Build interactive Tableau dashboard  
- 🔁 Automate cleaning and import process (optional)  
- 🗺️ Add geospatial visualizations using provider location (optional)  
- 📈 Incorporate more months or years of NHS A&E data

---

📬 **Let’s connect**  
Want to collaborate or give feedback?  
📍 See more of my work at: [github.com/Larry0615](https://github.com/Larry0615)
