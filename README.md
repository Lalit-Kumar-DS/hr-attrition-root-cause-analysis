# 🚀 HR Attrition Analytics Dashboard

## 📑 Table of Contents
- [Overview](#-overview)
- [Workflow](#-workflow)
  - [Data Processing (Python)](#1-data-processing-python)
  - [Database Analysis (PostgreSQL)](#2-database-analysis-postgresql)
  - [Visualization (Power-BI)](#3-visualization-power-bi)
- [Key Insights](#-key-insights)
- [Recommendations](#-recommendations)
- [Outcome](#-outcome)
- [Tech Stack](#-tech-stack)
- [Repository Structure](#-repository-structure)
- [Data Source](#-data-source)
- [Author](#-author)

---

## 📊 Overview
This project is an end-to-end HR Analytics solution designed to analyze employee attrition and uncover key drivers behind workforce turnover.  
It combines **Excel Power Query, Python, PostgreSQL, and Power BI** to clean, process, analyze, and visualize data from 4,410 employees.

---

## 🛠 Workflow


### 1. Data Processing (Python)
- Loaded dataset into Jupyter Notebook via Anaconda.
- Handled missing values (imputation), validated consistency, corrected naming conventions.
- Reformatted indexes and categorical variables.
- Exported cleaned dataset for database integration.

### 2. Database Analysis (PostgreSQL)
- Loaded processed dataset into PostgreSQL.
- Created **temporary tables** for optimization and faster queries.
- Ran SQL queries to analyze attrition drivers:
  - Age band → highest attrition among 18–25 (35.7%).
  - Department → HR attrition at 30%, highest overall.
  - Salary hikes → no strong correlation with attrition.
  - Training & travel → low training and frequent travel linked to exits.
- Identified **business problems**: retention challenges not solved by salary hikes alone.

### 3. Visualization (Power BI)
- Connected Power BI directly to PostgreSQL.
- Pulled in temporary tables for optimized reporting.
- Built KPIs:
  - Attrition Rate: 16.12%
  - Avg Job Satisfaction: 2.73
  - Avg Income: 65K
  - Avg Age: 36.9
  - Total Employees: 4,410
- Created visuals:
  - Attrition by Age Band, Department, Marital Status.
  - Scatter plot (Salary Hike % vs Attrition).
  - Training & Business Travel impact.
- Designed dashboard to **tell a story**: attrition is driven by engagement, training, and work-life balance, not just pay.

---

## 🔎 Key Insights
- Young employees (18–25) have the highest attrition (35.7%).
- HR department attrition is 30%, double that of R&D and Sales.
- Salary hikes alone don’t reduce attrition.
- Employees with 0–1 trainings and frequent travelers are more likely to leave.
- Single employees show 50% attrition compared to married employees.

---

## 🎯 Recommendations
- **Mentorship programs** for young employees.
- **Workload review** and recognition for HR staff.
- **Mandatory training hours** to increase engagement.
- **Travel policy adjustments** to reduce burnout.
- **Engagement programs** for single employees.

---

## 🏆 Outcome
By acting on these insights, attrition could be reduced from **16% → under 5%**, stabilizing HR and young talent while creating a holistic retention strategy beyond salary hikes.

---

## 🛠 Tech Stack
- **Python (Pandas, sqlalchemy)** → Data cleaning, imputation, validation, EDA.
- **PostgreSQL** → Data storage, optimization with temp tables, SQL analysis.
- **Power BI** → Visualization, storytelling, KPI reporting.

---

## 📂 Repository Structure

HR-Attrition-Analytics/

```
│
├── data/
│   ├── raw/                
│
├── scripts/
│   ├── sql/                # SQL queries
│   └── python/             # Python scripts (cleaning, EDA, visualization)
│
├── dashboard/
│   └── HR_Analytics_Dashboard.pbix
│
├── images/
│   └── dashboard_screenshots.png
│
└── README.md
```


---

## 📌 Data Source
The dataset used in this project is publicly available on Kaggle:  
[HR Analytics Case Study Dataset](https://www.kaggle.com/datasets/vjchoudhary7/hr-analytics-case-study/data)

It contains three CSV files:
- `employee_survey_data.csv`
- `general_data.csv`
- `manager_survey_data.csv`

These files were combined, cleaned, and processed through Python, and PostgreSQL before being visualized in Power BI.

## Author

**Lalit Kumar**  
- B.Tech. in AI & Data Science (2023–2026)  
- Diploma in Computer Science (2020–2023)  
- Aspiring Data Analyst | Data Scientist Enthusiast  
- Skilled in SQL (PostgreSQL), Excel (Pivot Tables, Charts, Data Cleaning), Power BI (DAX basics), and Statistics, Python.
 

📫 Reach me at: [LinkedIn](https://www.linkedin.com/in/lalit-kumar-d05-ds/) | Email: lkk11002003@gmail.com
