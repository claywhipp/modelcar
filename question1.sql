WITH
sum_quantity_table AS (
  SELECT productCode, priceEach, SUM(quantityOrdered) AS sum_quantity
    FROM orderdetails
GROUP BY productCode
),

demand_table AS (
SELECT p.productName, p.productLine, CAST(sqt.sum_quantity AS float) / p.quantityInStock AS demand_ratio, 
	   CAST(sum_quantity AS float) * sqt.priceEach AS product_performance
  FROM sum_quantity_table AS sqt
  JOIN products AS p
    ON sqt.productCode = p.productCode
)

-- Top 10 Demand Ratios
-- SELECT * 
-- FROM demand_table
-- ORDER BY demand_ratio DESC, product_performance DESC
-- LIMIT 10;

-- Bottom 10 Demand Ratios
SELECT * 
FROM demand_table AS dt
ORDER BY dt.demand_ratio, dt.product_performance DESC
LIMIT 10;



-- Out of all the product lines, classic cars are the most common type are low stock and have high product performance. We should prioritize classic cars when restocking products

