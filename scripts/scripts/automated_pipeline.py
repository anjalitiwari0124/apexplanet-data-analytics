

```python
"""
================================================================================
AUTOMATED DATA ANALYTICS PIPELINE
ApexPlanet Data Analytics Internship - Task 5
================================================================================

This script automates the entire 5-task pipeline:
  Task 1: Data Cleaning
  Task 2: SQL Database Creation & Querying
  Task 3: Data Visualization
  Task 4: Advanced Analytics (Statistics, ML)
  Task 5: Executive Report Generation

USAGE:
    python automated_pipeline.py --input data/superstore.csv --output reports/

AUTHOR:Anjali Tiwari( Data Analytics Intern)
DATE: 2026
================================================================================
"""

import pandas as pd
import numpy as np
import sqlite3
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime
import os
import argparse
import warnings
warnings.filterwarnings('ignore')

plt.style.use('default')
sns.set_palette("husl")


class DataAnalyticsPipeline:
    def __init__(self, input_path, output_dir):
        self.input_path = input_path
        self.output_dir = output_dir
        self.df = None
        self.conn = None
        self.db_path = os.path.join(output_dir, 'database', 'superstore.db')
        self.reports_dir = os.path.join(output_dir, 'reports')
        self.images_dir = os.path.join(output_dir, 'images')
        self.log_file = os.path.join(output_dir, 'pipeline_log.txt')
        
        for d in [self.output_dir, os.path.dirname(self.db_path), 
                  self.reports_dir, self.images_dir]:
            os.makedirs(d, exist_ok=True)
        
        self.log("=" * 70)
        self.log("AUTOMATED PIPELINE STARTED")
        self.log(f"Input: {input_path}")
        self.log(f"Output: {output_dir}")
        self.log("=" * 70)
    
    def log(self, message):
        timestamp = datetime.now().strftime('%H:%M:%S')
        log_msg = f"[{timestamp}] {message}"
        print(log_msg)
        with open(self.log_file, 'a') as f:
            f.write(log_msg + "\n")
    
    def task1_data_cleaning(self):
        self.log("\nTASK 1: DATA CLEANING")
        self.df = pd.read_csv(self.input_path)
        initial_rows = len(self.df)
        
        # Handle missing values
        self.df.fillna({'Region': 'Unknown', 'Ship_Mode': 'Standard Class'}, inplace=True)
        self.df.dropna(subset=['Sales', 'Quantity', 'Profit'], inplace=True)
        
        # Remove duplicates
        self.df.drop_duplicates(inplace=True)
        
        # Fix types
        if 'Order_Date' in self.df.columns:
            self.df['Order_Date'] = pd.to_datetime(self.df['Order_Date'])
        
        # Outlier treatment
        for col in ['Sales', 'Profit']:
            Q1 = self.df[col].quantile(0.25)
            Q3 = self.df[col].quantile(0.75)
            IQR = Q3 - Q1
            self.df[col] = self.df[col].clip(Q1 - 1.5*IQR, Q3 + 1.5*IQR)
        
        cleaned_path = os.path.join(self.output_dir, 'data', 'superstore_cleaned.csv')
        os.makedirs(os.path.dirname(cleaned_path), exist_ok=True)
        self.df.to_csv(cleaned_path, index=False)
        self.log(f"Cleaned: {initial_rows} -> {len(self.df)} rows")
        self.log("TASK 1 COMPLETE")
        return cleaned_path
    
    def task2_sql_extraction(self):
        self.log("\nTASK 2: SQL EXTRACTION")
        os.makedirs(os.path.dirname(self.db_path), exist_ok=True)
        self.conn = sqlite3.connect(self.db_path)
        self.df.to_sql('sales', self.conn, if_exists='replace', index=False)
        
        queries = {
            'top_products': "SELECT Product_Name, SUM(Sales) as Total FROM sales GROUP BY Product_Name ORDER BY Total DESC LIMIT 5",
            'monthly_sales': "SELECT strftime('%Y-%m', Order_Date) as Month, SUM(Sales) as Sales FROM sales GROUP BY Month",
            'category_perf': "SELECT Category, SUM(Sales) as Sales, SUM(Profit) as Profit FROM sales GROUP BY Category"
        }
        
        for name, query in queries.items():
            result = pd.read_sql(query, self.conn)
            result.to_csv(os.path.join(self.reports_dir, f'sql_{name}.csv'), index=False)
            self.log(f"Query '{name}' executed")
        
        self.log("TASK 2 COMPLETE")
    
    def task3_visualization(self):
        self.log("\nTASK 3: VISUALIZATION")
        os.makedirs(self.images_dir, exist_ok=True)
        
        # Sales trend
        monthly = self.df.groupby(self.df['Order_Date'].dt.to_period('M'))['Sales'].sum()
        monthly.index = monthly.index.to_timestamp()
        fig, ax = plt.subplots(figsize=(10, 5))
        ax.plot(monthly.index, monthly.values, color='#007bff')
        ax.set_title('Monthly Sales Trend')
        plt.tight_layout()
        plt.savefig(os.path.join(self.images_dir, 'sales_trend.png'))
        plt.close()
        
        # Category bar
        cat_data = self.df.groupby('Category')['Sales'].sum().sort_values()
        fig, ax = plt.subplots(figsize=(8, 5))
        ax.barh(cat_data.index, cat_data.values, color=['#fd7e14', '#28a745', '#007bff'])
        ax.set_title('Sales by Category')
        plt.tight_layout()
        plt.savefig(os.path.join(self.images_dir, 'category_sales.png'))
        plt.close()
        
        self.log("Charts saved to images/")
        self.log("TASK 3 COMPLETE")
    
    def task4_advanced_analytics(self):
        self.log("\nTASK 4: ADVANCED ANALYTICS")
        from sklearn.cluster import KMeans
        from sklearn.preprocessing import StandardScaler
        
        # Customer segmentation
        customer_data = self.df.groupby('Customer_Name').agg({
            'Sales': 'sum', 'Profit': 'sum', 'Order_ID': 'count'
        }).rename(columns={'Order_ID': 'Orders'})
        
        scaler = StandardScaler()
        scaled = scaler.fit_transform(customer_data)
        kmeans = KMeans(n_clusters=4, random_state=42, n_init=10)
        customer_data['Segment'] = kmeans.fit_predict(scaled)
        customer_data.to_csv(os.path.join(self.reports_dir, 'customer_segments.csv'))
        
        self.log("4 customer segments identified")
        self.log("TASK 4 COMPLETE")
    
    def task5_final_report(self):
        self.log("\nTASK 5: FINAL REPORT")
        total_sales = self.df['Sales'].sum()
        total_profit = self.df['Profit'].sum()
        
        report = f"""EXECUTIVE SUMMARY
Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
Total Sales: ${total_sales:,.2f}
Total Profit: ${total_profit:,.2f}
Orders: {len(self.df):,}
Customers: {self.df['Customer_Name'].nunique()}

RECOMMENDATIONS:
1. Reduce discounts >20%
2. Focus on West region
3. Promote Technology products
4. VIP customer retention program
5. Automate monthly reporting
"""
        report_path = os.path.join(self.reports_dir, 'executive_summary.txt')
        with open(report_path, 'w') as f:
            f.write(report)
        
        self.log(f"Report saved: {report_path}")
        self.log("TASK 5 COMPLETE")
    
    def run_full_pipeline(self):
        self.log("\nSTARTING FULL PIPELINE")
        start_time = datetime.now()
        
        try:
            self.task1_data_cleaning()
            self.task2_sql_extraction()
            self.task3_visualization()
            self.task4_advanced_analytics()
            self.task5_final_report()
            
            duration = (datetime.now() - start_time).total_seconds()
            self.log(f"\nPIPELINE COMPLETE in {duration:.1f} seconds")
            return True
        except Exception as e:
            self.log(f"\nPIPELINE FAILED: {str(e)}")
            return False
        finally:
            if self.conn:
                self.conn.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Automated Data Analytics Pipeline')
    parser.add_argument('--input', type=str, default='data/superstore.csv')
    parser.add_argument('--output', type=str, default='output/')
    args = parser.parse_args()
    
    pipeline = DataAnalyticsPipeline(args.input, args.output)
    success = pipeline.run_full_pipeline()
    print("\nSuccess!" if success else "\nFailed!")
