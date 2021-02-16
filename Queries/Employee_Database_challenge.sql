
-- DELIVERABLE 1: The Number of Retiring Employees by Title

-- Step 1 to 7
-- A query is written and executed to create a Retirement Titles table for 
-- employees who are born between January 1, 1952 and December 31, 1955
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
JOIN dept_emp AS de 
ON e.emp_no = de.emp_no  
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Step 8 to 14
-- ​A query is written and executed to create a Unique Titles table that 
-- contains the employee number, first and last name, and most recent title.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

-- Step 11 to 14
-- A query is written and executed to create a Retiring Titles table that 
-- contains the number of titles filled by employees who are retiring.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;


-- Deliverable 2: The Employees Eligible for the Mentorship Program
-- write a query to create a Mentorship Eligibility table that holds 
-- the employees who are eligible to participate in a mentorship program.

SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_emp as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as ti
ON (e.emp_no = ti.emp_no)
--	INNER JOIN dept_emp as de
--		on(e.emp_no = de.emp_no)
--	INNER JOIN titles as ti
--		on(de.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC, ti.to_date DESC;


SELECT * FROM mentorship_eligibilty;
