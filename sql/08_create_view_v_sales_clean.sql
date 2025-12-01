CREATE OR REPLACE VIEW retail.v_sales_clean AS
SELECT
    s.sales_id,
    s.order_id,
    s.order_date,
    c.year,
    c.month,
    c.month_name,
    c.quarter,
    c.year_month,
    
    s.product_id,
    p.product_name,
    p.category,
    
    s.customer_id,
    cu.customer_name,
    cu.segment,
    
    s.region_id,
    r.region_name,
    r.country,
    
    s.units,
    s.sales_amount,
    s.cost_amount,
    
    CASE 
        WHEN s.sales_amount IS NULL OR s.sales_amount = 0 THEN NULL
        ELSE (s.sales_amount - COALESCE(s.cost_amount,0)) / s.sales_amount
    END AS profit_margin
FROM retail.sales s
JOIN retail.calendar c 
    ON s.order_date = c.date_key
JOIN retail.products p 
    ON s.product_id = p.product_id
LEFT JOIN retail.customers cu 
    ON s.customer_id = cu.customer_id
JOIN retail.regions r 
    ON s.region_id = r.region_id;
