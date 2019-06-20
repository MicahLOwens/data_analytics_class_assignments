# Exercise: pull bike rental information from the Pronto trip data

## Question 1
_Create a query that counts the rows in the da_pronto schema's trip table._

```
SELECT COUNT (*)

FROM da_pronto.trip

```

## Question 2
_Create a query that returns the values of the from_station_name column, and to_station_name limited to 1,000 rows._

```
Select

	from_Station_name,
	to_station_name

FROM da_pronto.trip

LIMIT 1000
```

## Question 3:
_Create a query that returns the distinct values of the from_station_name column._

```
Select DISTINCT

	from_Station_name

FROM da_pronto.trip
```

## Question 4:
_Create a query that returns the distinct combinations of from station names and to station names. Order by from station and secondarily by to station name._

```
Select DISTINCT

	from_Station_name,
	to_station_name

FROM da_pronto.trip

ORDER BY
from_Station_name,
to_station_name
```

## Question 5:
_Create a query that returns the 600 longest trips (trip durations), including the starttime, the from station name, and the to station name of each trip.

  * Rename starttime to start_time in the table returned by the query.
  * Sort by trip duration descending._

```
Select

	starttime as start_time,
	from_Station_name,
	to_station_name,
	tripduration

FROM da_pronto.trip

ORDER BY
tripduration DESC

LIMIT 600
```
