-- IMPORTANTE
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(sl.date, '%Y-%m') AS MONTH,
        pr.category, 
        SUM(sl.quantity) AS total_quantity, 
        SUM(sl.quantity * sl.price) AS total_sales
    FROM sale AS sl
    INNER JOIN product AS pr ON sl.product_id = pr.id
    GROUP BY MONTH, pr.category
)
SELECT
    MONTH,
    category,
    total_quantity,
    total_sales,
    LAG(total_sales) OVER (PARTITION BY category ORDER BY MONTH) AS previous_month_sales,
    ROUND(
        100.0 * (total_sales - COALESCE(LAG(total_sales) OVER (PARTITION BY category ORDER BY MONTH), 0)) 
        / COALESCE(LAG(total_sales) OVER (PARTITION BY category ORDER BY MONTH), 1), 2
    ) AS growth_percentage
FROM MonthlySales
ORDER BY MONTH DESC, category;