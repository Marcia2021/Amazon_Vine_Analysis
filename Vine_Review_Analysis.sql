-- Create vine table in schema
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating TEXT,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Print sample of data
SELECT *
FROM vine_table 
LIMIT 5;

---------------------------------------------
------------------- Step1 -------------------
---------------------------------------------
-- Create vine table with total_votes>=20
CREATE TABLE vine_total_table AS 
SELECT *
FROM vine_table
WHERE total_votes>=20;

-- Check value of total_votes after selection
SELECT DISTINCT total_votes
FROM vine_total_table
ORDER BY total_votes LIMIT 5;

---------------------------------------------
------------------- Step2 -------------------
---------------------------------------------
-- Create table with helpful_votes/total_votes >=50%
CREATE TABLE vine_rate_table AS
SELECT  *
       ,CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) AS rate
FROM vine_total_table
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

-- Check rate value to confirm selection
SELECT DISTINCT rate
FROM vine_rate_table
ORDER BY rate LIMIT 5;

---------------------------------------------
------------------- Step3 -------------------
---------------------------------------------
-- Create table for paid vine program reviews
CREATE TABLE paid_vine_table AS
SELECT *
FROM vine_rate_table
WHERE vine = 'Y';

-- Check vine value after filter
SELECT DISTINCT vine
FROM paid_vine_table;

-- Total number of paid reviews
SELECT COUNT(*) AS N_paid_review
FROM paid_vine_table;

-- Number of 5-star reviews
SELECT COUNT(*) AS N_paid_5starreview
FROM paid_vine_table
WHERE star_rating = '5';

-- Percent of 5-star reviews
SELECT CAST(N_paid_5starreview AS FLOAT)/CAST(N_paid_review AS FLOAT) AS pct

FROM (SELECT COUNT(*) AS N_paid_review
      FROM paid_vine_table) a
      JOIN
     (SELECT COUNT(*) AS N_paid_5starreview
      FROM paid_vine_table
      WHERE star_rating = '5') b
ON TRUE;

---------------------------------------------
------------------- Step4 -------------------
---------------------------------------------
-- Create table for unpaid non-vine program reviews
CREATE TABLE unpaid_nvine_table AS
SELECT *
FROM vine_rate_table
WHERE vine = 'N';

-- Check vine value after filter
SELECT DISTINCT vine
FROM unpaid_nvine_table;

-- Total number of unpaid reviews
SELECT COUNT(*) AS N_unpaid_review
FROM unpaid_nvine_table;

-- Number of 5-star reviews
SELECT COUNT(*) AS N_unpaid_5starreview
FROM unpaid_nvine_table
WHERE star_rating = '5';

-- Percent of 5-star reviews
SELECT CAST(N_unpaid_5starreview AS FLOAT)/CAST(N_unpaid_review AS FLOAT) AS unpct

FROM (SELECT COUNT(*) AS N_unpaid_review
      FROM unpaid_nvine_table) a
      JOIN
     (SELECT COUNT(*) AS N_unpaid_5starreview
      FROM unpaid_nvine_table
      WHERE star_rating = '5') b
ON TRUE;