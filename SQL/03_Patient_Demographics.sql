--Patients by Age Group
SELECT age_group,COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY age_group
ORDER BY TotalPatients DESC;


--Gender Distribution
SELECT gender,COUNT(*) AS TotalPatients,
ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM PatientAnalytics),2) 
AS Percentage
FROM PatientAnalytics
GROUP BY gender;

--Region-wise Patients
SELECT region,COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY region
ORDER BY TotalPatients DESC;


--Which gender dominates each age group?
SELECT age_group,gender,COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY age_group,gender
ORDER BY age_group,gender;

--Which regions have more male or female patients?
SELECT region,gender,COUNT(*) AS TotalPatients
FROM PatientAnalytics GROUP BY region,
gender ORDER BY region;

--Which age groups dominate each region?
SELECT region,age_group,
COUNT(*) AS TotalPatients
FROM PatientAnalytics GROUP BY
region,age_group
ORDER BY region;

--Top Region by Patients
SELECT TOP 1 region,
COUNT(*) AS TotalPatients
FROM PatientAnalytics GROUP BY region
ORDER BY TotalPatients DESC;

--Least Visited Region
SELECT TOP 1 region,
COUNT(*) AS TotalPatients
FROM PatientAnalytics
GROUP BY region
ORDER BY TotalPatients ASC

