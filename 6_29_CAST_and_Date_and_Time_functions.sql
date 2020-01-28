--Create new columns based on mathematical calculations, ||, CAST, and Date and Time functions
/*
Exercise: create new columns calculated from other columns (20 min)

Notes:

Create new columns from data in other columns.
Work in pairs.
Use the Pronto trip table data.
Examples of the data returned by the queries in this exercise are available in this  document.
Instructions:

Create a query that extracts the hour and minute of a the starttime and puts them in new columns.
Create a query that concatenates the from station id with the from station name and places in a new column.
Create a query with the from_station name to station name and and the average trip duration in hours. (According to the data dictionary the tripduration fields is in seconds.)
Optional: modify the previous query to also return a date field. Consider using the DATE_TRUNC PostgreSQL date and time function.
Submit your queries in the field below.
*/
--1 & 2
SELECT starttime,
	extract('hour' from starttime) as start_time_hour,
	extract('minute' from starttime) as start_time_minute,
	from_station_id || '_' || from_station_name as from_Station_id_name
	
FROM da_pronto.trip
LIMIT 500;

--3 & 4
SELECT
	from_station_name,
	to_station_name,
	(avg(tripduration) / 60) / 60 as tripduration_hours,
	cast (starttime as date) as trip_date,
	date_trunc('year', starttime)
	
FROM da_pronto.trip
Group by
from_station_name,
to_station_name,
starttime

ORDER BY tripduration_hours desc
LIMIT 500