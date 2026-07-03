--Total Hospital Revenue
SELECT ROUND(SUM(treatment_cost),2) AS TotalRevenue
FROM PatientAnalytics;

--Average Treatment Cost
SELECT ROUND(AVG(treatment_cost),2) AS AvgTreatmentCost
FROM PatientAnalytics;

--Revenue by Department
SELECT department,
ROUND(SUM(treatment_cost),2) AS TotalRevenue
FROM PatientAnalytics
GROUP BY department
ORDER BY TotalRevenue DESC;

--Revenue by Region
SELECT region,
ROUND(SUM(treatment_cost),2) AS TotalRevenue
FROM PatientAnalytics
GROUP BY region
ORDER BY TotalRevenue DESC;


--Revenue by Gender
SELECT gender,
ROUND(SUM(treatment_cost),2) AS TotalRevenue
FROM PatientAnalytics
GROUP BY gender
ORDER BY TotalRevenue DESC;

--Revenue by Visit Type
SELECT visit_type,
ROUND(SUM(treatment_cost),2) AS TotalRevenue
FROM PatientAnalytics
GROUP BY visit_type
ORDER BY TotalRevenue DESC;

--Monthly Revenue Trend
SELECT
YEAR(visit_date) AS Year,
MONTH(visit_date) AS Month,
ROUND(SUM(treatment_cost),2) AS MonthlyRevenue
FROM PatientAnalytics
GROUP BY YEAR(visit_date),MONTH(visit_date)
ORDER BY Year,Month;

--Monthly Average Treatment Cost
SELECT
YEAR(visit_date) AS Year,
MONTH(visit_date) AS Month,
ROUND(AVG(treatment_cost),2) AS AvgTreatmentCost
FROM PatientAnalytics
GROUP BY YEAR(visit_date),
MONTH(visit_date)
ORDER BY Year,Month;


--Department Revenue Ranking
SELECT department,
SUM(treatment_cost) AS Revenue,
DENSE_RANK() OVER(ORDER BY SUM(treatment_cost) DESC) AS RevenueRank
FROM PatientAnalytics
GROUP BY department;

--What percentage of total hospital revenue comes from each department?
SELECT department,
ROUND(SUM(treatment_cost),2) AS Revenue,
ROUND(SUM(treatment_cost) * 100.0 /
(SELECT SUM(treatment_cost) FROM PatientAnalytics),2) AS RevenuePercentage
FROM PatientAnalytics
GROUP BY department
ORDER BY RevenuePercentage DESC;

--Which department generates the highest revenue per patient?
--Revenue Per Patient by Department
SELECT
department,
COUNT(*) AS TotalPatients,
ROUND(SUM(treatment_cost),2) AS TotalRevenue,
ROUND(SUM(treatment_cost)/COUNT(*),2) AS RevenuePerPatient
FROM PatientAnalytics
GROUP BY department
ORDER BY RevenuePerPatient DESC;