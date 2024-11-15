-- 1. Average Discount and Shipping Fee by Order Status
-- [ Examine the average discounts and shipping fees for different order statuses ]
SELECT 
    od.status,
    AVG(od.discount) AS avg_discount,
    AVG(od.shipping_fee) AS avg_shipping_fee
FROM
    Order_Details od
GROUP BY od.status;


-- 2. Pending and Cancelled Orders Analysis
-- [ Find the number of orders that are pending or cancelled, helping understand potential bottlenecks or issues ]
SELECT 
    status, COUNT(order_id) AS order_count
FROM
    Order_Details
WHERE
    status IN ('Pending' , 'Cancelled')
GROUP BY status;