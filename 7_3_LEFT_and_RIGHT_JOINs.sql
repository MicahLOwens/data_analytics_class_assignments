/*
LEFT and RIGHT JOINs
Exercise: join two tables with LEFT JOIN and RIGHT JOIN (15 min)

Notes:

Join tables using LEFT OUTER JOIN and RIGHT OUTER JOIN.
Work in pairs.
Use the da_sales tables for this challenge.
Examples of the data returned by the queries in this lesson are available in this  document.
Instructions:

1. Create a query that returns the unique (distinct) IDs in the customers table. Note how many are returned.
2. Create a query that returns the unique (distinct) IDs in the customers table when joined to the purchases table with an INNER JOIN. Note how many are returned.
3. Create a query that returns the unique (distinct) IDs in the customers table when joined to the purchases table with a LEFT JOIN. Note how many are returned.
4. Create a query that returns the unique (distinct) IDs in the customers table when joined to the purchases table with a RIGHT JOIN. Note how many are returned.
5. Submit the query that produced the most unique customer IDs and a count of the unique IDs returned.
*/
--1
/*SELECT count distinct("id")
FROM da_sales.customers c
Limit 2000;*/
--2
SELECT distinct c.id
	
	FROM da_sales.customers c

JOIN da_sales.purchases p  ON c.id = p.custid
Limit 2000;

--3
SELECT distinct c.id
	
	FROM da_sales.customers c

LEFT JOIN da_sales.purchases p  ON c.id = p.custid
Limit 2000;

--4
SELECT distinct c.id
	
	FROM da_sales.customers c

RIGHT JOIN da_sales.purchases p  ON c.id = p.custid
Limit 2000;

--5
SELECT distinct c.id
	
	FROM da_sales.customers c

LEFT JOIN da_sales.purchases p  ON c.id = p.custid
Limit 2000;