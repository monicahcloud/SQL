SELECT * FROM department;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
INNER JOIN salaries as sal 
ON emp.emp_no = sal.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept.dept_no, dept.dept_name, dman.emp_no, emp.last_name, emp.first_name
FROM department as dept
inner join dept_manager as dman
ON dept.dept_no = dman.dept_no
INNER JOIN employees as emp 
ON dman.emp_no = emp.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT  emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM department as dept
inner join dept_emp as demp
ON demp.dept_no = dept.dept_no
INNER JOIN employees as emp 
ON demp.emp_no = emp.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name
FROM  employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT  emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM department as dept
inner join dept_emp as demp
ON demp.dept_no = dept.dept_no
INNER JOIN employees as emp 
ON demp.emp_no = emp.emp_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, depart.dept_name
FROM employees as emp
inner join dept_emp as demp
on emp.emp_no = demp.emp_no
inner join department as depart
on depart.dept_no = demp.dept_no
where depart.dept_name in ('Sales','Development')				

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT count(last_name), last_name
from employees
Group by last_name
order by count(last_name) desc


