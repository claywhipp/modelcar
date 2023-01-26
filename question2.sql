-- How much profit does each customer generate

WITH
customer_profit_table AS (
  SELECT o.customerNumber, SUM((od.priceEach - p.buyPrice) * od.quantityOrdered) AS customer_profit
    FROM products AS p
    JOIN orderdetails AS od
	  ON p.productCode = od.productCode
    JOIN orders AS o
  	  ON o.orderNumber = od.orderNumber
GROUP BY o.customerNumber
)

-- VIP customers
-- SELECT c.customerName, c.contactLastName, c.contactFirstName, c.customerNumber, c.city, c.country,
-- 	   cpt.customer_profit
-- FROM customer_profit_table AS cpt
-- JOIN customers AS c
-- ON cpt.customerNumber = c.customerNumber
-- ORDER BY customer_profit DESC
-- LIMIT 10;

-- Less-enganged customers
SELECT c.customerName, c.contactLastName, c.contactFirstName, c.customerNumber, c.city, c.country,
	   cpt.customer_profit
FROM customer_profit_table AS cpt
JOIN customers AS c
ON cpt.customerNumber = c.customerNumber
ORDER BY customer_profit
LIMIT 10;