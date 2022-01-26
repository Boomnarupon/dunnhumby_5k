CREATE TABLE 'store_master' AS
SELECT
	store_code,
	store_format,
	SUBSTR(store_subregion, 1, 1) AS store_region,
	store_subregion
FROM (
	SELECT DISTINCT
		STORE_CODE AS store_code,
		STORE_FORMAT AS store_format,
		STORE_REGION AS store_subregion
	FROM Supermarket
)
ORDER BY store_code;
