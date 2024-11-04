SELECT 
DISTINCT(product_name),
base_price 
FROM 
    fact_events e
JOIN 
     dim_products p 
ON
      p.product_code = e.product_code
WHERE 
     base_price > 500 
     AND 
     promo_type = "BOGOF";