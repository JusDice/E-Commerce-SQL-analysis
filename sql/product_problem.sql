-- Product Problem Analysis
WITH grouped AS (
  SELECT 
    Product,
    COUNT(*) AS all_orders,
    COUNTIF(OrderStatus IN ("Returned", "Cancelled")) AS problem_orders,
    COUNTIF(OrderStatus IN ("Returned")) AS returned_orders,
    COUNTIF(OrderStatus IN ("Cancelled")) AS cancelled_orders
  FROM 
    `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
  GROUP BY 
    Product
)

SELECT 
  Product,
  returned_orders AS `Returned Orders`,
  cancelled_orders AS `Cancelled Orders`,
  problem_orders AS `Problem Orders`,
  ROUND(returned_orders / all_orders * 100, 2) AS `Return Rate %`,
  ROUND(cancelled_orders / all_orders * 100, 2) AS `Cancel Rate %`,
  ROUND(problem_orders / all_orders * 100, 2) AS `Problem Rate %`,
FROM 
  grouped
ORDER BY 
  `Problem Rate %` DESC