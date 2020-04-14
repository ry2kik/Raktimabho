select A.* from
(select e.emp_no as employee_ID,
	min(de.dept_no) as dept_ID,
    (select emp_no from dept_manager where emp_no = 110022) as manager_ID
    from employees as e
    join dept_emp de 
    on de.emp_no = e.emp_no
    where e.emp_no <= 10020
    group by e.emp_no
    order by e.emp_no) as A
Union select B.* from
(select e.emp_no as employee_ID,
	min(de.dept_no) as dept_ID,
    (select emp_no from dept_manager where emp_no = 110039) as manager_ID
    from employees as e
    join dept_emp de 
    on de.emp_no = e.emp_no
    where e.emp_no >= 10021 and e.emp_no <= 10040
    group by e.emp_no
    order by e.emp_no
    limit 20) as B;
