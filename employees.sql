-- 1- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT 	e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no= s.emp_no;

-- 2- List employees who were hired in 1986.

SELECT first_name, last_name 
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- 3- List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates

SELECT DISTINCT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, s.from_date, s.to_date
FROM dept_manager AS m
LEFT JOIN department AS d
ON d.dept_no= m.dept_no
LEFT JOIN employees AS e
ON e.emp_no= m.emp_no
LEFT JOIN salaries AS s
ON e.emp_no= s.emp_no;

--4- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp 
ON e.emp_no= dept_emp.emp_no
LEFT JOIN department AS d
ON dept_emp.dept_no= d.dept_no
ORDER BY e.emp_no;

--5-List all employees whose first name is "Hercules" and last names begin with "B."

SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name= 'Hercules' 
And last_name like 'B%';

--6- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 	e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS m
ON e.emp_no= m.emp_no
LEFT JOIN department AS d
ON M.dept_no= d.dept_no
WHERE d.dept_name= 'Sales'
ORDER BY e.emp_no;

--7-List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 	e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS m
ON e.emp_no= m.emp_no
LEFT JOIN department AS d
ON M.dept_no= d.dept_no
WHERE d.dept_name= 'Sales' 
OR d.dept_name= 'Development'
ORDER BY e.emp_no;

--8-In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(*), last_name
FROM employees
GROUP BY LAST_NAME
ORDER BY COUNT(*) DESC;

