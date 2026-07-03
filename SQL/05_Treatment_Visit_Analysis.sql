--Which treatment is performed most frequently?
SELECT treatment_type,COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY TotalPatients DESC;


--Average Treatment Cost
SELECT treatment_type,
ROUND(AVG(treatment_cost),2) AS AvgTreatmentCost
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY AvgTreatmentCost DESC;

--Total Revenue by Treatment
SELECT treatment_type,
ROUND(SUM(treatment_cost),2) AS TotalRevenue
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY TotalRevenue DESC;

--Average Length of Stay by Treatment
SELECT treatment_type,
ROUND(AVG(length_of_stay_days),2) AS AvgStay
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY AvgStay DESC;

--Average Recovery Score
SELECT treatment_type,
ROUND(AVG(recovery_score),2) AS AvgRecovery
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY AvgRecovery DESC;

--Average Readmission Risk
SELECT treatment_type,
ROUND(AVG(readmission_risk),2) AS AvgReadmissionRisk
FROM PatientAnalytics
GROUP BY treatment_type
ORDER BY AvgReadmissionRisk DESC;


--Which treatments are most commonly performed in each department?
SELECT department,treatment_type,
COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY department,treatment_type
ORDER BY department,TotalPatients DESC;


--