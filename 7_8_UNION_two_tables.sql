/*UNION two tables
Exercise: combine two tables with UNION and UNION ALL (15 min)

Notes:

Use the da_auto tables.
Examples of the data returned by the queries in this lesson are available in this  document.
Instructions:

1. Create a query that returns all rows from da_auto from 2015-2016.
2. Create query that returns only the distinct rows from 2015-2016.
(In this case, is the query different from the first question's query?)
3. Create a query that returns just the distinct company names from the company column in the 2015_auto and the 2016_auto tables.
Return no other columns. (You can do this with one UNION statement.)
4. Submit you query in the box below.
*/

--1
SELECT *
FROM da_auto.auto_2015

UNION ALL

Select *
FROM da_auto.auto_2016;

--1
SELECT *
FROM da_auto.auto_2015

UNION

Select *
FROM da_auto.auto_2016;

--3
SELECT
	company
FROM da_auto.auto_2015

UNION

SELECT
	company
FROM da_auto.auto_2016