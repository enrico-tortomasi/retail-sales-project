TRUNCATE TABLE retail.calendar;

WITH bounds AS (
    SELECT 
        MIN(order_date) AS min_date,
        MAX(order_date) AS max_date
    FROM retail.sales
),
dates AS (
    SELECT generate_series(
        (SELECT min_date FROM bounds),
        (SELECT max_date FROM bounds),
        interval '1 day'
    )::date AS d
)
INSERT INTO retail.calendar (date_key, year, month, month_name, quarter, year_month)
SELECT 
    d,
    EXTRACT(YEAR FROM d)::int,
    EXTRACT(MONTH FROM d)::int,
    TO_CHAR(d, 'Mon'),
    EXTRACT(QUARTER FROM d)::int,
    TO_CHAR(d, 'YYYY-MM')
FROM dates;
