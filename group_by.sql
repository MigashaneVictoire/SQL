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
SELECT distinct(last_name)
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';
    
SELECT last_name
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';
-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
SELECT gender, count(first_name)
FROM (SELECT first_name, gender
		FROM employees
		WHERE first_name IN ('Irena', 'Vidya', 'Maya')) AS names
GROUP BY gender;

SELECT gender, count(first_name)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

-- Determine the historic average salary for each employee.
SELECT emp_no, avg(salary)
FROM salaries
GROUP BY emp_no;
-- Using the dept_emp table, count how many current employees work in each department.
SELECT dept_no, count(emp_no)
FROM dept_emp
GROUP BY dept_no;
-- Determine how many different salaries each employee has had. This includes both historic and current.
SELECT emp_no, count(salary)
FROM salaries
GROUP BY emp_no;
-- Find the maximum salary for each employee.
SELECT emp_no, max(salary)
FROM salaries
GROUP BY emp_no;

