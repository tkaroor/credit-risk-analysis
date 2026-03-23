# Credit Risk Analysis

## Project Overview

This project analyzes loan application data to identify factors associated with loan default risk. The objective is to understand how applicant characteristics such as income, loan amount, and external risk scores relate to the likelihood of default, and to translate these findings into a practical credit decisioning framework. The analysis is conducted using SQL, focusing on structured exploration and segmentation to uncover patterns in borrower behavior.

---

## Dataset

Source: Kaggle Home Credit Default Risk dataset(https://www.kaggle.com/datasets/megancrenshaw/home-credit-default-risk)

The dataset contains 307,511 loan applications, where each row represents an individual applicant.

Key variables used in the analysis:
target – Loan outcome (0 = repaid, 1 = default)
amt_income_total – Applicant’s total income
amt_credit – Loan amount requested 
amt_annuity – Loan repayment amount
ext_source_2 – External credit risk score (primary risk indicator)

---

## Tools Used

- PostgreSQL
- DBeaver

---

## Analysis Steps

- Data exploration to understand dataset size, target distribution, and missing values
- Evaluation of default rates across income segments
- Segmentation of applicants based on external risk scores
- Combined analysis of income and risk score to assess their relative impact on default
- Translation of observed patterns into credit decisioning rules

---

## Key Findings

The overall default rate is 8.07%, indicating a relatively small proportion of high-risk applicants.
Income shows minimal variation in default rates across segments (approximately 7.6% to 8.5%), suggesting it is not a strong standalone predictor of default.

External risk scores show a clear separation in default behavior:
Low risk score group: 15.88% default rate
Medium risk score group: 7.21% default rate
High risk score group: 3.31% default rate

In combined segmentation, default rates remain consistent within each risk score group regardless of income level. For example, high-income applicants with low risk scores exhibit significantly higher default rates than lower-income applicants with high risk scores.

These results indicate that external risk scores are the dominant factor in predicting default, while income plays a secondary role.

---

## Decision Framework

Based on the analysis, the following approach can be used for credit decisioning:

Approve applicants with high external risk scores (greater than 0.7), as they exhibit low default rates
Reject applicants with low external risk scores (less than 0.3), as they exhibit significantly higher default rates
Review applicants with medium risk scores (between 0.3 and 0.7), incorporating additional factors such as income and loan size

---

## Repository Structure

credit_risk_sql_analysis
│
├── sql/
│   ├── 01_exploration.sql
│   ├── 02_risk_analysis.sql
└── README.md

---

## Author

**Tarangini Karoor Subrahmanyam**
Data Analyst | SQL | Python | Data Visualization
