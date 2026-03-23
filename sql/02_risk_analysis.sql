-- Income vs Default
-- Analyze how income relates to default risk
SELECT 
    CASE 
        WHEN amt_income_total < 50000 THEN 'Low Income'
        WHEN amt_income_total BETWEEN 50000 AND 150000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_applicants,
    ROUND(SUM(target) * 100.0 / COUNT(*), 2) AS default_rate
FROM application_train
GROUP BY income_group
ORDER BY default_rate DESC;

-- Default rate by external risk score (EXT_SOURCE_2)
SELECT 
    CASE 
        WHEN ext_source_2 < 0.3 THEN 'Low Score (High Risk)'
        WHEN ext_source_2 BETWEEN 0.3 AND 0.7 THEN 'Medium Score'
        ELSE 'High Score (Low Risk)'
    END AS risk_bucket,
    COUNT(*) AS total_applicants,
    ROUND(SUM(target) * 100.0 / COUNT(*), 2) AS default_rate
FROM application_train
WHERE ext_source_2 IS NOT NULL
GROUP BY risk_bucket
ORDER BY default_rate DESC;

-- Income range is much smaller than risk score range
-- implying that external score is a stronger predictor of default than income


-- Combined segmentation: income + risk score
SELECT 
    CASE 
        WHEN amt_income_total < 50000 THEN 'Low Income'
        WHEN amt_income_total BETWEEN 50000 AND 150000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,

    CASE 
        WHEN ext_source_2 < 0.3 THEN 'Low Score'
        WHEN ext_source_2 BETWEEN 0.3 AND 0.7 THEN 'Medium Score'
        ELSE 'High Score'
    END AS risk_bucket,

    COUNT(*) AS total,
    ROUND(SUM(target) * 100.0 / COUNT(*), 2) AS default_rate

FROM application_train
WHERE ext_source_2 IS NOT NULL
GROUP BY income_group, risk_bucket
ORDER BY default_rate DESC;
-- risk score dominates income in predicting default


