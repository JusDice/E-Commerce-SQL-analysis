-- Coupon impact analysis
WITH grouped AS (
  SELECT 
    IFNULL(CouponCode, "No Coupon") AS CouponCode,
    COUNT(*) AS active_orders,
    SUM(TotalPrice) AS active_revenue,
  FROM
    `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
  WHERE 
    OrderStatus NOT IN ("Returned", "Cancelled")
  GROUP BY 
    CouponCode
)

SELECT
  CouponCode,
  active_orders AS `Active Orders`,
  ROUND(active_revenue, 2) AS `Active Revenue`,
  ROUND(active_orders / SUM(active_orders) OVER () * 100, 2) AS `Orders %`,
  ROUND(active_revenue / SUM(active_revenue) OVER () * 100, 2) AS `Revenue %`,
  ROUND(active_revenue / active_orders , 2) AS AOV
FROM grouped
ORDER BY active_revenue DESC
