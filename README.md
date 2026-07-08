# 🎯 ApexPlanet Data Analytics Internship

**Company:** ApexPlanet Software Pvt. Ltd.  
**Program:** Data Analytics Internship (30 Days)  
**Intern:** Anjali Tiwari  

---

## 📋 Project Structure

```
apexplanet-data-analytics/
├── data/                   # Raw and cleaned datasets
│   └── superstore_cleaned.csv
├── notebooks/              # Jupyter notebooks for analysis
│   └── Task1_EDA.ipynb
├── scripts/                # Python utility scripts
├── reports/                # Generated visualizations and reports
│   ├── fig1_distributions.png
│   ├── fig2_categorical_comparisons.png
│   ├── fig3_correlation_heatmap.png
│   ├── fig4_time_trends.png
│   └── fig5_advanced_eda.png
├── dashboards/             # Dashboard files (Power BI/Tableau)
└── requirements.txt        # Python dependencies
```

---

## ✅ Task 1: Foundational Setup & Exploratory Data Analysis (EDA)

**Timeline:** 6 Days  
**Dataset:** Superstore Sales (2014-2017)

### What was accomplished:

| Step | Description | Status |
|------|-------------|--------|
| 1 | Environment Setup (Anaconda, Jupyter, Libraries) | ✅ |
| 2 | Data Loading | ✅ |
| 3 | Data Cleaning | ✅ |
| 4 | Exploratory Data Analysis | ✅ |
| 5 | Visualizations | ✅ |
| 6 | Key Insights Documentation | ✅ |

### Data Cleaning Steps:
- ✅ Handled 201 missing postal codes (filled with state-wise median)
- ✅ Removed 49 duplicate rows
- ✅ Fixed data types (dates, categories)
- ✅ Detected and capped outliers using IQR method
- ✅ Added derived columns (Year, Month, Quarter, DayOfWeek, Shipping_Days)

### 5 Key Insights:

1. **Technology dominates** with $32.98M in total sales
2. **Art has highest profit margin** (5.68%), Supplies lowest (3.18%)
3. **South region leads** ($15.3M), Central trails ($14.1M)
4. **Discounts hurt profit** - avg profit drops by $57 with discounts
5. **November is peak month** - prepare for seasonal demand

### Visualizations Generated:
1. 📊 Distribution Analysis (Histograms & Boxplots)
2. 📊 Categorical Comparisons (Bar Charts)
3. 📊 Correlation Heatmaps
4. 📊 Time Trends (Line Charts)
5. 📊 Advanced EDA (Scatter, Profit Margin, Discount Impact)

---

## 🚀 Getting Started

### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/apexplanet-data-analytics.git
cd apexplanet-data-analytics

# Create virtual environment
python -m venv venv

# Activate virtual environment
# Windows:
venv\Scripts\activate
# Mac/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Launch Jupyter Notebook
jupyter notebook notebooks/Task1_EDA.ipynb
```

---

## 📦 Dependencies

- pandas >= 1.5.0
- numpy >= 1.21.0
- matplotlib >= 3.5.0
- seaborn >= 0.12.0
- plotly >= 5.10.0
- jupyter >= 1.0.0
- openpyxl >= 3.0.10

---

## 📊 Dataset Information

- **Records:** 9,995 transactions
- **Date Range:** January 2014 - December 2017
- **Categories:** Furniture, Office Supplies, Technology
- **Regions:** Central, East, South, West
- **Segments:** Consumer, Corporate, Home Office

---

## 📅 Upcoming Tasks

| Task | Description | Timeline |
|------|-------------|----------|
| 2 | SQL for Data Extraction | 7 Days |
| 3 | Data Visualization & Dashboarding | 7 Days |
| 4 | Advanced Analytics (Basic) | 6 Days |
| 5 | Final Report, Automation & Presentation | 4 Days |

---

## 🔗 Links

- **Company:** [ApexPlanet Software Pvt. Ltd.](https://www.apexplanet.in)
- **LinkedIn Post:** [Task 1 Complete](#)

---

## 📝 License

This project is created for educational purposes as part of the ApexPlanet Data Analytics Internship program.

---

**Thank you for visiting! ⭐ Star this repo if you found it helpful.**
