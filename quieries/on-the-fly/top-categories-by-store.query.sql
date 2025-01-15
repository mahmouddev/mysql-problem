SELECT 
    orders.store_id, 
    products.category_id, 
    SUM(quantity * unit_price) AS total_sales_amount, 
    RANK() OVER (PARTITION BY orders.store_id ORDER BY SUM(quantity * unit_price) DESC) AS rank_within_store
FROM 
    orders
JOIN 
    products ON orders.product_id = products.product_id
WHERE 
    order_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY 
    orders.store_id, products.category_id;