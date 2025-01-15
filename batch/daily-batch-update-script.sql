-- Daily Batch Update Script
DELIMITER //
CREATE PROCEDURE update_reports_tables()
BEGIN
    -- Update monthly_sales table
    INSERT INTO monthly_sales (year, month, region_id, total_sales_amount, number_of_orders)
    SELECT 
        YEAR(order_date) AS year, 
        MONTH(order_date) AS month, 
        region_id,
        SUM(quantity * unit_price) AS total_sales_amount,
        COUNT(DISTINCT order_id) AS number_of_orders
    FROM orders
    JOIN stores ON orders.store_id = stores.store_id
    GROUP BY YEAR(order_date), MONTH(order_date), region_id
    ON DUPLICATE KEY UPDATE 
        total_sales_amount = VALUES(total_sales_amount),
        number_of_orders = VALUES(number_of_orders);

    -- Update category_sales table
    INSERT INTO category_sales (store_id, category_id, total_sales_amount)
    SELECT 
        store_id, 
        category_id, 
        SUM(quantity * unit_price) AS total_sales_amount
    FROM orders
    JOIN products ON orders.product_id = products.product_id
    GROUP BY store_id, category_id
    ON DUPLICATE KEY UPDATE 
        total_sales_amount = VALUES(total_sales_amount);
END //
DELIMITER ;