-- 1. Total Sales by Product Category
-- [ Find out which product categories are performing best in terms of revenue ]
SELECT 
    p.category, SUM(p.price * o.quantity) AS total_sales
FROM
    Products p
        JOIN
    Orders o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY total_sales DESC;


-- 2. Top 5 Best-Selling Products
-- [ Identify the products that have the highest quantity sold ]
SELECT 
    p.product_name, SUM(o.quantity) AS total_quantity
FROM
    Products p
        JOIN
    Orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 5;


-- 3. Monthly Revenue Trend
-- [ Track revenue month-by-month for seasonal insights ] 
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(p.price * o.quantity) AS monthly_revenue
FROM
    Orders o
        JOIN
    Products p ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;