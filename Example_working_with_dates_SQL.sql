--Playing with Dates in SQL
--Reference https://www.postgresql.org/docs/11/functions-datetime.html for all date Syntax in postgres
SELECT date_ymd,
	date_part('year', date_ymd) as year_date,
	extract('year' from date_ymd) as extract_Year,
	--extract is the equivalent for date_part that is used by MySQL and other popular SQL dialects
	date_part('month', date_ymd) as month_date,
	date_trunc('year', date_ymd),
	--date_trunc is a value expression of type timestamp or interval. (Values of type date and time are cast automatically to timestamp or interval, respectively.) field selects to which precision to truncate the input value. The return value is of type timestamp or interval with all fields that are less significant than the selected one set to zero (or one, for day and month).
	date_ymd - now() as age,
	--now() gets the current datetime
	age(date_ymd)
	
FROM da_weather.us_weather_anomalies
LIMIT 500