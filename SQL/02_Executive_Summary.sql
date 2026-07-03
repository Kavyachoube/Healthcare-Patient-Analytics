--Total Patients
SELECT COUNT(*) AS TotalPatients
FROM PatientAnalytics;

--Average Treatment Cost
SELECT
ROUND(AVG(treatment_cost),2) AS AvgTreatmentCost
FROM PatientAnalytics;

--Average Length of Stay
SELECT
ROUND(AVG(length_of_stay_days),2) AS AvgStay
FROM PatientAnalytics;

--Average Recovery Score
SELECT
ROUND(AVG(recovery_score),2) AS AvgRecovery
FROM PatientAnalytics;

--Average Readmission Risk
SELECT
ROUND(AVG(readmission_risk),2) AS AvgReadmissionRisk
FROM PatientAnalytics;

--Patients by Department
SELECT department,
COUNT(*) AS TotalPatients FROM PatientAnalytics
GROUP BY department ORDER BY TotalPatients DESC;

--Patients by Gender
SELECT gender,
COUNT(*) AS TotalPatients
FROM PatientAnalytics GROUP BY gender;

--Patients by Age Group
SELECT age_group,
COUNT(*) AS TotalPatients
FROM PatientAnalytics GROUP BY age_group;

--Routine vs Emergency
SELECT visit_type,
COUNT(*) AS TotalPatients
FROM PatientAnalytics GROUP BY visit_type;

--Patients by Region
SELECT region,
COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY region;