-- 1. Total Profit per Product
-- [ Calculate profit per product by subtracting the average discount from the price and then multiplying by the quantity sold ]
SELECT 
    p.product_name,
    SUM((p.price - od.discount) * o.quantity) AS total_profit
FROM
    Products p
        JOIN
    Orders o ON p.product_id = o.product_id
        JOIN
    Order_Details od ON o.order_id = od.order_id
GROUP BY p.product_name
ORDER BY total_profit DESC;


-- 2. Profit Margin by Product Category
-- [ Determine which categories provide the highest margins ]
SELECT 
    p.category,
    SUM((p.price - od.discount) * o.quantity) AS category_profit,
    SUM(o.quantity) AS total_quantity
FROM
    Products p
        JOIN
    Orders o ON p.product_id = o.product_id
        JOIN
    Order_Details od ON o.order_id = od.order_id
GROUP BY p.category
ORDER BY category_profit DESC;