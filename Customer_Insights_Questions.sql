-- 1. Top Customers by Total Spending
-- [ Find out which customers have spent the most ] [ Top 10 ]
SELECT 
    c.customer_name, SUM(p.price * o.quantity) AS total_spent
FROM
    Customers c
        JOIN
    Orders o ON c.customer_id = o.customer_id
        JOIN
    Products p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- 2. Customer Purchase Frequency by Country
-- [ Analyze how often customers from each country make purchases ]
SELECT 
    c.country, COUNT(o.order_id) AS purchase_frequency
FROM
    Customers c
        JOIN
    Orders o ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY purchase_frequency DESC;