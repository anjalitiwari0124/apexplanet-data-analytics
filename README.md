# 🎯 ApexPlanet Data Analytics Internship - 30 Days

> **Complete Data Analytics Project**  
> *30-Day Internship Program | ApexPlanet Software Pvt. Ltd.*

---

## 📋 Project Overview

This repository contains the complete solution for all **5 Tasks** of the ApexPlanet Data Analytics Internship. Each task builds upon the previous one, creating a comprehensive data analytics pipeline from raw data to final presentation.

| Task | Topic | Status | Folder |
|------|-------|--------|--------|
| ✅ Task 1 | Foundational Setup & EDA | Complete | [`notebooks/task1_eda.ipynb`](notebooks/) |
| ✅ Task 2 | SQL for Data Extraction | Complete | [`notebooks/task2_sql_integration.ipynb`](notebooks/) |
| ⏳ Task 3 | Data Visualization & Dashboarding | Pending | [`dashboards/`](dashboards/) |
| ⏳ Task 4 | Advanced Analytics (Basic) | Pending | [`notebooks/`](notebooks/) |
| ⏳ Task 5 | Final Report & Presentation | Pending | [`reports/`](reports/) |

---

## 📁 Repository Structure

```
apexplanet-data-analytics/
│
├── README.md                          ← This file
├── requirements.txt                   ← All Python dependencies
│
├── data/                              ← Raw & cleaned datasets
│   └── superstore_cleaned.csv
│
├── notebooks/                           ← Jupyter notebooks (all tasks)
│   ├── task1_eda.ipynb                ← Task 1: EDA & Data Cleaning
│   └── task2_sql_integration.ipynb    ← Task 2: SQL + Python
│
├── scripts/                             ← SQL & Python scripts
│   ├── task1_data_cleaning.py
│   └── task2_queries.sql              ← Task 2: All SQL queries
│
├── database/                            ← SQLite database
│   └── superstore.db
│
├── reports/                             ← Generated reports
│   ├── task1_eda_report.pdf
│   └── task2_sql_results.xlsx         ← Task 2: Excel export
│
├── dashboards/                          ← Dashboard files (Task 3)
│   └── (coming soon)
│
└── images/                              ← All visualizations
    ├── task1/                           ← Task 1 charts
    │   ├── fig1_distributions.png
    │   ├── fig2_categorical_comparisons.png
    │   ├── fig3_correlation_heatmap.png
    │   ├── fig4_time_trends.png
    │   └── fig5_advanced_eda.png
    │
    └── task2/                           ← Task 2 charts
        ├── q1_top_products.png
        ├── q2_monthly_trend.png
        ├── q3_customer_segmentation.png
        ├── q4_regional_targets.png
        ├── q5_profit_margin.png
        ├── q6_discount_impact.png
        ├── q7_shipping_efficiency.png
        ├── q8_quarterly_performance.png
        ├── q9_loss_orders.png
        └── q10_yoy_growth.png
```

---

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- pip (Python package installer)

### Installation
```bash
# Clone the repository
git clone https://github.com/yourusername/apexplanet-data-analytics.git
cd apexplanet-data-analytics

# Install all dependencies
pip install -r requirements.txt
```

---

## 📊 Task Summaries

### ✅ Task 1: Foundational Setup & EDA
**What we did:**
- Set up Python environment with pandas, numpy, matplotlib, seaborn, plotly
- Created synthetic Superstore Sales dataset (9,995 orders, 2014-2017)
- Performed data cleaning: handled missing values, removed duplicates, fixed data types, capped outliers using IQR
- Generated 5 key visualizations: distributions, categorical comparisons, correlation heatmap, time trends, advanced EDA
- Documented 5 key business insights

**Key Findings:**
- Technology dominates with $32.98M in sales
- Discounts reduce average profit by $57 per order
- November is the peak sales month
- South region leads with $15.3M in sales

**Files:**
- Notebook: [`notebooks/task1_eda.ipynb`](notebooks/task1_eda.ipynb)
- Charts: [`images/task1/`](images/task1/)

---

### ✅ Task 2: SQL for Data Extraction
**What we did:**
- Created SQLite database (`superstore.db`) from cleaned data
- Mastered basic SQL: SELECT, WHERE, ORDER BY, GROUP BY, HAVING, JOIN
- Learned advanced SQL: Subqueries, CTEs (WITH clause), Window Functions (ROW_NUMBER, RANK, LAG)
- Integrated Python with SQL using `pandas.read_sql()`
- Answered 10 real business questions with SQL + visualization
- Created reusable database utility function
- Exported all results to Excel

