CREATE TABLE 'prod_master' AS
SELECT DISTINCT
	PROD_CODE AS prod_code,
	PROD_CODE_10 AS prod_code_10,
	PROD_CODE_20 AS prod_code_20,
	PROD_CODE_30 AS prod_code_30,
	PROD_CODE_40 AS prod_code_40
FROM Supermarket
ORDER BY prod_code;
