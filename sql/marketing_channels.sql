--- Marketing channel effectiveness
WITH grouped AS (
  SELECT 
    ReferralSource,
    COUNTIF(OrderStatus NOT IN ("Returned", "Cancelled")) AS active_orders,
    SUM(CASE
        WHEN OrderStatus NOT IN ("Returned", "Cancelled") THEN TotalPrice
        ELSE 0
      END) AS active_revenue,
    COUNTIF(OrderStatus = "Returned") AS returned_orders,
    COUNTIF(OrderStatus = "Cancelled") AS cancelled_orders,
    COUNT(*) AS all_orders
  FROM
    `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
  GROUP BY 
    ReferralSource
)

SELECT
  ReferralSource,
  Active_Orders AS `Active Orders`,
  ROUND(active_revenue, 2) AS `Active Revenue`,
  ROUND(active_orders / SUM(active_orders) OVER () * 100, 2) AS `Orders %`,
  ROUND(active_revenue / SUM(active_revenue) OVER () * 100, 2) AS `Revenue %`,
  ROUND(active_revenue / active_orders, 2) AS AOV,
  returned_orders AS `Returned Orders`,
  cancelled_orders AS `Cancelled Orders`,
  ROUND(returned_orders / all_orders * 100, 2) AS `Return Rate %`,
  ROUND(cancelled_orders / all_orders * 100, 2) AS `Cancel Rate %`,
  ROUND((cancelled_orders + returned_orders) / all_orders * 100, 2) AS `Problem Order Rate %`
FROM 
  grouped
ORDER BY 
  active_revenue DESC