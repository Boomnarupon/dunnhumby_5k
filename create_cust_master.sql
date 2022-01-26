CREATE TABLE 'cust_master' AS
SELECT DISTINCT
	CUST_CODE AS cust_code,
	CUST_LIFESTAGE AS cust_lifestage,
	CUST_PRICE_SENSITIVITY AS cust_price_sensitivity
FROM Supermarket
WHERE cust_code IS NOT NULL
ORDER BY cust_code;
