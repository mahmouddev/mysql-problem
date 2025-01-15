-- Indexes for Performance Optimization
CREATE INDEX idx_orders_order_date_store_id ON orders (order_date, store_id);
CREATE INDEX idx_orders_product_id ON orders (product_id);
CREATE INDEX idx_stores_region_id ON stores (region_id);
CREATE INDEX idx_products_category_id ON products (category_id);
