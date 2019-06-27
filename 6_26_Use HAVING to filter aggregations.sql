/*
Use HAVING to filter aggregations
Exercise: create queries requiring HAVING on aggregate columns (25 min)

Notes:
Work individually, but use every resource at your disposal, including reaching out to peers.
Use the weather anomalies data table for this challenge.
Examples of the data returned by the queries in this lesson are available in this  document.
Instructions:

Create a query that returns the minimum temperature in 2013 for each station for the year.
Modify the query to include just the stations with a latitude > 36.
Modify the query to return just the stations where the minimum temperature for the year is less than or equal to -10.
Optional: modify the query to return the minimum temperature in Fahrenheit and limit it to minimum temperatures that are less than 0 degrees Fahrenheit.
Submit your query below.
*/

--1
SELECT
	station_name,
	min(min_temp)

FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY
	station_name

ORDER BY 1;

--2
SELECT
	station_name,
	min(min_temp)

FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '2013-01-01' AND '2013-12-31'
AND latitude > '36'
GROUP BY
	station_name

ORDER BY 1;

--3
SELECT
	station_name,
	min(min_temp)

FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '2013-01-01' AND '2013-12-31'
AND latitude > '36'
GROUP BY
	station_name
HAVING MIN(min_temp) <= '-10'
