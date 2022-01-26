CREATE TABLE 'basket' AS
SELECT
	store_code,
	shop_date,
	CASE
		WHEN shop_hour <= 11 THEN 'Morning'
		WHEN shop_hour BETWEEN 12 AND 16 THEN 'Afternoon' 
		ELSE 'Evening'
	END AS shop_daytime,
	shop_hour,
	cust_code,
	basket_id,
	basket_size,
	basket_type,
	basket_dominant_mission,
	basket_price_sensitivity
FROM (
	SELECT DISTINCT
		STORE_CODE AS store_code,
		SHOP_DATE AS shop_date,
		SHOP_HOUR AS shop_hour,
		CUST_CODE AS cust_code,
		CAST(BASKET_ID AS INT) AS basket_id,
		BASKET_SIZE AS basket_size,
		BASKET_TYPE AS basket_type,
		BASKET_DOMINANT_MISSION AS basket_dominant_mission,
		BASKET_PRICE_SENSITIVITY AS basket_price_sensitivity
	FROM Supermarket
)
ORDER BY store_code, shop_date, shop_hour, basket_id;
