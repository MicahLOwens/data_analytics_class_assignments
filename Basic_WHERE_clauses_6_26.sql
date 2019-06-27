--Basic WHERE clauses
--1
SELECT
	flight_date,
	flight_num,
	carrier,
	origin
FROM public.airline_on_time_west_coast;

--2
SELECT
	flight_date,
	flight_num,
	carrier,
	origin
FROM public.airline_on_time_west_coast

WHERE origin='SEA';

--3
SELECT
	carrier,
	AVG(arrival_delay)
FROM public.airline_on_time_west_coast
Where flight_date BETWEEN '2014-12-01' AND '2014-12-31'
Group by carrier,flight_date
