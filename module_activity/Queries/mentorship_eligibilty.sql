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

