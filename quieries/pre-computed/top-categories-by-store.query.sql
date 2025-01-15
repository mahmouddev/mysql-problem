SELECT 
    store_id, 
    category_id, 
    total_sales_amount, 
    RANK() OVER (PARTITION BY store_id ORDER BY total_sales_amount DESC) AS rank_within_store
FROM 
    category_sales
WHERE 
    store_id IN (
        SELECT DISTINCT store_id 
        FROM orders 
        WHERE order_date 
        BETWEEN '2024-01-01' AND '2024-03-31'
        );
