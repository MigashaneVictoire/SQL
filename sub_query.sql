-- Sub-queries 
show databases;
use employees;
show tables;
-- Find all the employees with the same hire date as employee 101010 using a subquery.
SELECT *
FROM employees
WHERE hire_date=(SELECT hire_date
				FROM employees
				WHERE emp_no=101010);
-- Find all the titles ever held by all current employees with the first name Aamod.
SELECT T.title
FROM employees as E
JOIN salaries as S USING(emp_no)
JOIN titles as T USING(emp_no)
WHERE first_name= "Aamod" AND S.to_date > now()
GROUP BY title;

SELECT T.title
FROM titles AS T
WHERE T.emp_no IN (
    SELECT E.emp_no
    FROM employees AS E
    JOIN salaries AS S USING (emp_no)
    WHERE E.first_name = "Aamod" AND S.to_date > NOW())
GROUP BY T.title;

-- Find all the current department managers that are female.
SELECT count(gender)
FROM employees
WHERE emp_no IN (SELECT emp_no
				FROM dept_manager as DM
				JOIN salaries AS S USING(emp_no)
				WHERE S.to_date > now())
			AND gender= 'F';
-- Find all the employees who currently have a higher salary than the companie's overall, historical average salary.
SELECT *
FROM salaries
WHERE salary > (SELECT avg(salary)
				FROM salaries)
			AND to_date > now();
-- How many current salaries are within 1 standard deviation of the current highest salary? 
SELECT *
FROM salaries
WHERE salary > (SELECT max(salary) FROM salaries) - (SELECT std(salary) FROM salaries);
-- Find all the department names that currently have female managers.
SELECT M.dept_name
FROM employees
JOIN (SELECT *
	FROM departments as D
	JOIN dept_manager as DM USING(dept_no)) as M USING(emp_no)
WHERE gender= 'F'
GROUP BY M.dept_name;
-- Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
JOIN salaries as S USING(emp_no)
WHERE S.salary=(SELECT max(salary)
				FROM salaries);