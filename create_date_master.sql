CREATE TABLE 'date_master' AS
SELECT
	shop_date,
	shop_year,
	CAST(shop_quarter AS STRING) || 'Q' || CAST(shop_year AS STRING) AS shop_quarterid,
	shop_quarter,
	shop_monthid,
	shop_month,
	CASE
		WHEN shop_month == 1 THEN 'Jan'
		WHEN shop_month == 2 THEN 'Feb'
		WHEN shop_month == 3 THEN 'Mar'
		WHEN shop_month == 4 THEN 'Apr'
		WHEN shop_month == 5 THEN 'May'
		WHEN shop_month == 6 THEN 'Jun'
		WHEN shop_month == 7 THEN 'Jul'
		WHEN shop_month == 8 THEN 'Aug'
		WHEN shop_month == 9 THEN 'Sep'
		WHEN shop_month == 10 THEN 'Oct'
		WHEN shop_month == 11 THEN 'Nov'
		ELSE 'Dec'
	END AS shop_month_short,
	CASE
		WHEN shop_month == 1 THEN 'January'
		WHEN shop_month == 2 THEN 'February'
		WHEN shop_month == 3 THEN 'March'
		WHEN shop_month == 4 THEN 'April'
		WHEN shop_month == 5 THEN 'May'
		WHEN shop_month == 6 THEN 'June'
		WHEN shop_month == 7 THEN 'July'
		WHEN shop_month == 8 THEN 'August'
		WHEN shop_month == 9 THEN 'September'
		WHEN shop_month == 10 THEN 'October'
		WHEN shop_month == 11 THEN 'November'
		ELSE 'December'
	END AS shop_month_long,
	shop_weekid,
	shop_week,
	CASE
		WHEN shop_weekday == 0 THEN 'Sun'
		WHEN shop_weekday == 1 THEN 'Mon'
		WHEN shop_weekday == 2 THEN 'Tue'
		WHEN shop_weekday == 3 THEN 'Wed'
		WHEN shop_weekday == 4 THEN 'Thu'
		WHEN shop_weekday == 5 THEN 'Fri'
		ELSE 'Sat'
	END AS shop_weekday_short,
	CASE
		WHEN shop_weekday == 0 THEN 'Sunday'
		WHEN shop_weekday == 1 THEN 'Monday'
		WHEN shop_weekday == 2 THEN 'Tuesday'
		WHEN shop_weekday == 3 THEN 'Wednesday'
		WHEN shop_weekday == 4 THEN 'Thursday'
		WHEN shop_weekday == 5 THEN 'Friday'
		ELSE 'Saturday'
	END AS shop_weekday_long,
	shop_weekday,
	shop_day
FROM (
	SELECT
		*,
		CASE
			WHEN shop_month BETWEEN 1 AND 3 THEN 1
			WHEN shop_month BETWEEN 4 AND 6 THEN 2
			WHEN shop_month BETWEEN 7 AND 9 THEN 3
			ELSE 4
		END AS shop_quarter
	FROM (
		SELECT
			shop_date,
			CAST(STRFTIME('%Y', shop_date) AS INT) AS shop_year,
			DATE(STRFTIME('%Y-%m-01', shop_date)) AS shop_monthid,
			CAST(STRFTIME('%m', shop_date) AS INT) AS shop_month,
			shop_week AS shop_weekid,
			shop_week % 100 AS shop_week,
			CAST(STRFTIME('%w', shop_date) AS INT) AS shop_weekday,
			CAST(STRFTIME('%d', shop_date) AS INT) AS shop_day
		FROM (
			SELECT
				shop_week,
				DATE(SUBSTR(shop_date, 1, 4) || '-' || SUBSTR(shop_date, 5, 2) || '-' || SUBSTR(shop_date, 7, 2)) AS shop_date
			FROM (
				SELECT DISTINCT
					CAST(SHOP_WEEK AS INT) AS shop_week,
					CAST(SHOP_DATE AS STRING) AS shop_date 
				FROM Supermarket
			)
		)
	)
)
ORDER BY shop_date;
