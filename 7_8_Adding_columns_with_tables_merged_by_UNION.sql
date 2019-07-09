/*
Adding columns with tables merged by UNION
Exercise: add a column to the auto data to indicate the year that the data is for (15 min)

Notes:

Combine tables of data and add a column that indicates the year.
Use the auto brand rank tables (da_auto).
Instructions:

1. Create a query that returns all rows and columns from 2015 and 2016 auto files.
2. Add a year column that contains the year that the data is for.
3. Add the rows from the 2014 table so that 2014, 2015, and 2016 are merged together.
4. Submit your query in the box below.
*/

--1 & 2
Select
'2015' AS "Year",
*
FROM da_auto.auto_2015

UNION

Select
'2016' AS "Year",
*
FROM da_auto.auto_2016;

--3
SELECT
'2014' AS "Year",
	"rank",
	company,
	country,
	CAST(total as text) as vehicles,
	cars,
	lcv,
	hcv,
	buses
	
FROM da_auto.auto_2014

UNION

Select
'2015' AS "Year",
	"rank",
	company,
	country,
	vehicles,
	NULL as cars,
	NULL as lcv,
	NULL as hcv,
	NULL as buses
FROM da_auto.auto_2015

UNION

Select
'2016' AS "Year",
	"rank",
	company,
	country,
	vehicles,
	NULL as cars,
	NULL as lcv,
	NULL as hcv,
	NULL as buses
FROM da_auto.auto_2016