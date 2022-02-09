-- List of all employees of retirement age and their titles
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date >= '1/1/1952' and e.birth_date <= '12/31/1955'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
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




--INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;
