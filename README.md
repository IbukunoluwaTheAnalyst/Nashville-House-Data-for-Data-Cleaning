# Nashville-Housing-Dataset-for-Data-Cleaning
# Overview
This project involves cleaning the Nashville Housing dataset to enhance data quality and make it suitable for analysis. Using SQL, data inconsistencies, duplicates, missing values, and other issues in the original dataset were systematically addressed. The cleaned dataset is ready for further exploration and analysis, providing a solid foundation for real estate or demographic insights specific to the Nashville area.
# Project Files
Uncleaned Nashville Housing Dataset (Uncleaned Nashville Housing Dataset.xlsx): The original dataset containing raw, unprocessed data.

Cleaned Nashville Housing Dataset (Cleaned Nashville Housing Dataset.csv): The processed dataset after cleaning, ready for analysis.

SQL Script for Data Cleaning (data_cleaning for Nashville Housing.sql): SQL queries used to perform data cleaning tasks, including handling missing values, standardizing formats, and removing duplicates.
# Data Cleaning Tasks
The following data cleaning tasks were performed on the uncleaned dataset to create a polished, analysis-ready dataset:

Handling Missing Values: Filled in essential missing values where possible and removed records lacking critical information.

Date Format Standardization: Ensured consistency in date formats across the dataset to support reliable temporal analysis.

Duplicate Removal: Identified and removed duplicate records to ensure data integrity.
Standardization of Categorical Values: Aligned category values (e.g., property types) for uniformity.

Address Splitting: Split the address field into separate columns for street, city, and state to improve usability.

Outlier and Anomaly Removal: Filtered out records with values that fall outside reasonable ranges.

New Column Creation: Added fields such as "Year Sold" and "Month Sold" to enable trend and seasonal analysis.
# Getting Started
To replicate or explore this project:

Load the Uncleaned Dataset: Use the provided Uncleaned Nashville Housing Dataset.xlsx file.

Run the SQL Script: Use data_cleaning for Nashville Housing.sql in SQL Server to perform the cleaning tasks.

Compare Cleaned Data: After running the SQL script, compare the results with the provided Cleaned Nashville Housing Dataset.csv to confirm data cleaning consistency.
# Requirements
SQL Server: The data cleaning SQL script is designed to run on SQL Server (tested on SQL Server 2022).

Nashville Housing Dataset: Ensure the uncleaned dataset is accessible in SQL Server before running the script.
# Future Applications
This cleaned dataset can be used to conduct various analyses, such as:

Real estate price trend analysis

Demographic or geographic analysis of property transactions

Data modeling and predictions for Nashville housing market trends
# License
This project is licensed under the the MIT License.
# Author
This project was completed by Ajibade Ibukunoluwa Gift. For any questions or feedback, please reach out to ajibadeibukunoluwagift@outlook.com.

