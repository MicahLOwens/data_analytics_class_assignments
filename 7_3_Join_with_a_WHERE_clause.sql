/*
Join with a WHERE clause
Exercise: use an INNER JOIN to combine tables with various conditions (20 min)

Notes:

Join tables to return the data that you need, and filter to just the data that you want returned.
Work in pairs.
Use the da_world schema.
Instructions:

1. Create a query that returns the city populations by city name.
2. Create a query that adds a column with country name and continent.
3. Restrict the query to cities in Africa.
4. Restrict the cities to those that have populations > 1,000,000.
5. Submit your final query below.
*/

--1
SELECT
	name as city,
	population
FROM da_world.city
LIMIT 500;

--2
SELECT
	c.name as city,
	c.population,
	y.name,
	y.continent
	
FROM da_world.city c
JOIN da_world.country y ON y.code = c.countrycode;

--3
SELECT
	c.name as city,
	c.population,
	y.name,
	y.continent,
	c.countrycode
	
FROM da_world.city c
JOIN da_world.country y ON y.code = c.countrycode

WHERE y.continent = 'Africa';

--4
SELECT
	c.name as city_name,
	c.population,
	y.name as country_name,
	y.continent,
	c.countrycode
	
FROM da_world.city c

JOIN da_world.country y ON y.code = c.countrycode

WHERE
	(c.population > 1000000 AND
	y.continent = 'Africa');