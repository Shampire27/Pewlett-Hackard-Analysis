
-- DELIVERABLE 1: The Number of Retiring Employees by Title

-- Step 1 to 7
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
JOIN dept_emp as de ON e.emp_no = de.emp_no  
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

SELECT * FROM retirement_titles;

-- Step 8 to 14
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

-- Step 11 to 14
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

