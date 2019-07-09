/*
Add a nested subquery to a query
Exercise: use nested subqueries (20 min)

Notes:

Use a subquery to return an aggregate with a different grain.
Use the Pronto trip table.
Examples of the data returned by the queries in this lesson are available in this  document.
Instructions:

1. Create a query that returns the trip duration average for each day, sorted by day ascending.
2. Modify the query to add a column with the average trip duration for all time.
3. Modify the query to add a column that shows the difference of each day's average and the average duration for all days.
4. Submit your query in the box below.
*/

--1
SELECT
	CAST(starttime as date) as trip_date,
	avg(tripduration) as average_trip_duration

FROM da_pronto.trip
GROUP BY trip_date
ORDER BY trip_date;

--2
SELECT
	CAST(starttime as date) as trip_date,
	avg(tripduration) as average_trip_duration,
	(SELECT
	 	avg(tripduration)
	FROM da_pronto.trip) as avg_trip_duration_all_time

FROM da_pronto.trip
GROUP BY trip_date
ORDER BY trip_date;

--3
SELECT
	CAST(starttime as date) as trip_date,
	avg(tripduration) as average_trip_duration,
	(SELECT
	 	avg(tripduration)
		FROM da_pronto.trip) as avg_trip_duration_all_time,
	avg(tripduration) - 
	 	(SELECT
	 		avg(tripduration)
			FROM da_pronto.trip)
		as diff_from_avg

FROM da_pronto.trip
GROUP BY trip_date
ORDER BY trip_date