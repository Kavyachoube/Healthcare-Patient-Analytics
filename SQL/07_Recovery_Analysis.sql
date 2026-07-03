--Average Recovery Score
SELECT ROUND(AVG(recovery_score),2) AS AvgRecoveryScore
FROM PatientAnalytics;

--Average Readmission Risk
SELECT ROUND(AVG(readmission_risk),2) AS AvgReadmissionRisk
FROM PatientAnalytics;

--Recovery Score by Department
SELECT department,
ROUND(AVG(recovery_score),2) AS AvgRecovery
FROM PatientAnalytics
GROUP BY department
ORDER BY AvgRecovery DESC;

--Readmission Risk by Department
SELECT department,
ROUND(AVG(readmission_risk),2) AS AvgReadmissionRisk
FROM PatientAnalytics
GROUP BY department
ORDER BY AvgReadmissionRisk DESC;

--Recovery Score by Age Group
SELECT age_group,
ROUND(AVG(recovery_score),2) AS AvgRecovery
FROM PatientAnalytics
GROUP BY age_group
ORDER BY AvgRecovery DESC;

--Readmission Risk by Age Group
SELECT age_group,
ROUND(AVG(readmission_risk),2) AS AvgReadmissionRisk
FROM PatientAnalytics
GROUP BY age_group
ORDER BY AvgReadmissionRisk DESC;


--Recovery Score by Region
SELECT region,
ROUND(AVG(recovery_score),2) AS AvgRecovery
FROM PatientAnalytics
GROUP BY region
ORDER BY AvgRecovery DESC;

--Readmission Risk by Region
SELECT region,
ROUND(AVG(readmission_risk),2) AS AvgReadmissionRisk
FROM PatientAnalytics
GROUP BY region
ORDER BY AvgReadmissionRisk DESC;


--Recovery Score by Treatment Type
SELECT treatment_type,
ROUND(AVG(recovery_score),2) AS AvgRecovery
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY AvgRecovery DESC;

--Readmission Risk by Treatment Type
SELECT treatment_type,
ROUND(AVG(readmission_risk),2) AS AvgReadmissionRisk
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY AvgReadmissionRisk DESC;

--