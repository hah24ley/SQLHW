CREATE TABLE departments ( 
	dept_no VARCHAR PRIMARY KEY, 
	dept_name VARCHAR (30)
);

CREATE TABLE employees ( 
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	gender VARCHAR (1), 
	hire_date date
);

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR (30),
	from_date DATE,
	to_date DATE
); 

CREATE TABLE dept_manager (
	dept_no VARCHAR (20), 
	emp_no INT,
	from_date DATE, 
	to_date DATE
);

CREATE TABLE salaries (
	emp_no INT, 
	salary INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR (30),
	from_date DATE,
	to_date DATE 
);

-- QUESTION 1. 
------(Employees.csv | salaries.csv) 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY s.salary ASC;

--QUESTION 2. 
-------(employees.csv) 
SELECT *
FROM employees 
WHERE hire_date between '1986-01-01' and '1986-12-31'
ORDER BY hire_date;

--QUESTION 3. 
------(dept_manager.csv | departments.csv | employees.csv | Salaries.csv)
SELECT ma.dept_no,
    ma.emp_no,
	d.dept_name,
    e.last_name,
    e.first_name,
    s.from_date,
    s.to_date
FROM dept_manager ma
INNER JOIN departments d ON ma.dept_no = d.dept_no
INNER JOIN employees e ON ma.emp_no = e.emp_no
INNER JOIN salaries s ON ma.emp_no = s.emp_no
ORDER BY dept_no;

--QUESTION 4. 
------(employees.csv | dept_emp.csv | departments.csv) 
SELECT em.emp_no,
	d.dept_no,
	d.dept_name, 
    e.last_name,
    e.first_name
FROM dept_emp em
INNER JOIN employees e ON em.emp_no = e.emp_no
INNER JOIN departments d ON em.dept_no = d.dept_no
ORDER BY emp_no;

--QUESTION 5. 
------(employees.csv)
SELECT *
FROM employees 
WHERE first_name = 'Hercules' AND 
	last_name LIKE 'B%';
	
--QUESTION 6. 
------(dept_emp.csv | employees.csv | departments.csv) 
SELECT em.emp_no, 
	e.first_name,
	e.last_name,
	d.dept_name
FROM dept_emp em
INNER JOIN departments d ON em.dept_no = d.dept_no
INNER JOIN employees e ON em.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--QUESTION 7. 
------(department.csv | dept_emp.csv | employees.csv)
SELECT em.emp_no, 
	e.first_name,
	e.last_name,
	d.dept_name
FROM dept_emp em
INNER JOIN departments d ON em.dept_no = d.dept_no
INNER JOIN employees e ON em.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR 
	d.dept_name = 'Development';
	
--QUESTION 8. 
------(employees.csv)
SELECT last_name, 
	COUNT(last_name) AS last_name_count
FROM employees 
GROUP BY last_name
ORDER BY last_name_count DESC;


