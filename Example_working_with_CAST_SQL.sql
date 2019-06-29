--Working with the CAST function in SQL
SELECT
	date_ymd,
	cast(date_ymd as timestamp) as date_timestamp,
	--cast doesn't do much in this instance, but if we were casting the timestamp column as a date instead, it would be removing the extra timestamp info and giving us only the date we wanted
	station_name,
	station_name || '_' || station_id as station_name_id,
	--In SQL, two pipe characters together run the Concat function to compbine fields
	max_temp,
	cast (max_temp as INTEGER) as max_temp_int,
	--Useful for rounding things that are double precision (have decimals) to integers
	min_temp,
	max_temp - min_temp AS temp_difference,
	cast(date_ymd as text) || '_' || station_name as date_ymd_station_id
	--Some SQL langauges don't like using Concat on different data types (like dates and text), so you can use CAST to get around that by changing data types

FROM da_weather.us_weather_anomalies
ORDER BY temp_difference
LIMIT 500