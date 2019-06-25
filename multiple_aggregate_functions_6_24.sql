--Apply multiple aggregation functions

--Question 1
SELECT airline_on_time_west_coast.unique_Carrier, count(unique_carrier)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier;

--Question 2
SELECT airline_on_time_west_coast.unique_Carrier, count(unique_carrier)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY count(unique_carrier) asc;

--Question 3
SELECT airline_on_time_west_coast.unique_Carrier, sum(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY sum(arrival_delay) desc;

--Question 4
SELECT airline_on_time_west_coast.unique_Carrier, avg(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier;

--Question 5
SELECT airline_on_time_west_coast.unique_Carrier, avg(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY avg(arrival_delay) desc;

--Question 6
SELECT airline_on_time_west_coast.unique_Carrier, min(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY min(arrival_delay) asc;

--Question 7
SELECT
	airline_on_time_west_coast.origin,
	airline_on_time_west_coast.unique_Carrier,
	avg(arrival_delay),
	min(arrival_delay),
	max(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY origin, unique_carrier;

--Question 8
SELECT
	airline_on_time_west_coast.origin,
	airline_on_time_west_coast.unique_Carrier,
	avg(arrival_delay),
	min(arrival_delay),
	max(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY origin, unique_carrier
ORDER BY origin asc, avg(arrival_delay) desc;
