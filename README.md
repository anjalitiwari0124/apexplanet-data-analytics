# 📊 ApexPlanet Data Analytics Internship — 30 Days

> **Complete Data Analytics Project**  
> *ApexPlanet Software Pvt. Ltd. | 30-Day Internship Program*

---

## 📌 Project Overview

This repository contains all **5 Tasks** of my Data Analytics Internship at **ApexPlanet Software Pvt. Ltd.** Each task builds on the same Superstore Sales Dataset, progressing from data cleaning and exploration to SQL extraction, visualization, advanced analytics, and final presentation.

| Task | Topic | Status | Timeline |
|:----:|-------|:------:|:--------:|
| 1 | Foundational Setup & EDA | ✅ Complete | Day 1–6 |
| 2 | SQL for Data Extraction | ✅ Complete | Day 7–13 |
| 3 | Data Visualization & Dashboarding | ✅ Complete | Day 14–20 |
| 4 | Advanced Analytics (Basic) |✅ Complete | Day 21–26 |
| 5 | Final Report & Presentation | ⏳ Pending | Day 27–30 |

---

## 📁 Dataset

**Superstore Sales Dataset** — 9,995 retail orders with sales, profit, customer, and product details across 4 years (2014–2017).

| Feature | Details |
|---------|---------|
| Records | 9,995 orders |
| Time Period | Jan 2014 – Dec 2017 |
| Categories | Furniture, Office Supplies, Technology |
| Regions | West, East, Central, South |
| Segments | Consumer, Corporate, Home Office |

> 💡 **All 5 tasks use the SAME dataset**, building a complete analytics pipeline from raw data to business insights.

---

## 📊 Task 1 — Foundational Setup & Exploratory Data Analysis (EDA)

### 🎯 Objective
Set up environment, clean data, and perform exploratory analysis on the Superstore Sales Dataset to uncover business insights around sales, profit, and customer behavior.

### 🛠️ Tech Stack
Python, Pandas, NumPy, Matplotlib, Seaborn, Plotly, Jupyter Notebook, Git, GitHub

### 🔧 What Was Done
- Installed and configured Python analytics environment (Anaconda + Jupyter)
- Created project repository structure with GitHub
- Loaded and inspected the Superstore Sales Dataset
- Performed comprehensive data cleaning:
  - Handled missing values (201 postal codes filled using state-wise median)
  - Removed 49 duplicate rows
  - Fixed data types (dates, categories)
  - Capped outliers using IQR method
- Generated 5 key visualizations: distributions, categorical comparisons, correlation heatmap, time trends, advanced EDA
- Documented 5 key business insights with data-backed evidence

### 🔍 Key Business Insights
- 📈 **Sales grew significantly** from 2014 to 2017, with strong upward trend
- 🗓️ **Sales peak in November** due to holiday shopping season
- 🪑 **Furniture category** has high sales but very low profit; Tables and Bookcases operate at a loss
- 💸 **Discounts above 20%** are strongly linked to reduced profitability
- 🌍 **West region** leads in both sales and profit
- 👥 **Consumer segment** makes up ~52% of all orders

### 📁 Deliverables
| File | Description |
|------|-------------|
| `notebooks/Task1_EDA.ipynb` | EDA & data cleaning notebook |
| `scripts/data_cleaning.py` | Data cleaning script |
| `data/superstore_cleaned.csv` | Cleaned dataset |
| `images/task1/` | 5 EDA visualization charts |

---

## 📊 Task 2 — SQL for Data Extraction

### 🎯 Objective
Master SQL queries for data extraction and analysis by integrating SQL with Python for automated business insights.

### 🛠️ Tech Stack
Python, SQLite, SQLAlchemy, Pandas, Jupyter Notebook

### 🔧 What Was Done
- Set up a SQLite database and loaded the cleaned Superstore dataset into it
- Practiced SQL fundamentals: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `GROUP BY`, `HAVING`, `JOIN`
- Explored advanced SQL: Subqueries, CTEs (`WITH` clause), Window Functions (`ROW_NUMBER`, `RANK`, `LAG`), and Views
- Integrated Python with SQLite using `pandas.read_sql()` for seamless data extraction
- Answered **10 business questions** using SQL queries with Python visualization
- Created reusable database utility functions
- Exported all results to Excel for reporting

