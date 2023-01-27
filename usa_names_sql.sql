
-- SELECT *
-- FROM names 
-- LIMIT 5;


--1. How many rows are in the names table?
-- SELECT COUNT(*)
-- FROM names;

--The names table has 1,957,046 rows.


--2. How many total registered people appear in the dataset?
-- SELECT SUM(num_registered) AS total
-- FROM names;

-- There are 351,653,025 total registered people in the dataset.


--3. Which name had the most appearances in a single year in the dataset?
-- SELECT name, num_registered, year
-- FROM names
-- WHERE num_registered = (SELECT MAX(num_registered) FROM names);

-- Linda had the most appearances with 99,689 registrations in 1947.


--4.What range of years are included?
-- SELECT MIN(year)
-- FROM names
-- UNION ALL
-- SELECT MAX(year)
-- FROM names

--The years range from 1880 TO 2018.


--5. What year has the largest number of registrations?
-- SELECT year, SUM(num_registered) AS total 
-- FROM names 
-- GROUP BY year
-- ORDER BY total DESC
-- LIMIT 1;

--1957 had the largest total number of registrations at 4,200,022.


--6. How many different (distinct) names are contained in the dataset?
-- SELECT COUNT(DISTINCT name)
-- FROM names;

--There are 98,400 registered names in the dataset.


--7.Are there more males or more females registered?
