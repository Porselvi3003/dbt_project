WITH sales AS (
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply('unit_price', 'quantity') }} as calculated_gross_amount,
        gross_amount,
        payment_method
    FROM
        {{ ref('bronze_sales') }}
),

bronze_products AS (
    SELECT
        product_sk,
        category
    FROM
        {{ ref('bronze_product') }}
),

customer AS (
    SELECT
        customer_sk,
        gender
    FROM
        {{ ref('bronze_customers') }}
),

final_table AS (
    SELECT
        sales.sales_id,
        sales.gross_amount,
        sales.payment_method,
        bronze_products.category,
        customer.gender
    FROM
        sales
    JOIN
        bronze_products ON sales.product_sk = bronze_products.product_sk
    JOIN
        customer ON sales.customer_sk = customer.customer_sk
)

SELECT
    category,
    gender,
    sum(gross_amount) as total_sales
FROM
    final_table
GROUP BY
    category, gender
ORDER BY
    total_sales