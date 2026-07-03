SELECT *
FROM PatientAnalytics;
-- count total records
SELECT COUNT(*) AS TotalPatients FROM
PatientAnalytics;
--count Columns
SELECT COUNT(*) AS TotalColumns FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='PatientAnalytics';
--check data type
EXEC sp_help PatientAnalytics;

--check for NULL Values
SELECT
SUM(CASE WHEN patient_id IS NULL THEN 1 ELSE 0 END) AS patient_id,
SUM(CASE WHEN visit_date IS NULL THEN 1 ELSE 0 END) AS visit_date,
SUM(CASE WHEN age_group IS NULL THEN 1 ELSE 0 END) AS age_group,
SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender,
SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS region,
SUM(CASE WHEN department IS NULL THEN 1 ELSE 0 END) AS department,
SUM(CASE WHEN treatment_type IS NULL THEN 1 ELSE 0 END) AS treatment_type,
SUM(CASE WHEN visit_type IS NULL THEN 1 ELSE 0 END) AS visit_type,
SUM(CASE WHEN length_of_stay_days IS NULL THEN 1 ELSE 0 END) AS length_of_stay_days,
SUM(CASE WHEN treatment_cost IS NULL THEN 1 ELSE 0 END) AS treatment_cost,
SUM(CASE WHEN recovery_score IS NULL THEN 1 ELSE 0 END) AS recovery_score,
SUM(CASE WHEN readmission_risk IS NULL THEN 1 ELSE 0 END) AS readmission_risk
FROM PatientAnalytics;

--Check Duplicate Patient IDs
SELECT
patient_id,
COUNT(*) AS Total
FROM PatientAnalytics
GROUP BY patient_id
HAVING COUNT(*) > 1;

--Date Range
SELECT
MIN(visit_date) AS FirstVisit,
MAX(visit_date) AS LastVisit
FROM PatientAnalytics;

--Explore Categorical Columns
SELECT DISTINCT department
FROM PatientAnalytics;

--Explore Gender Columns
SELECT DISTINCT gender
FROM PatientAnalytics;

----Explore treatment_type Columns
SELECT DISTINCT treatment_type
FROM PatientAnalytics;

---Explore visit_type Columns
SELECT DISTINCT visit_type
FROM PatientAnalytics;

--Explore age_group Columns
SELECT DISTINCT age_group
FROM PatientAnalytics;

--Explore region Columns
SELECT DISTINCT region
FROM PatientAnalytics;

--Summary Statistics
SELECT
MIN(treatment_cost) AS MinCost,
MAX(treatment_cost) AS MaxCost,
AVG(treatment_cost) AS AvgCost,

MIN(length_of_stay_days) AS MinStay,
MAX(length_of_stay_days) AS MaxStay,
AVG(length_of_stay_days) AS AvgStay,

MIN(recovery_score) AS MinRecovery,
MAX(recovery_score) AS MaxRecovery,
AVG(recovery_score) AS AvgRecovery,

MIN(readmission_risk) AS MinRisk,
MAX(readmission_risk) AS MaxRisk,
AVG(readmission_risk) AS AvgRisk
FROM PatientAnalytics;

-- Check Date Format
SELECT
YEAR(visit_date) AS Year,
MONTH(visit_date) AS Month,
COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY YEAR(visit_date),MONTH(visit_date)
ORDER BY Year,Month;



