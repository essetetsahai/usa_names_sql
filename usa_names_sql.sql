
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
--SELECT MIN(year), MAX(year)
--FROM names;

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
-- SELECT gender, SUM(num_registered) AS total 
-- FROM names 
-- GROUP BY gender
-- ORDER BY total DESC;

--There are more males (177,573,793) than females (174,079,232).


--8. What are the most popular male and female names overall (i.e., the most total registrations)?
-- (SELECT name, gender, SUM(num_registered) AS total
-- FROM names
-- WHERE gender = 'M'
-- GROUP BY gender, name
-- ORDER BY total DESC
-- LIMIT 1)
-- UNION ALL
-- (SELECT name, gender, SUM(num_registered) AS total
-- FROM names
-- WHERE gender = 'F'
-- GROUP BY gender, name
-- ORDER BY total DESC
-- LIMIT 1);

--The most popular male name is James (5,164,280). 
--The most popular female name is (4,125,675).


--9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
-- (SELECT name, gender, SUM(num_registered) AS total
-- FROM names
-- WHERE gender = 'M' AND year BETWEEN 2000 AND 2009
-- GROUP BY gender, name
-- ORDER BY total DESC
-- LIMIT 1)
-- UNION ALL
-- (SELECT name, gender, SUM(num_registered) AS total
-- FROM names
-- WHERE gender = 'F' AND year BETWEEN 2000 AND 2009
-- GROUP BY gender, name
-- ORDER BY total DESC
-- LIMIT 1);

-- The most popular boy name is Jacob (273,844). 
-- The most popular girl name is Emily (223,690).


--10. Which year had the most variety in names (i.e. had the most distinct names)?

-- SELECT year, COUNT(DISTINCT names) 
-- FROM names
-- GROUP BY year
-- ORDER BY COUNT(DISTINCT names) DESC
-- LIMIT 1;

--2008 had the most variety in names (35,079).


--11. What is the most popular name for a girl that starts with the letter X?
-- SELECT name, SUM(num_registered) AS total
-- FROM names
-- WHERE name LIKE 'X%' AND gender = 'F'
-- GROUP BY name
-- ORDER BY total DESC
-- LIMIT 1;

--Ximena is the most popular name for girls with letter X (26,145).


--12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE name LIKE 'Q%' AND name NOT LIKE '_u%';

--There are 46 names like that.


--13. Which is the more popular spelling between "Stephen" and "Steven"? 
--    Use a single query to answer this question.
-- SELECT name, SUM(num_registered)
-- FROM names
-- WHERE name = 'Steven' OR name = 'Stephen'
-- GROUP BY name;

--Steven(1,286,951) is more a popular spelling than Stephen (860,972).


--14. What percentage of names are "unisex" - that is 
--    what percentage of names have been used both for boys and for girls?

---------------------------------------------
-- SELECT name, COUNT(DISTINCT gender) AS count
-- FROM names
-- GROUP BY name 
-- HAVING COUNT(DISTINCT gender) > 1 ;
--------------------------------------------

-- SELECT COUNT(DISTINCT xyz.uni) AS unisex_tot, COUNT(DISTINCT(name)) AS all_names, ROUND((100.0*COUNT(DISTINCT xyz.uni)/COUNT(DISTINCT(name))), 1) AS perc

-- FROM(SELECT name AS uni, COUNT(DISTINCT gender) AS count
-- 	FROM names
-- 	GROUP BY name 
-- 	HAVING COUNT(DISTINCT gender) > 1) AS xyz
-- RIGHT JOIN names AS abc
-- ON xyz.uni = abc.name;

--10.9% of names are unisex.

--15. How many names have made an appearance in every single year since 1880?
-- SELECT name, COUNT(DISTINCT year) AS count
-- FROM names
-- GROUP BY name 
-- HAVING COUNT(DISTINCT year) = 139;
--921 names have appeared every single year. 


--16. How many names have only appeared in one year?
-- SELECT name
-- FROM names
-- GROUP BY name 
-- HAVING COUNT(DISTINCT year) = 1;
--21,123 names have only appeared in one year. 


--17. How many names only appeared in the 1950s?
-- SELECT name, COUNT(DISTINCT name)
-- FROM names
-- GROUP BY name
-- HAVING MIN(year) >=1950 AND MAX(year) < 1960;
--There are 661 names that only appeared in the 1950's.


--18. How many names made their first appearance in the 2010s?
-- SELECT name
-- FROM names
-- GROUP BY name
-- HAVING MIN(year) >=2010;
--11,270 names first appeared in 2010.


--19. Find the names that have not be used in the longest.
-- SELECT name, MAX(year)
-- FROM names
-- GROUP BY name
-- ORDER BY MAX(year)
-- LIMIT 10;
--Zilpah, Roll and Crete have not been used since 1880's


--20. What was the most popular name in 2018?
-- SELECT name, num_registered
-- FROM names
-- WHERE year = 2018
-- ORDER BY num_registered DESC

--Liam was the most popular name in 2018


--Display the most popular name each year?

-- SELECT *
-- FROM(
--   SELECT name, year, num_registered, MAX(num_registered) over (PARTITION BY year) AS max_ocr
--   FROM names
-- ) AS T
-- WHERE num_registered = max_ocr

------------------
--Bonus Questions
--1.  Find the longest name contained in this dataset. What do you notice about the long names?
-- SELECT name, CHAR_LENGTH(name) AS length
-- FROM names
-- ORDER BY CHAR_LENGTH(name) DESC
-- LIMIT 10;
--The longest names have lengths of 15. The longest names look like two names added together.
--Most of them include the name Christopher.


--2. 







--1. Which name/gender combinations have had a year with at least 80,000 registrations?

-- SELECT DISTINCT name, gender
-- FROM names
-- WHERE num_regitered >=80000;


-- 2. Which names have at least 1,000,000 total registrations?
-- SELECT name, SUM(num_registered) AS total_registered
-- FROM names
-- GROUP BY name
-- HAVING SUM(num_registered) >= 1000000 ;


-- 3. Which names have had at least 150,000 registered from the year 2010 onwards.
-- SELECT name, SUM(num_registered)
-- FROM names
-- WHERE year >= 2010
-- GROUP BY name
-- HAVING SUM(num_registered) >= 150000



