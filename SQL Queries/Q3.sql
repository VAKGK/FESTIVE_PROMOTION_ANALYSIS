SELECT 
c.campaign_name,
ROUND(SUM(base_price * `quantity_sold(before_promo)`)/1000000,2) AS Total_rev_before_promotion,
ROUND(SUM(
CASE
WHEN promo_type = "BOGOF" THEN base_price * 0.5 *2*(`quantity_sold(after_promo)`)
WHEN promo_type = "50% OFF" THEN base_price * 0.5 *`quantity_sold(after_promo)`
WHEN promo_type = "25% OFF" THEN base_price * 0.75 *`quantity_sold(after_promo)`
WHEN promo_type = "33% OFF" THEN base_price * 0.67 *`quantity_sold(after_promo)`
WHEN promo_type = "500 cashback" THEN (base_price-500)*`quantity_sold(after_promo)`
END )/1000000,2) AS Total_rev_after_promotion
FROM
	fact_events e
JOIN  
    dim_campaigns c 
ON 
c.campaign_id = e.campaign_id
GROUP BY  campaign_name;

