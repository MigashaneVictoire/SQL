-- SQL Group by
show databases;
use employees;
show tables;
-- In your script, use DISTINCT to find the unique titles in the employees table. How many unique titles have there ever been?
SELECT distinct(gender)
FROM employees;

SELECT gender
FROM employees
GROUP BY gender;
-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
SELECT distinct(last_name)
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name LIKE '%E';
    
SELECT last_name
FROM employees
GROUP BY last_name
HAVING last_name LIKE 'E%'
	AND last_name LIKE '%E';
-- Write a query to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT distinct first_name, last_name
FROM employees
WHERE first_name LIKE 'E%' AND first_name LIKE '%E'
	AND last_name LIKE 'E%' AND last_name LIKE '%E';
    
SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING first_name LIKE 'E%' AND first_name LIKE '%E'
	AND last_name LIKE 'E%' AND last_name LIKE '%E';
-- Write a query to find the unique last names with a 'q' but not 'qu'.


-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.

-- Using your query that generates a username for all employees, generate a count of employees with each unique username.

-- From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?

-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.

-- Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.

-- Determine how many different salaries each employee has had. This includes both historic and current.

-- Find the maximum salary for each employee.

-- Find the minimum salary for each employee.

-- Find the standard deviation of salaries for each employee.

-- Find the max salary for each employee where that max salary is greater than $150,000.

-- Find the average salary for each employee where that average salary is between $80k and $90k.

