/*
Query with multiple JOINs
Exercise: join multiple tables with two or more JOINs (15 min)

Use the PostgreSQL Shell terminal to restore the text file readychef.sql  file using the "/i filename".

Instructions:

1. Create a query that returns the count of the visits for each userID.
2. Add to the query so that the user's name is returned instead of the userID.
3. Modify the query so that only users that had an event are returned.
4. Submit your final query below.
*/

SELECT
	event,
	count(event),
	e.meal_id,
	m.type,
	e.userid
FROM da_readychef.events e

LEFT JOIN da_readychef.meals m
	ON e.meal_id = m.meal_id
LEFT JOIN da_readychef.referrals r
	ON e.userid = r.referred

WHERE e.event is NOT null

GROUP BY
	event,
	e.meal_id,
	m.type,
	e.userid
