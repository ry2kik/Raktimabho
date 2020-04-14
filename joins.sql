use employees;
###################INNER JOIN OR JOIN SYNTEX####################
select distinct dm.emp_no,dm.dept_no,dd.dept_name
from dept_manager_dup dm
join departments_dup dd
on dm.dept_no = dd.dept_no
order by dm.emp_no asc;

####################WHERE (THE OLD JOIN SYNTEX)#####################
select dm.emp_no,dm.dept_no,dd.dept_name
from dept_manager_dup dm,departments_dup dd
where dm.dept_no = dd.dept_no
order by dm.emp_no asc;

select e.first_name,e.last_name,e.hire_date,dm.emp_no,dm.dept_no
from dept_manager dm,employees e
where e.emp_no = dm.emp_no
order by e.emp_no asc;
#####################################################################
insert into dept_manager_dup
values('110228','d003','1992-03-21','9999-01-01');

select * from dept_manager_dup;
select * from departments_dup;

delete from departments_dup where dept_no = 'd009';
insert into departments_dup(dept_no,dept_name) 
values('d009','Customer Service');

delete from dept_manager_dup where emp_no = '110228';

#######################LEFT JOIN#############################

select emp_no,dd.dept_no,dd.dept_name
from departments_dup dd
left join dept_manager_dup dm
on dm.dept_no = dd.dept_no
order by dept_no asc;

select e.first_name,e.last_name,e.emp_no,dm.dept_no,dm.from_date
from employees e
left join dept_manager dm
on e.emp_no = dm.emp_no
where e.last_name = 'Markovitch'
order by e.last_name desc;

select e.first_name,e.last_name,e.hire_date,t.title
from employees e
join titles t 
on t.emp_no = e.emp_no
where e.first_name  = 'Margareta' and last_name = 'Markovitch';

#####################CROSS JOIN############################
select dm.*,dd.*
from dept_manager dm
cross join departments dd
order by dm.emp_no , dd.dept_no;
###########CROSS JOIN USING OLD SYNTEX###########
select dm.*,dd.*
from dept_manager dm
inner join departments dd
order by dm.emp_no,dd.dept_no;
				###OR####
select dm.*,dd.*
from dept_manager dm,
	 departments dd
order by dm.emp_no,dd.dept_no;

select d.*,e.*
from employees as e
cross join departments as d
where e.emp_no < '10011'
order by d.dept_no,e.emp_no;

############MULTIPLE TABLES JOINING################
select e.first_name,e.last_name,e.hire_date,t.title,dm.from_date,d.dept_name
from employees as e
join titles as t on e.emp_no = t.emp_no
join dept_manager as dm on t.from_date = dm.from_date
join departments as d on dm.dept_no = d.dept_no
where t.title = 'Manager';

select e.gender,count(dm.emp_no)
from employees as e
join dept_manager as dm 
on e.emp_no = dm.emp_no
group by gender;

drop table if exists employees_dup;
create table employees_dup(
	emp_no int(11),
    birth_date date,
    first_name varchar(16),
    last_name varchar(16),
    gender enum('M','F'),
    hire_date date
);
insert into employees_dup
select * from employees limit 20;
select * from employees_dup order by emp_no asc;
insert into employees_dup 
select * from employees as e where e.emp_no = 10001;
 

    
    
    
    


