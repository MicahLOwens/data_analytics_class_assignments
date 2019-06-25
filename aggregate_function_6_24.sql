--Apply an Aggregation Function

--1
SELECT  COUNT(*)
from da_pronto.trip

--2
SELECT sum(tripduration), COUNT(*)
from da_pronto.trip

--3
SELECT to_station_name, sum(tripduration), COUNT(*)
from da_pronto.trip

GROUP BY to_station_name
LIMIT 100

--4
SELECT to_station_name, sum(tripduration), COUNT(*)
from da_pronto.trip

GROUP BY to_station_name
ORDER BY sum asc
LIMIT 100
