
-- Selecting all columns from a table

select * from listings$

--Calculating projected revenue

SELECT TOP 20
  id,
  listing_url,
  name,
  30 - availability_30 AS booked_out_30,
  TRY_CAST(REPLACE(price, '$', '') AS FLOAT) AS price_clean,
  TRY_CAST(REPLACE(price, '$', '') AS FLOAT) * CAST(30 - availability_30 AS BIGINT) / beds AS proj_rev_30
FROM listings$
WHERE ISNUMERIC(id) = 1
  AND CAST(id AS BIGINT) = id
  AND id NOT LIKE '%.%'
  AND id NOT LIKE '%e%'
  AND id NOT LIKE '%E%'
ORDER BY proj_rev_30 DESC;

-- Finding the the top 10 popular hosts 

SELECT TOP 10 host_name
FROM listings$
GROUP BY host_name
ORDER BY count(*) DESC;

-- Finding the top 5 popular neighbourhoods

SELECT TOP 5 neighbourhood_cleansed
FROM listings$
GROUP BY neighbourhood_cleansed
ORDER BY count(*) DESC;


