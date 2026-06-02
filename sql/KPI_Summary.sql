--- KPI Summary
SELECT "Total Orders" AS Metric, COUNT(*) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`

UNION ALL

SELECT "Active Orders" AS Metric, COUNT(*) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
WHERE OrderStatus NOT IN ("Returned", "Cancelled")

UNION ALL

SELECT "Fulfilled Orders" AS Metric, COUNT(*) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
WHERE OrderStatus NOT IN ("Returned", "Cancelled", "Pending")

UNION ALL

SELECT "Gross Revenue" AS Metric, ROUND(SUM(TotalPrice), 2) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`

UNION ALL

SELECT "Active Revenue" AS Metric, ROUND(SUM(TotalPrice), 2) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
WHERE OrderStatus NOT IN ("Returned", "Cancelled")

UNION ALL

SELECT "Completed Revenue" AS Metric, ROUND(SUM(TotalPrice), 2) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
WHERE OrderStatus NOT IN ("Returned", "Cancelled", "Pending")

UNION ALL

SELECT "Gross AOV" AS Metric, ROUND(AVG(TotalPrice), 2) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`

UNION ALL

SELECT "Active AOV" AS Metric, ROUND(AVG(TotalPrice), 2) AS Value
FROM `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
WHERE OrderStatus NOT IN ("Returned", "Cancelled")