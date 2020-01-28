/*
INNER JOIN query
Exercise: use an INNER JOIN to combine tables (15 min)

Notes:

Join tables to return the data that you need.
Work in pairs.
Use the tables in the da_sales schema.
Examples of the data returned by the queries in this lesson are available in this  document.
Instructions:

1. Create a query that returns the customer ID, product ID, quantity, and date from the purchases table.
2. Add the column "name" from the customers dimension table to the query using an INNER JOIN.
3. Submit your final query below.
*/

SELECT
Custid,
customers.id,
"name",
prodid,
quantity,
"date"

FROM da_sales.purchases

JOIN da_sales.customers
ON purchases.custid = customers.id