### 🔍 10 Business Questions Answered
| # | Question | Business Impact |
|:-:|----------|-----------------|
| 1 | What are the top 5 products by sales? | Inventory planning |
| 2 | What is the monthly sales trend? | Seasonal patterns |
| 3 | How are customers segmented by spend? | VIP identification |
| 4 | How are regions performing vs targets? | Performance tracking |
| 5 | Which sub-categories have best/worst profit margins? | Pricing optimization |
| 6 | How do discounts affect profitability? | Strategy evaluation |
| 7 | Which shipping mode is most efficient? | Logistics optimization |
| 8 | How does performance vary by quarter? | Seasonal planning |
| 9 | Which orders lost money and why? | Problem identification |
| 10 | What is the year-over-year growth rate? | Growth tracking |

### 💡 Key Insight
**Discounts are NOT driving profitability.** Orders with no discount average **$302 profit** vs **$201** for high-discount orders — a $101 difference per transaction.

### 📁 Deliverables
| File | Description |
|------|-------------|
| `notebooks/task2_sql_integration.ipynb` | Python + SQL integration notebook |
| `scripts/task2_queries.sql` | All SQL queries (20+ with comments) |
| `database/superstore.db` | SQLite database |
| `images/task2/` | 10 business question charts |

---

## 📊 Task 3 — Data Visualization & Dashboarding

### 🎯 Objective
Create professional dashboards and interactive visualizations to communicate business insights effectively.

### 🛠️ Tech Stack
Python, Matplotlib, Seaborn, Plotly, Power BI / Tableau (data prep)

### 🔧 What Was Done
- Created static visualizations with **Matplotlib** (line, bar, scatter, histogram)
- Built advanced statistical plots with **Seaborn** (heatmap, boxplot, violin, pairplot)
- Developed interactive charts with **Plotly** (line, sunburst, treemap, animated scatter)
- Built **Executive Dashboard** with 6–8 visuals:
  - 4 KPI cards (Total Sales, Profit, Orders, Avg Order Value)
  - Sales trend over time
  - Category breakdown (pie chart)
  - Top products (horizontal bar)
  - Regional performance (grouped bar)
  - Segment analysis
- Created **Interactive Filter Dashboard** with 8 panels
- Prepared datasets for **Power BI / Tableau** with calculated fields

### 🔍 Dashboard Insights
- 🏆 **Technology drives 55.6%** of all sales ($32.9M)
- 📉 **No-discount orders** yield $100+ more profit than discounted ones
- 🚚 **Standard Class** shipping generates highest revenue
- 🗓️ **Q4** consistently shows strongest quarterly performance
- 🌍 **South region** leads with $15.3M in total sales

### 📁 Deliverables
| File | Description |
|------|-------------|
| `notebooks/task3_dashboard.ipynb` | Dashboard creation notebook |
| `dashboards/superstore_for_powerbi.csv` | Power BI / Tableau dataset |
| `dashboards/daily_summary.csv` | Aggregated daily metrics |
| `dashboards/kpi_summary.csv` | Key performance indicators |
| `images/task3/` | 8 dashboard & visualization charts |

---

## 📊 Task 4 — Advanced Analytics (Basic)

### 🎯 Objective
Apply statistical analysis and basic predictive modeling to extract deeper insights.

### 🛠️ Tech Stack
Python, SciPy, Scikit-learn, Statsmodels

### 🔧 Planned Activities
- Descriptive statistics (mean, median, mode, std dev, skewness)
- Hypothesis testing using `scipy.stats`:
  - t-test (compare two groups)
  - chi-square test (categorical relationships)
  - Confidence intervals
- Time Series Analysis (if data has dates):
  - Convert to time series format
  - Resample data (daily/weekly/monthly)
  - Decompose into trend, seasonality, residuals
  - Build simple moving average forecast
- Customer Segmentation (Clustering):
  - Prepare features for clustering (scale using StandardScaler)
  - Apply K-Means clustering
  - Find optimal K using elbow method
  - Visualize clusters using PCA (2D plot)
  - Profile each segment with recommendations
