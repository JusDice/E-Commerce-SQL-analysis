-- Product Analysys
WITH grouped AS (
  SELECT 
    Product,
    SUM(Quantity) AS active_quantity,
    SUM(TotalPrice) AS active_revenue,
    COUNT(*) AS active_orders,
    AVG(CASE
      WHEN CouponCode IS NULL THEN 0
      ELSE 1
      END) * 100 AS coupon_use_percentage
  FROM
    `data-analytics-cv-project.E_Commerce_Data.E-Commerce Orders`
  WHERE 
    OrderStatus NOT IN ("Returned", "Cancelled")
  GROUP BY 
    Product
)

SELECT
  Product,
  active_quantity AS `Active Quantity`,
  active_orders AS `Active Orders`,
  ROUND(active_revenue, 2) AS Revenue,
  ROUND(active_orders / SUM(active_orders) OVER () * 100, 2) AS `Active Orders %`,
  ROUND(active_revenue / SUM(active_revenue) OVER () * 100, 2) AS `Active Revenue %`,
  ROUND(active_revenue / active_orders, 2) AS AOV,
 ROUND(coupon_use_percentage, 2) AS `Coupon Usage %`
FROM 
 grouped
ORDER BY 
 active_revenue DESC