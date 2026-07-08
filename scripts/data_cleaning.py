#!/usr/bin/env python3
"""
Data Cleaning Utility Script
ApexPlanet Data Analytics Internship - Task 1
Author: [Your Name]
Date: 2026-07-06
"""

import pandas as pd
import numpy as np


def detect_outliers_iqr(data, column):
    """
    Detect outliers using the IQR (Interquartile Range) method.

    Parameters:
        data (pd.DataFrame): Input dataframe
        column (str): Column name to check for outliers

    Returns:
        tuple: (outliers_df, lower_bound, upper_bound)
    """
    Q1 = data[column].quantile(0.25)
    Q3 = data[column].quantile(0.75)
    IQR = Q3 - Q1
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR
    outliers = data[(data[column] < lower_bound) | (data[column] > upper_bound)]
    return outliers, lower_bound, upper_bound


def clean_superstore_data(df):
    """
    Clean the Superstore Sales dataset.

    Steps:
        1. Handle missing values
        2. Remove duplicates
        3. Fix data types
        4. Handle outliers
        5. Add derived columns

    Parameters:
        df (pd.DataFrame): Raw dataframe

    Returns:
        pd.DataFrame: Cleaned dataframe
    """
    df_clean = df.copy()

    # 1. Handle missing values
    df_clean['Postal_Code'] = df_clean.groupby('State')['Postal_Code'].transform(
        lambda x: x.fillna(x.median())
    )
    df_clean['Postal_Code'].fillna(df_clean['Postal_Code'].median(), inplace=True)
    df_clean['Postal_Code'] = df_clean['Postal_Code'].astype(int)

    # 2. Remove duplicates
    df_clean = df_clean.drop_duplicates()

    # 3. Fix data types
    df_clean['Order_Date'] = pd.to_datetime(df_clean['Order_Date'])
    df_clean['Ship_Date'] = pd.to_datetime(df_clean['Ship_Date'])

    # 4. Add derived columns
    df_clean['Order_Year'] = df_clean['Order_Date'].dt.year
    df_clean['Order_Month'] = df_clean['Order_Date'].dt.month
    df_clean['Order_Month_Name'] = df_clean['Order_Date'].dt.month_name()
    df_clean['Order_Quarter'] = df_clean['Order_Date'].dt.quarter
    df_clean['Order_DayOfWeek'] = df_clean['Order_Date'].dt.day_name()
    df_clean['Shipping_Days'] = (df_clean['Ship_Date'] - df_clean['Order_Date']).dt.days

    # 5. Convert categorical columns
    categorical_cols = ['Ship_Mode', 'Segment', 'Region', 'Category', 'Sub_Category']
    for col in categorical_cols:
        df_clean[col] = df_clean[col].astype('category')

    # 6. Handle outliers (cap them)
    for col in ['Sales', 'Profit']:
        _, lower, upper = detect_outliers_iqr(df_clean, col)
        df_clean[f'{col}_Capped'] = df_clean[col].clip(lower=lower, upper=upper)

    return df_clean


def generate_summary_stats(df):
    """
    Generate summary statistics for the dataset.

    Parameters:
        df (pd.DataFrame): Cleaned dataframe

    Returns:
        dict: Summary statistics
    """
    return {
        'total_sales': df['Sales'].sum(),
        'total_profit': df['Profit'].sum(),
        'overall_margin': (df['Profit'].sum() / df['Sales'].sum()) * 100,
        'total_orders': len(df),
        'avg_order_value': df['Sales'].mean(),
        'unique_customers': df['Customer_Name'].nunique(),
        'unique_products': df['Product_ID'].nunique(),
        'date_range': f"{df['Order_Date'].min().strftime('%Y-%m-%d')} to {df['Order_Date'].max().strftime('%Y-%m-%d')}"
    }


if __name__ == '__main__':
    # Example usage
    print("Data Cleaning Utility Script")
    print("Usage: Import functions in your notebook or script")
    print("\nExample:")
    print("  from scripts.data_cleaning import clean_superstore_data")
    print("  df_clean = clean_superstore_data(df_raw)")