**10 Business Questions Answered:**
1. Top 5 products by sales
2. Monthly sales trend analysis
3. Customer segmentation by spend
4. Regional performance vs targets
5. Profit margin by sub-category
6. Discount impact on profitability
7. Shipping mode efficiency
8. Quarterly performance analysis
9. Loss-making orders identification
10. Year-over-year growth analysis

**Files:**
- Notebook: [`notebooks/task2_sql_integration.ipynb`](notebooks/task2_sql_integration.ipynb)
- SQL Queries: [`scripts/task2_queries.sql`](scripts/task2_queries.sql)
- Database: [`database/superstore.db`](database/superstore.db)
- Excel Results: [`reports/task2_sql_results.xlsx`](reports/task2_sql_results.xlsx)
- Charts: [`images/task2/`](images/task2/)

---

### ⏳ Task 3: Data Visualization & Dashboarding (Coming Soon)
- Create interactive dashboards with Power BI / Tableau
- Build executive dashboard with 6-8 visuals
- Publish and share dashboard link

### ⏳ Task 4: Advanced Analytics (Coming Soon)
- Statistical analysis and hypothesis testing
- Customer segmentation with K-Means clustering
- Basic predictive modeling (Linear/Logistic Regression)

### ⏳ Task 5: Final Report & Presentation (Coming Soon)
- Create 2-page executive summary PDF
- Automate data pipeline with Python script
- Final submission with all deliverables

---

## 🗃️ Database Schema

### Table: `sales` (9,995 rows)
| Column | Type | Description |
|--------|------|-------------|
| Order_ID | TEXT | Unique order identifier |
| Order_Date | DATE | Date order was placed |
| Ship_Date | DATE | Date order was shipped |
| Ship_Mode | TEXT | Shipping method |
| Customer_Name | TEXT | Customer name |
| Segment | TEXT | Customer segment (Consumer/Corporate/Home Office) |
| Country | TEXT | Country |
| City | TEXT | City |
| State | TEXT | State |
| Postal_Code | INTEGER | ZIP code |
| Region | TEXT | Sales region (West/East/Central/South) |
| Product_ID | TEXT | Product identifier |
| Category | TEXT | Product category (Furniture/Office Supplies/Technology) |
| Sub_Category | TEXT | Product sub-category |
| Product_Name | TEXT | Product name |
| Sales | REAL | Sales amount |
| Quantity | INTEGER | Units sold |
| Discount | REAL | Discount percentage |
| Profit | REAL | Profit amount |

### Table: `region_managers` (Lookup table)
| Column | Type | Description |
|--------|------|-------------|
| Region | TEXT | Sales region |
| Manager | TEXT | Region manager name |
| Target_Sales | REAL | Sales target |

---

## 🛠️ Technologies Used

| Category | Tools |
|----------|-------|
| **Language** | Python 3.12 |
| **Database** | SQLite (built-in) |
| **Data Analysis** | pandas, numpy |
| **Visualization** | matplotlib, seaborn, plotly |
| **Notebook** | Jupyter |
| **Excel Export** | openpyxl |
| **Dashboard** | Power BI / Tableau (Task 3) |

---

## 📹 Video Demos

| Task | LinkedIn Video |
|------|----------------|
| Task 1 | [Link to LinkedIn post] |
| Task 2 | [Link to LinkedIn post] |
| Task 3 | Coming soon |
| Task 4 | Coming soon |
| Task 5 | Coming soon |

---

## 📝 Key Learnings

1. **Data Cleaning**: Handling missing values, duplicates, outliers, and data type conversions
2. **Exploratory Data Analysis**: Statistical summaries, distributions, correlations, trends
3. **SQL Fundamentals**: SELECT, WHERE, ORDER BY, GROUP BY, HAVING, JOIN
4. **Advanced SQL**: Subqueries, CTEs, Window Functions for complex analysis
5. **Python + SQL Integration**: Using pandas to bridge SQL extraction and Python analysis
6. **Business Intelligence**: Translating raw data into actionable insights
7. **Data Visualization**: Creating charts that tell a story

---

## 🤝 Connect With Me


## 📄 License

This project is part of the **ApexPlanet Software Pvt. Ltd.** Internship Program.

---

> **Internship Progress**: 2/5 Tasks Complete (40%)  
> **Last Updated**: July 2026  
> **Next Task**: Task 3 - Data Visualization & Dashboarding

---

*Made with ❤️ for ApexPlanet Data Analytics Internship*
