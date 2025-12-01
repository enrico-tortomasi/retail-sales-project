-- PRODUCTS
INSERT INTO retail.products (product_id, product_name, category, unit_cost)
SELECT DISTINCT
    product_id,
    product_name,
    category,
    NULL::numeric
FROM retail.staging_superstore
WHERE product_id IS NOT NULL
ON CONFLICT (product_id) DO NOTHING;

-- CUSTOMERS
INSERT INTO retail.customers (customer_id, customer_name, segment)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment
FROM retail.staging_superstore
WHERE customer_id IS NOT NULL
ON CONFLICT (customer_id) DO NOTHING;

-- REGIONS
INSERT INTO retail.regions (region_id, region_name, country)
SELECT DISTINCT
    'REG-' || UPPER(region),
    region,
    country
FROM retail.staging_superstore
WHERE region IS NOT NULL
ON CONFLICT (region_id) DO NOTHING;
