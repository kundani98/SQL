---------chapter2:Beginning data exploration with select--- 

--Querying all rows and columns from the teachers table

SELECT * FROM teachers; ABORT

--Querying a subset of columns 

SELECT last_name, first_name, salary FROM teachers;

--Querying distinct values in the school column 

SELECT DISTINCT school 
FROM teachers;

--Querying distinct pairs of values in the school and salary

SELECT DISTINCT school, salary
FROM teachers;  

--Sorting a column with ORDER BY 

SELECT first_name, last_name, salary 
FROM teachers 
ORDER BY salary DESC;



--Sorting multiple columns with ORDER BY 
SELECT last_name,school,hire_date
FROM teachers 
ORDER BY school ASC, hire_date DESC;

--Filtering rows using WHERE
SELECT last_name, school, hire_date
FROM teachers 
WHERE school ='Myers Middle School';

-- Examples of WHERE comparison operators 

-- Teachers with first name of Janet
SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

-- School names not equal to F.D. Roosevelt HS
SELECT school
FROM teachers
WHERE school != 'F.D. Roosevelt HS';

-- Teachers hired before Jan. 1, 2000
SELECT first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2000-01-01';

-- Teachers earning 43,500 or more
SELECT first_name, last_name, salary
FROM teachers
WHERE salary >= 43500;

-- Teachers who earn between $40,000 and $65,000
SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;

--Filtering with LIKE AND ILIKE 

SELECT first_name
FROM teachers
WHERE first_name LIKE 'sam%';

SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%';

 --Combining operators using AND and OR

SELECT *
FROM teachers
WHERE school = 'Myers Middle School'
      AND salary < 40000;

SELECT *
FROM teachers
WHERE last_name = 'Cole'
      OR last_name = 'Bush';

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
      AND (salary < 38000 OR salary > 40000);

--A SELECT statement including WHERE and ORDER BY

SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;

--Try it yourself 1--
SELECT last_name, first_name, school 
FROM teachers 
ORDER BY school ASC, last_name ASC;

--Try it yourself 2 
SELECT first_name,last_name,school,salary
FROM teachers 
WHERE first_name LIKE 'S%' 
AND		salary>40000;

--Try it yourself 3
SELECT last_name, first_name, school, hire_date, salary
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;







