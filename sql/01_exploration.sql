
-- ============================================
-- File: 01_exploration.sql
-- Description: Initial data exploration of Home Credit dataset
-- Goal: Understand data structure, target distribution, and data quality
-- Author: Tarangini Karoor Subrahmanyam
-- ============================================


-- Total number of loan applications
SELECT COUNT(*) as total_loan_apps
FROM application_train;



-- Analyze overall default rate (TARGET = 1 means default)
SELECT 
    TARGET,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM application_train
GROUP BY TARGET; -- 8% are defaulters


-- Preview key financial and risk columns
SELECT 
    sk_id_curr,
    target,
    amt_income_total,
    amt_credit,
    amt_annuity,
    ext_source_1,
    ext_source_2,
    ext_source_3
FROM application_train
LIMIT 10;

-- Check missing values in credit score columns
SELECT 
    COUNT(*) AS total_rows,
    COUNT(ext_source_1) AS ext1_not_null,
    COUNT(ext_source_2) AS ext2_not_null,
    COUNT(ext_source_3) AS ext3_not_null
FROM application_train;

-- Basic statistics for income and credit
SELECT 
    MIN(amt_income_total) AS min_income,
    MAX(amt_income_total) AS max_income,
    AVG(amt_income_total) AS avg_income,
    MIN(amt_credit) AS min_credit,
    MAX(amt_credit) AS max_credit
FROM application_train;

