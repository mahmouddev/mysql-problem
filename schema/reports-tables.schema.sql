-- sales report for monthly sales by region
CREATE TABLE monthly_sales (
    year INT,
    month INT,
    region_id BIGINT,
    total_sales_amount DECIMAL(15,2),
    number_of_orders BIGINT,
    PRIMARY KEY (year, month, region_id)
);

-- sales report for top categories by store
CREATE TABLE category_sales (
    store_id BIGINT,
    category_id BIGINT,
    total_sales_amount DECIMAL(15,2),
    PRIMARY KEY (store_id, category_id)
);