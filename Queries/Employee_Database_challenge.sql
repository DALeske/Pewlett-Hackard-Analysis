-- List of all employees of retirement age and their titles
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date >= '1/1/1952' and e.birth_date <= '12/31/1955'
ORDER BY emp_no;

-- Use Distinct with Orderby to remove duplicate rows
-- BRINGING IN ALL retirement age employees, removing those who have left, and saving most recent title
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, from_date DESC;

-- CREATE COUNT OF RETIRING TITLES
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--MENTORSHIP PROGRAM
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01' AND e.birth_date >= '1/1/1965' AND e.birth_date <= '12/31/1965'
ORDER by emp_no ASC, t.from_date DESC;


--ADDITIONAL QUERIES
--Total employees retiring
SELECT COUNT(emp_no) as number_emp
FROM unique_titles;

-- Number of potential mentors by title
Select count(emp_no) as number_mentors, title
FROM mentorship_eligibility
GROUP BY title
ORDER BY number_mentors DESC;

-- Number of potential mentors by title and Gender
Select count(me.emp_no) as number_mentors, me.title,e.gender
FROM mentorship_eligibility as me
INNER JOIN employees as e
ON me.emp_no = e.emp_no
GROUP BY me.title, e.gender 
ORDER BY me.title ASC, e.gender DESC;
