INSERT INTO retail.sales (
    order_id,
    order_date,
    product_id,
    customer_id,
    region_id,
    units,
    sales_amount,
    cost_amount
)
SELECT
    order_id,
    to_date(order_date, 'MM/DD/YYYY'),
    product_id,
    customer_id,
    'REG-' || UPPER(region),
    quantity,
    sales,
    (sales - profit)::numeric
FROM retail.staging_superstore
WHERE order_id IS NOT NULL;
