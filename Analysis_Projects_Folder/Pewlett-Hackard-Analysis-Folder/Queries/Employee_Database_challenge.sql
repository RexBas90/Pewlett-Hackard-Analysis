SELECT em.emp_no, 
	em.first_name, 
	em.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees AS em
INNER JOIN titles AS tt
ON em.emp_no = tt.emp_no
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY em.emp_no


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT COUNT(uq.*), uq.title
INTO retiring_titles
FROM unique_titles as uq
GROUP BY uq.title
ORDER BY count(uq.*) DESC;

SELECT DISTINCT ON(em.emp_no) em.emp_no, 
	em.first_name, 
	em.last_name,
	em.birth_date,
	dm.from_date,
	dm.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees AS em
INNER JOIN dept_manager AS dm
	ON em.emp_no = dm.emp_no
INNER JOIN titles AS tt
	ON em.emp_no = tt.emp_no
WHERE em.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND
	dm.to_date = '9999-01-01'
ORDER BY em.emp_no;