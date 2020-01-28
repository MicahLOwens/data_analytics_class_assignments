/*
Add a subquery using the WITH AS structure

Instructions:

1. Re-implement the query solution from the nested subquery exercise using a WITH AS structure.
2. Return the same results as the nested subqueries query.
3. Submit your query in the box below.
*/

WITH total_avg_duration as(
	SELECT
		avg(tripduration) as tripduration
	FROM da_pronto.trip)

SELECT
	cast(starttime as date),
	avg(t.tripduration) as avg_tripduration,
	d.tripduration,
	avg(t.tripduration) - d.tripduration as total_avg_tripduration	
	
FROM da_pronto.trip t

JOIN total_avg_duration d on TRUE

GROUP BY
	t.starttime,
	t.tripduration,
	d.tripduration