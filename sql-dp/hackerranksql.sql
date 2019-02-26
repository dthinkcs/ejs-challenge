select *
from city c
where population > 100000 and countrycode='USA';

select name
from city
where population > 120000
and countrycode='USA';

select *
from city;

select *
from city
where id = 1661;

select *
from city
where countrycode='JPN';

select name
from city
where countrycode='JPN';


---station table
select city, state
from station;

select distinct city
from station
where mod(id, 2) = 0;

--difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
select count(city) - count(distinct city)
from station;

--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT city, LENGTH(city)
FROM station
ORDER BY LENGTH(city) ASC, city ASC LIMIT 1 ;

SELECT city, LENGTH(city)
FROM station
ORDER BY LENGTH(city) DESC, city ASC LIMIT 1;


SELECT *
FROM
(
    SELECT city, LENGTH(city)
    FROM station
    ORDER BY LENGTH(city) ASC, city ASC
)
WHERE ROWNUM <= 1;

SELECT *
FROM
(
    SELECT city, LENGTH(city)
    FROM station
    ORDER BY LENGTH(city) DESC, city ASC
)
WHERE ROWNUM <= 1;

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT distinct city
FROM station
WHERE SUBSTR(city, 1, 1)='a' OR SUBSTR(city, 1, 1)='A' OR
      SUBSTR(city, 1, 1)='e' OR SUBSTR(city, 1, 1)='E' OR
      SUBSTR(city, 1, 1)='i' OR SUBSTR(city, 1, 1)='I' OR
      SUBSTR(city, 1, 1)='o' OR SUBSTR(city, 1, 1)='O' OR
      SUBSTR(city, 1, 1)='u' OR SUBSTR(city, 1, 1)='U' ;

SELECT distinct city
FROM station
WHERE SUBSTR(LOWER(city), 1, 1) in ('a', 'e', 'i', 'o', 'u');

--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT distinct city
FROM station             --length - 1 BUG BUG BUG
WHERE SUBSTR(LOWER(city), LENGTH(city), 1) in ('a', 'e', 'i', 'o', 'u');


--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT distinct city
FROM station             --length - 1 BUG BUG BUG
WHERE SUBSTR(LOWER(city), LENGTH(city), 1) in ('a', 'e', 'i', 'o', 'u')
AND SUBSTR(LOWER(city), 1, 1) in ('a', 'e', 'i', 'o', 'u');

--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.
SELECT distinct city
FROM station             --length - 1 BUG BUG BUG
WHERE SUBSTR(LOWER(city), 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u');


SELECT distinct city
FROM station             --length - 1 BUG BUG BUG
WHERE SUBSTR(LOWER(city), LENGTH(city), 1) NOT IN ('a', 'e', 'i', 'o', 'u');

SELECT distinct city
FROM station             --length - 1 BUG BUG BUG
WHERE SUBSTR(LOWER(city), LENGTH(city), 1) NOT in ('a', 'e', 'i', 'o', 'u')
AND SUBSTR(LOWER(city), 1, 1) NOT in ('a', 'e', 'i', 'o', 'u');




--Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
--BUG SUBSTR(one, two, three)  ORDER BY SUBSTR(LENGTH(name) - 2, 3) , id ASC;
SELECT name
FROM students
WHERE marks > 75
ORDER BY SUBSTR(LOWER(name), LENGTH(name) - 2, 3) , id ASC;


--Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name
FROM employee
ORDER BY name;
--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY name;

SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;

--ORACLE demands ELSE ... END be in the same line
SELECT
    CASE
        WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle'
        WHEN A = B AND B = C AND C = A THEN 'Equilateral'
        WHEN A = B OR B = C OR C = A THEN 'Isosceles'
        ELSE 'Scalene' END
FROM triangles;


--Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
--Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

--There are a total of [occupation_count] [occupation]s.
--where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

select concat(name, '(', substr(upper(occupation), 1, 1), ')')
from occupations
order by name ASC;
--oracleDB
select concat(concat(name, '('), concat(substr(upper(occupation), 1, 1), ')'))
from occupations
order by name ASC;

--You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
select concat('There are a total of ', concat(count(occupation), concat( ' ', concat(lower(occupation), 's.'))))
from occupations
group by occupation
order by count(name), occupation;
select node.n,
    (case
        when node.p is NULL then 'Root'
        when node.n in (select distinct p from bst) then 'Inner'
        else 'Leaf' end
    ) as typeNode
from bst node
order by n;

--company founder count(M)
select   cmp.company_code,
         cmp.founder,
        (select count(distinct lm.lead_manager_code)
         from lead_manager lm
         where lm.company_code = cmp.company_code) as lms,
         (select count(distinct sm.senior_manager_code)
         from senior_manager sm
         where sm.company_code = cmp.company_code),
         (select count(distinct sm.manager_code)
         from manager sm
         where sm.company_code = cmp.company_code),
         (select count(distinct sm.employee_code)
         from employee sm
         where sm.company_code = cmp.company_code)
from company cmp
order by company_code;

--select sum(cities) where conttinent = 'ASIA'

-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
select round((t1.val + t2.val) / 2, 4)
from (
    select lat_n as val1, round((count_table.val/2), 0) as round_val
    from station,
        (
            select count(*) as val
            from station
        ) as count_table
    order by lat_n asc
    limit round_val, 1
) as t1,
(
    select lat_n as val, round((count_table.val + 1) / 2, 0) as round_val
    from station,
        (
            select count(*) as val
            from station
        ) as count_table
    order by lat_n asc
    limit round_val, 1
) as t2;
