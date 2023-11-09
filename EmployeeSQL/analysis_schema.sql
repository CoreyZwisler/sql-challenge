-- List employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
	JOIN salaries AS sal
	ON emp.emp_no = sal.emp_no;
		
-- List first name, last name, hire date for employees hired in 1986
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
	WHERE EXTRACT(YEAR FROM emp.hire_date) = 1986;
	
-- List manager of each dept. with dept. number, dept. name, emp. number, last name, and first name
SELECT dm.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS dm
	JOIN employees AS emp
	ON emp.emp_no = dm.emp_no
		JOIN departments AS dept
		ON dm.dept_no = dept.dept_no;
				
-- List dept. number for each employee with emp. number, last name, first name, and dept. name
SELECT dept.dept_no, emp.emp_no, emp.last_name, emp.first_name,  dept.dept_name
FROM departments AS dept
	JOIN dept_emp AS de
	ON dept.dept_no = de.dept_no
		JOIN employees AS emp
		ON emp.emp_no = de.emp_no;
				
-- List first name, last name, and sex of employees with first name Hercules and last name starts with B
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
	WHERE emp.first_name = 'Hercules'
	AND emp.last_name LIKE 'B%';
	
--List each employee in the sales dept. with emp. number, last name, and first name
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
	WHERE emp.emp_no IN
		(SELECT de.emp_no
	 	 FROM dept_emp AS de
	 	 WHERE de.dept_no = 
			 (SELECT dept.dept_no
		 	  FROM departments AS dept
		 	  WHERE dept.dept_name = 'Sales'));
					
-- List each employee in sales and development dept. with emp. number, last name, and first name
SELECT dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
	JOIN dept_emp AS de
	ON emp.emp_no = de.emp_no
		JOIN departments AS dept
		ON de.dept_no = dept.dept_no
			WHERE dept.dept_name = 'Sales'
			OR dept.dept_name = 'Development';
					
--List frequency count, in descending order, of all emp. last names
SELECT emp.last_name, COUNT(emp.last_name) AS frequency_count
FROM employees AS emp
	GROUP BY emp.last_name
	ORDER BY emp.last_name DESC;		