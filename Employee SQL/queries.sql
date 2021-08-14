--list details from employee database and join them in one table
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from salaries
inner join employees on
employees.emp_no=salaries.emp_no;

--list details of employess hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date like '%1986';

--list manager of departments, dept_no, dept_name, emp_no, last_name, first_name
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager as dm
inner join departments as d
on (dm.dept_no = d.dept_no)
inner join employees as e
on (dm.emp_no = e.emp_no)

--list manager of departments, dept_no, dept_name, emp_no, last_name, first_name (alternate solution to the previous question, using subquery)
select dm.dept_no, dm.emp_no
, (SELECT d.dept_name FROM departments d WHERE dm.dept_no = d.dept_no LIMIT 1)
, (SELECT e.last_name FROM employees e WHERE dm.emp_no = e.emp_no LIMIT 1)
, (SELECT e.first_name FROM employees e WHERE dm.emp_no = e.emp_no LIMIT 1)
from dept_manager as dm

--list department of employee with emp_no, name, dept_name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
inner join departments as d
on (de.dept_no = d.dept_no)
inner join employees as e
on (de.emp_no = e.emp_no)

--list name and sex of employees where first name is Hercules and last name begin with B
select last_name, first_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--list employees in sales with their emp_no, name, dept_name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
inner join departments as d
on (de.dept_no = d.dept_no)
inner join employees as e
on (de.emp_no = e.emp_no)
where d.dept_name = 'Sales'

--list employees in sales and development with their emp_no, name, dept_name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
inner join departments as d
on (de.dept_no = d.dept_no)
inner join employees as e
on (de.emp_no = e.emp_no)
where (d.dept_name = 'Sales') or (d.dept_name = 'Development')

--list frequency count of employee names (no of shared surnames) in descending order
select last_name, count(last_name) as "Count of Names"
from employees
group by last_name
order by "Count of Names" desc
