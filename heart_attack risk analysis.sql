create database heart_attack;

use heart_attack;

select * from heart_attack;



-- =========================================
-- HEART ATTACK ANALYSIS DASHBOARD QUERIES
-- =========================================

-- KPI 1: Total Patients
SELECT COUNT(*) AS Total_Patients
FROM heart_attack;

-- KPI 2: Total Heart Attack Cases
SELECT COUNT(*) AS Heart_Attack_Cases
FROM heart_attack
WHERE target = 1;

-- KPI 3: Total Non Heart Attack Cases
SELECT COUNT(*) AS Non_Heart_Attack_Cases
FROM heart_attack
WHERE target = 0;

-- KPI 4: Heart Attack Percentage
SELECT ROUND(
(COUNT(CASE WHEN target = 1 THEN 1 END) * 100.0)
/ COUNT(*),2
) AS Heart_Attack_Percentage
FROM heart_attack;

-- KPI 5: Average Age
SELECT ROUND(AVG(Age),2) AS Avg_Age
FROM heart_attack;

-- KPI 6: Average Cholesterol
SELECT ROUND(AVG(Cholesterol_level),2) AS Avg_Cholesterol
FROM heart_attack;

-- =========================================
-- GRAPH 1 : Age Group vs Heart Attack Cases
-- =========================================

SELECT
CASE
WHEN Age BETWEEN 20 AND 30 THEN '20-30'
WHEN Age BETWEEN 31 AND 40 THEN '31-40'
WHEN Age BETWEEN 41 AND 50 THEN '41-50'
WHEN Age BETWEEN 51 AND 60 THEN '51-60'
ELSE '60+'
END AS Age_Group,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Age_Group
ORDER BY Age_Group;

-- =========================================
-- GRAPH 2 : Gender Wise Heart Attack Cases
-- =========================================

SELECT
Sex,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Sex;

-- =========================================
-- GRAPH 3 : Chest Pain Type Wise Cases
-- =========================================

SELECT
Chest_Pain_Type,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Chest_Pain_Type;

-- =========================================
-- GRAPH 4 : ECG Wise Heart Attack Cases
-- =========================================

SELECT
ECG,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY ECG;

-- =========================================
-- GRAPH 5 : Exercise Pain Wise Cases
-- =========================================

SELECT
Exercise_pain,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Exercise_pain;

-- =========================================
-- GRAPH 6 : Blood Sugar Wise Cases
-- =========================================

SELECT
Blood_Sugar,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Blood_Sugar;

-- =========================================
-- GRAPH 7 : Average Cholesterol By Gender
-- =========================================

SELECT
Sex,
ROUND(AVG(Cholesterol_level),2) AS Avg_Cholesterol
FROM heart_attack
GROUP BY Sex;

-- =========================================
-- GRAPH 8 : Average Blood Pressure By Gender
-- =========================================

SELECT
Sex,
ROUND(AVG(`Resting(BP)`),2) AS Avg_BP
FROM heart_attack
GROUP BY Sex;

-- =========================================
-- GRAPH 9 : Maximum Heart Rate By Age
-- =========================================

SELECT
Age,
ROUND(AVG(Maximum_Rate),2) AS Avg_Heart_Rate
FROM heart_attack
GROUP BY Age
ORDER BY Age;

-- =========================================
-- GRAPH 10 : ECG Slope Wise Cases
-- =========================================

SELECT
ECG_slope,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY ECG_slope;

-- =========================================
-- GRAPH 11 : Blood Flow Test Wise Cases
-- =========================================

SELECT
Blood_flow_test,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Blood_flow_test;

-- =========================================
-- GRAPH 12 : Top 5 Age Groups
-- =========================================

SELECT
Age,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Age
ORDER BY Cases DESC
LIMIT 5;

-- =========================================
-- GRAPH 13 : Average Cholesterol
-- Heart Attack Patients
-- =========================================

SELECT
ROUND(AVG(Cholesterol_level),2)
AS Avg_Cholesterol
FROM heart_attack
WHERE target = 1;

-- =========================================
-- GRAPH 14 : Average BP
-- Heart Attack Patients
-- =========================================

SELECT
ROUND(AVG(`Resting(BP)`),2)
AS Avg_BP
FROM heart_attack
WHERE target = 1;

-- =========================================
-- GRAPH 15 : Major Blood Vessels Analysis
-- =========================================

SELECT
Major_blood_vessels,
COUNT(*) AS Cases
FROM heart_attack
WHERE target = 1
GROUP BY Major_blood_vessels;