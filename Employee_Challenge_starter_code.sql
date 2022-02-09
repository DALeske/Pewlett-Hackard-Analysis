-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, from_date, to_date
FROM titles
ORDER BY emp_no, from_date DESC;

--INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;
