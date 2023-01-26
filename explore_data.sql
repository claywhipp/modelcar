-- Customers: customer info
-- Employees: employee info
-- Offices: sales office info
-- Orders: customers' sales orders
-- OrderDetails: sales order line for each sales order
-- Payments: customers' payment records
-- Products: a list of scale model cars
-- ProductLines: a list of product line categories

SELECT  'Customers' AS table_name, '13' AS number_of_attributes, COUNT(*) AS number_of_rows
FROM customers

UNION ALL

SELECT  'Products', '9', COUNT(*)
FROM products

UNION ALL

SELECT  'ProductLines', '4', COUNT(*)
FROM productlines

UNION ALL

SELECT  'Orders', '7', COUNT(*)
FROM orders

UNION ALL

SELECT  'OrderDetails', '5', COUNT(*)
FROM orderdetails

UNION ALL

SELECT  'Payments', '4', COUNT(*)
FROM payments

UNION ALL

SELECT  'Employees', '8', COUNT(*)
FROM employees

UNION ALL

SELECT  'Offices', '9', COUNT(*)
FROM offices

