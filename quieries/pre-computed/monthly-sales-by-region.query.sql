SELECT 
    year, 
    month, 
    region_id, 
    total_sales_amount, 
    number_of_orders
FROM 
    monthly_sales
WHERE 
    (year, month) BETWEEN (YEAR(CURRENT_DATE - INTERVAL 12 MONTH), MONTH(CURRENT_DATE - INTERVAL 12 MONTH)) 
                      AND (YEAR(CURRENT_DATE), MONTH(CURRENT_DATE));
