SELECT 
city,
COUNT(store_id) AS No_of_stores 
FROM 
     dim_stores
GROUP BY 
       city
ORDER BY  
     No_of_stores 
     DESC;