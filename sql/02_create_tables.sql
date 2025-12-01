-- PRODUCTS
CREATE TABLE IF NOT EXISTS retail.products (
    product_id      TEXT PRIMARY KEY,
    product_name    TEXT NOT NULL,
    category        TEXT NOT NULL,
    unit_cost       NUMERIC(10,2)
);

-- CUSTOMERS
CREATE TABLE IF NOT EXISTS retail.customers (
    customer_id     TEXT PRIMARY KEY,
    customer_name   TEXT,
    segment         TEXT
);

-- REGIONS
CREATE TABLE IF NOT EXISTS retail.regions (
    region_id       TEXT PRIMARY KEY,
    region_name     TEXT NOT NULL,
    country         TEXT
);

-- SALES
CREATE TABLE IF NOT EXISTS retail.sales (
    sales_id        BIGSERIAL PRIMARY KEY,
    order_id        TEXT NOT NULL,
    order_date      DATE NOT NULL,
    product_id      TEXT NOT NULL,
    customer_id     TEXT,
    region_id       TEXT NOT NULL,
    units           INT,
    sales_amount    NUMERIC(14,2) NOT NULL,
    cost_amount     NUMERIC(14,2),
    CONSTRAINT fk_sales_product FOREIGN KEY (product_id) REFERENCES retail.products(product_id),
    CONSTRAINT fk_sales_customer FOREIGN KEY (customer_id) REFERENCES retail.customers(customer_id),
    CONSTRAINT fk_sales_region FOREIGN KEY (region_id) REFERENCES retail.regions(region_id)
);
