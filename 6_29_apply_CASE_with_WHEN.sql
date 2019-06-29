/*
Exercise: apply CASE with WHEN (20 min)

Notes:

Work in pairs.
For the prompts 1, and 2 use the Pronto Bike share trip table.
For prompts 3, 4, and 5 use the airline on-time data.
Examples of the data returned by the queries in this exercise are available in this  document.
Instructions:

1. Using the Pronto Bike share trip table, create a query that returns the columns start time, from_station, to_station, and trip_duration for July 1, 2014.
2. Add a column "stations_match" that designates whether the from_ and to_stations are the same.
Return a value of 1 when they match and a 0 when they don't match.
3. Using the airline on-time data, create a query that returns the fl_date, carrier, and average arr_delay for December 2014.
4. Add a boolean column that is TRUE if the origin_city name is in New York (state), Colorado, California, Washington, or Arizona. Make it FALSE when it is any other city.
5. Submit your queries in the field below.
*/

--1
SELECT
	starttime,
	from_Station_name,
	to_Station_name,
	tripduration,
	cast (starttime as date) as trip_date

from da_pronto.trip
WHERE
	cast (starttime as text) like('2015-07-01%')
	--could also replace this line with: cast (starttime as date) = '2015-07-01'
LIMIT 1000;

--2
SELECT
	starttime,
	from_Station_name,
	to_Station_name,
	tripduration,
	cast (starttime as date) as trip_date,
CASE
	when from_station_name = to_Station_name THEN 'TRUE'
	ELSE 'FALSE'
	END
from da_pronto.trip
WHERE
	cast (starttime as text) like('2015-07-01%')
	--could also replace this line with: cast (starttime as date) = '2015-07-01'
LIMIT 1000;

--3
SELECT
	flight_date,
	carrier,
	avg(arrival_delay) as avg_arrival_delay

from public.airline_on_time_west_coast
WHERE

	CAST (flight_date as text) like('2014-12%')
GROUP BY flight_date,
carrier

LIMIT 1000;

--4
SELECT
	flight_date,
	carrier,
	avg(arrival_delay) as avg_arrival_delay,
	REGEXP_MATCHES(origin_city_name,', (.*)') AS Origin_State,
	
	
	CASE
		WHEN right(origin_city_name,2) in ('NY', 'CO', 'WA', 'AZ')
		THEN TRUE
		ELSE FALSE
		END

from public.airline_on_time_west_coast
WHERE

	CAST (flight_date as text) like('2014-12%')
GROUP BY flight_date,
carrier,
origin_city_name

LIMIT 1000;
