select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles

--List the following details of each employee: employee number, last name, first name, sex, and salary.
select 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
from "employees" e
join "salaries" s
on e.emp_no = s.salary

--List first name, last name, and hire date for employees who were hired in 1986.
select 
	first_name, 
	last_name, 
	hire_date
from "employees"
where hire_date between '01-01-1986' and '12-31-1986'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select 
	d.dept_no, 
	d.dept_name, 
	m.emp_no, 
	e.first_name, 
	e.last_name
from "departments" d, "dept_manager" m, "employees" e
where d.dept_no = m.dept_no and m.emp_no = e.emp_no 

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select 
	en.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
from "dept_emp" en, "employees" e, "departments" d
where en.emp_no = e.emp_no and en.dept_no = d.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 
	first_name, 
	last_name, 
	sex
from employees
where first_name = 'Hercules' and last_name like '%B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 
	de.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
from "dept_emp" de, "employees" e, "departments" d
where dept_name like 'Sales'
limit 100

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
	de.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
from "dept_emp" de, "employees" e, "departments" d
where dept_name in ('Sales', 'Development')
limit 200

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count (last_name) desc