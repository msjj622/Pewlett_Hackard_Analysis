-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM departments;
SELECT emp_no, first_name, last_name FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT title, from_date, to_date FROM titles;

-- Deliverable 1
SELECT employees.emp_no, employees.first_name, employees.last_name
,titles.title, titles.from_date, titles.to_date
INTO retirement_titles 
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no
;

SELECT * FROM retirement_titles

DROP TABLE retirement_titles

-- Deliverable 1, 8~15
SELECT emp_no, first_name, last_name, title 
FROM retirement_titles

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, 
last_name, title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC
;

DROP TABLE unique_titles

SELECT * FROM unique_titles

-- Deliverable 1, 16~21
SELECT DISTINCT ON (title) title
FROM retirement_titles

SELECT * FROM unique_titles

SELECT COUNT(*) FROM unique_titles

CREATE TABLE Retiring_titles (
	count bigint NOT NULL,
	title VARCHAR (50) NOT NULL
);

SELECT COUNT(*) AS COUNT, title 
INTO retiring_title
FROM unique_titles
GROUP BY title ORDER BY count DESC;

SELECT * FROM retiring_title 

DROP TABLE retiring_title

-- Deliverable 2

SELECT employees.emp_no, employees.first_name, employees.last_name
, employees.birth_date, dept_emp.from_date
,dept_emp.to_date, titles.title
INTO mentorship_eligibilty
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
;

SELECT * FROM mentorship_eligibilty

SELECT * FROM mentorship_eligibilty LIMIT 10;

DROP TABLE mentorship_eligibilty

SELECT DISTINCT ON (emp_no) emp_no, first_name,
last_name, birth_date, from_date, to_date, title
FROM mentorship_eligibilty
WHERE to_date = '9999-01-01' AND birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no
;
