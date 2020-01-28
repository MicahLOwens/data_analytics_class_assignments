/*
UNION more than two tables
Exercise: join more than two tables with UNION and UNION ALL (15 min)

Use the auto brand rank tables.

Instructions:

1. Create a query that returns the distinct values of the company column in the combination of 2016_auto, 2015_auto, and 2014_auto tables.
2. Modify the query to retrieve a list of companies that were in the top 20 in 2014, 2015, or 2016.
3. Submit your query in the box below.
*/

--1
SELECT
	company
FROM da_auto.auto_2014

UNION

Select
	company
FROM da_auto.auto_2015

UNION

Select
	company
FROM da_auto.auto_2016;

--2
SELECT
	"rank",
	company
FROM da_auto.auto_2014
WHERE "rank" <= '20'

UNION

Select
	"rank",
	company
FROM da_auto.auto_2015
WHERE "rank" <= '20'

UNION

Select
	"rank",
	company
FROM da_auto.auto_2016
WHERE "rank" <= '20'
ORDER BY "rank"