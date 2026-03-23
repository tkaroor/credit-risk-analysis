# Credit Risk Analysis

## Project Overview

This project analyzes loan application data to identify factors associated with loan default risk. The objective is to understand how applicant characteristics such as income, loan amount, repayment burden, and external risk scores relate to the likelihood of default, and to translate these findings into a practical credit decisioning framework.

The analysis is conducted using SQL, focusing on structured exploration and segmentation to uncover patterns in borrower behavior.

---

## Dataset

**Source:** Kaggle Home Credit Default Risk dataset(https://www.kaggle.com/datasets/megancrenshaw/home-credit-default-risk)  

The dataset contains 307,511 loan applications, where each row represents an individual applicant.

### Key Variables

| Column Name        | Description                                      |
|-------------------|--------------------------------------------------|
| target            | Loan outcome (0 = repaid, 1 = default)         |
| amt_income_total  | Applicant’s total income                        |
| amt_credit        | Loan amount requested                            |
| amt_annuity       | Loan repayment amount                            |
| ext_source_2      | External credit risk score (primary indicator)  |

---

## Tools Used

| Tool            | Purpose                                  |
|-----------------|------------------------------------------|
| PostgreSQL      | Querying and analysis                     |
| DBeaver         | SQL client and database interface        |

---

## Analysis Steps

1. Explored dataset size, target distribution, and missing values
2. Evaluated default rates across income segments
3. Segmented applicants based on external risk scores
4. Assessed loan amount and repayment burden relative to income
5. Combined income, loan characteristics, and risk score to evaluate default behavior
6. Translated observed patterns into credit decisioning rules

---

## Key Findings

- **Overall default rate:** 8.07%  

- **Income:** Default rates across segments range 7.59%–8.47%, showing minimal variation → not a strong standalone predictor  

- **External risk scores:**

| Risk Score Group        | Default Rate (%) |
|-------------------------|----------------|
| Low Score (High Risk)   | 15.88          |
| Medium Score            | 7.21           |
| High Score (Low Risk)   | 3.31           |

- **Average loan amount (amt_credit):**

| Target | Average Loan Amount |
|--------|------------------|
| 0      | 602,648.28       |
| 1      | 557,778.53       |

> Loan amount alone does not predict default.

- **Average repayment burden (amt_annuity / income):**

| Target | Avg Annuity/Income Ratio |
|--------|--------------------------|
| 0      | 3.9637                   |
| 1      | 3.8874                   |

> Repayment burden is a secondary factor influencing default.

**Insight:** External risk score is the dominant predictor, with repayment burden providing additional context. Income alone has minimal impact.

---

## Decision Framework

- Approve applicants with high external risk scores (>0.7) → low default rates  
- Reject applicants with low external risk scores (<0.3) → high default rates  
- Review medium-risk applicants (0.3–0.7), incorporating repayment burden and other factors

---

## Author

**Tarangini Karoor Subrahmanyam**  
Data Analyst | SQL | Python | Data Visualization
