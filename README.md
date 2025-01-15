### Reasons for Slow report generated Query Performance

1. **Large Table Scans**
   - The `orders` table has 10 million rows, leading to expensive full table scans.
   - Joins with `stores` and `products` can further increase query execution time.

2. **Grouping and Sorting**
   - Grouping by year, month, and region in the (`monthly-sales-by-region.query.sql`) query and calculating ranks in the (`top-categories-by-store.query.sql`) are computationally intensive.

3. **Lack of Indexing**
   - The `order_date`, `store_id`, `region_id`, and `category_id` columns not indexed, leading to slow filtering and joins and use resources.

4. **Lack of Pre-Aggregation**
   - Queries calculate aggregate metrics on-the-fly instead of using pre-computed data, resulting in longer execution times.

### To Modify the database schema to make them fast

1. **Add Indexes**:
   - `orders(order_date, store_id)`
   - `orders(product_id)`
   - `stores(region_id)`
   - `products(category_id)`

2. **Pre-Aggregate Data**:
   - Create a reports tables to store pre-aggregated sales data ti use it as computed data.

### Solution 
By using pre-computed data, you balance query performance with update complexity, which is essential for handling high volumes of data efficiently.