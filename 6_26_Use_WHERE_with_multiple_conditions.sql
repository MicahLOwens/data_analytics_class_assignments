/*
Use WHERE with multiple conditions
Exercise: implement a WHERE clause with two or more conditions using AND and OR (25 min)

Notes:

Work individually for 7 minutes and then in teams of two or three.
Use the airline_on_time_west_coast data table in the public schema.
Examples of the data returned by the queries in this lesson are available in this document  .
Instructions:

1. Create a query that returns the average, minimum, and maximum arrival_delay by origin city, destination city, and carrier.
2. Modify the query to only allow the origin airports DEN, LAX, SFO, SEA, and PHX.
3. Modify the query to include just the destination cities in California.
4. Modify the query to include just the destination cities in California and New York.
5. Submit your query below.
*/

--1
Select
	avg(arrival_delay) as "avg arrival delay",
	min(arrival_delay) as "min arrival delay",
	max(arrival_delay) as "max arrival delay",
	origin_city_name,
	dest_city_name,
	carrier

FROM public.airline_on_time_West_coast
Group by
	origin_city_name,
	dest_city_name,
	carrier;

--2
Select
	avg(arrival_delay) as "avg arrival delay",
	min(arrival_delay) as "min arrival delay",
	max(arrival_delay) as "max arrival delay",
	origin_city_name,
	dest_city_name,
	carrier

FROM public.airline_on_time_West_coast
WHERE
	origin in ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
Group by
	origin_city_name,
	dest_city_name,
	carrier;

--3A
Select
	avg(arrival_delay) as "avg arrival delay",
	min(arrival_delay) as "min arrival delay",
	max(arrival_delay) as "max arrival delay",
	origin_city_name,
	dest_city_name,
	carrier

FROM public.airline_on_time_West_coast
WHERE
	origin in ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
	AND dest_city_name like ('%, CA')
Group by
	origin_city_name,
	dest_city_name,
	carrier;

--3B
Select
	avg(arrival_delay) as "avg arrival delay",
	min(arrival_delay) as "min arrival delay",
	max(arrival_delay) as "max arrival delay",
	origin_city_name,
	dest_city_name,
	carrier

FROM public.airline_on_time_West_coast
WHERE
	origin in ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
	AND RIGHT(dest_city_name, 2) = 'CA'
Group by
	origin_city_name,
	dest_city_name,
	carrier;

--4
Select
	avg(arrival_delay) as "avg arrival delay",
	min(arrival_delay) as "min arrival delay",
	max(arrival_delay) as "max arrival delay",
	origin_city_name,
	dest_city_name,
	carrier

FROM public.airline_on_time_West_coast
WHERE
	origin in ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
	AND dest_city_name like ('%, CA')
	OR dest_city_name like ('%, NY')
Group by
	origin_city_name,
	dest_city_name,
	carrier;
