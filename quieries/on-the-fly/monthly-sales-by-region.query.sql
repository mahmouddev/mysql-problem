SELECT 
    YEAR(order_date) AS year, 
    MONTH(order_date) AS month, 
    stores.region_id, 
    SUM(quantity * unit_price) AS total_sales_amount, 
    COUNT(DISTINCT orders.order_id) AS number_of_orders
FROM 
    orders
JOIN 
    stores ON orders.store_id = stores.store_id
GROUP BY 
    YEAR(order_date), MONTH(order_date), stores.region_id;