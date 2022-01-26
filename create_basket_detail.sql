CREATE TABLE 'basket_detail' AS
SELECT
	CAST(BASKET_ID AS INT) AS basket_id,
	PROD_CODE AS prod_code,
	QUANTITY AS quantity,
	SPEND / QUANTITY AS unitprice,
	SPEND AS spend
FROM Supermarket
ORDER BY basket_id;