- Basic Predictive Model:
  - Define target variable (e.g., sales, churn)
  - Split data into train/test (80/20)
  - Build Linear Regression (numeric) or Logistic Regression (classification)
  - Evaluate model: R², MAE, RMSE or Accuracy, Precision, Recall
  - Identify top 3 important features

### 📁 Planned Deliverables
| File | Description |
|------|-------------|
| `notebooks/task4_advanced_analytics.ipynb` | Statistical analysis & modeling |
| `images/task4/` | Statistical test results & model charts |

---

## 📊 Task 5 — Final Report, Automation & Presentation

### 🎯 Objective
Create final report, automate pipeline, and submit all deliverables professionally.

### 🛠️ Tech Stack
Python, GitHub Actions, Canva / Google Docs

### 🔧 Planned Activities
- **Day 27**: Executive Summary Report
  - Create 2-page PDF report (Google Docs / Canva)
  - Executive summary (key findings)
  - Dashboard screenshot
  - Top 5 insights with visuals
  - 3 business recommendations
  - Use company branding
- **Day 28–29**: Automate Pipeline
  - Create Python script that loads raw data → cleans → saves processed → calculates KPIs → exports to Excel
  - Schedule using GitHub Actions or Windows Task Scheduler
- **Day 30**: Final Submission
  - Clean GitHub repository (add requirements.txt, final commit tag v1.0.0)
  - Submit to ApexPlanet: LinkedIn link + GitHub link

### 📁 Planned Deliverables
| File | Description |
|------|-------------|
| `reports/final_report.pdf` | 2-page executive summary |
| `scripts/automation_pipeline.py` | Automated data pipeline |
| `.github/workflows/` | GitHub Actions automation |

---

## 🛠️ Complete Tech Stack

| Category | Tools |
|----------|-------|
| **Language** | Python 3.12 |
| **Data Analysis** | Pandas, NumPy |
| **Database** | SQLite, SQLAlchemy |
| **Visualization** | Matplotlib, Seaborn, Plotly |
| **Statistics** | SciPy, Statsmodels |
| **Machine Learning** | Scikit-learn |
| **Notebook** | Jupyter |
| **Excel Export** | OpenPyXL |
| **Version Control** | Git, GitHub |
| **Automation** | GitHub Actions |

---

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- pip (Python package installer)

### Installation
```bash
# Clone the repository
git clone https://github.com/anjalitiwari0124/apexplanet-data-analytics.git
cd apexplanet-data-analytics

# Install all dependencies
pip install -r requirements.txt
```

---

## 📹 Video Demos

| Task | LinkedIn Video |
|------|----------------|
| Task 1 | https://www.linkedin.com/posts/anjali-tiwari-909b49383_dataanalytics-python-eda-activity-7480945522988707840-M3t7?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF6s-dkB2B_DjXx5cOd_ZPvDbaOj8zH2aBQ |
| Task 2 | https://www.linkedin.com/posts/anjali-tiwari-909b49383_dataanalytics-sql-python-activity-7483412976012533761-rusz?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF6s-dkB2B_DjXx5cOd_ZPvDbaOj8zH2aBQ|
| Task 3 | https://www.linkedin.com/posts/anjali-tiwari-909b49383_datavisualization-dashboard-businessintelligence-ugcPost-7485924912898125824-RCDy/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAF6s-dkB2B_DjXx5cOd_ZPvDbaOj8zH2aBQ |
| Task 4 | https://lnkd.in/p/gdt8sP4p|
| Task 5 | Coming soon |

---

## 👤 Author

**Anjali Tiwari** — Data Analytics Intern @ ApexPlanet Software Pvt. Ltd.

- **LinkedIn**:www.linkedin.com/in/anjali-tiwari-909b49383
- **GitHub**:https://github.com/anjalitiwari0124
- **Email**:anjalitiwari.0124@gmail.com

---

## 📄 License

This project is part of the **ApexPlanet Software Pvt. Ltd.** Internship Program.

---

> **Internship Progress**: 4/5 Tasks Complete (80%)  
> **Last Updated**: July 2026  
> **Next Task**: Task 5 — Advanced Analytics (Basic)

---

*Made with ❤️ for ApexPlanet Data Analytics Internship*
