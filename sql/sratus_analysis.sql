-- Status Analysis
SELECT 
  OrderStatus AS Status,
  COUNT(*) AS Orders,
  ROUND(SUM(TotalPrice), 2) AS Revenue,
  ROUND(COUNT(*) / SUM(COUNT(*)) OVER () * 100, 2) AS `Orders %`,
  ROUND(SUM(TotalPrice) / SUM(SUM(TotalPrice)) OVER () * 100, 2) AS `Revenue %`,  
FROM 
  `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
GROUP BY 
  OrderStatus
ORDER BY 
  Orders DESC