select first_name || '(' || department_id || ')' "Name & Department Id" from employees;
select last_name || ' is a ' || job_id "Employee Details" from employees;
select distinct department_id from employees;
select distinct job_id from employees;
desc employees;
desc departments;
select employee_id "Emp #",
first_name "Employee",
job_id "Job", hire_date "Hire Date"
from employees;
select first_name || ', ' || job_id
"Employee and Title"
from employees;
select employee_id, last_name, job_id, department_id
from employees
-- where department_id = 90;
where department_id <= 40;
select employee_id, last_name, job_id, department_id, hire_date
from employees
where hire_date >= '01-Jan-2005';
select employee_id, last_name, job_id, department_id, hire_date
from employees
where last_name = 'King';
select *
from jobs
where job_id = 'AD_PRES';
select last_name, salary
from employees
where salary <= 3000;
select last_name, salary
from employees
-- where salary >= 2500 and salary <= 3500;
where salary between 2500 and 3500;
-- 
-- where salary between 3500 and 2500;
select last_name from employees
where last_name between 'King' and 'Smith';
select employee_id, last_name, salary, manager_id
from employees
-- where manager_id = 100 or manager_id = 101 or manager_id = 201
where manager_id in (100, 101, 201);
select employee_id, manager_id, department_id
from employees
where last_name in ('Hartstein', 'Vargas');
select first_name
from employees
where first_name like 'S%';
select first_name, hire_date
from employees
-- where hire_date between '01-Jan-2005' and '31-Dec-2005';
where hire_date like '%-2005';
select first_name
from employees
where first_name like '_o%';
select employee_id, last_name, job_id
from employees
where job_id like '%SA\_%' escape '\';
-- % => 任意の0文字以上
-- _ => 任意の1文字
select last_name, manager_id
from employees
where manager_id is null;
-- データが入っていない => is null
-- データが入っている => is not null
select last_name, job_id, commission_pct
from employee_id
--where commission_pct is null;
where commission_pct is not null;
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 
and job_id like '%MAN%';
select last_name, job_id
from employees
where job_id in ('IT_PROG', 'ST_CLERK', 'SA_REP');
select last_name, job_id, salary
from employees
where (job_id = 'SA_REP'
or job_id = 'AD_PRES')
and salary >= 15000;
select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;
-- なし(asc) => 昇順、値の小さい方から、A->Z、日付は古い順、あ -> ん
-- desc => 降順、値の大きい方から、Z->A、日付は新しい順、ん -> あ
select last_name, salary "給料"
from employees
order by 給料 desc;
select last_name, department_id, salary * 12
from employees
where job_id = '&job_title';
select first_name, salary
from employees
where salary >= 12000;
select last_name, department_id
from employees
where employee_id = 176;
select last_name, salary
from employees
-- where salary < 5000 or salary > 12000;
-- 5000以上12000以下の否定 => 5000より少ないまたは12000より多い
where salary not between 5000 and 12000;
select last_name, job_id, hire_date
from employees
where last_name in ('Matos', 'Taylor')
order by hire_date;
select last_name, department_id
from employees
where department_id in (20, 50)
order by last_name;
select last_name "Employee", salary "Monthly Salary"
from employees
where salary between 5000 and 12000
and department_id in (20, 50);
select last_name, hire_date
from employees
--where hire_date like '%-2005';
where hire_date between '01-Jan-2005' and '31-Dec-2005';

--select lower('aAABCd')
--select upper('aAABCd')
--select initcap('aAABCd')
--select concat('aaa', 'bbb')
--select substr('123456789', 2, 5)
--select substr('123456789', 5)
--select substr('123456789', -3)
--select length('123456789')
select instr('123456789567', '567',6 ,1)
from dual;
select 
rpad(last_name, 10, '-'),
lpad(salary, 8, '*')
from employees
order by salary desc
fetch first 5 rows only;
-- select trim(')' from trim('(' from '(yamauchi)'))
select trim('"' from '"yamauchi"')
from dual;
select replace('123456789567', '567', 'ABC')
from dual;
select round(45.926, 2)
, round(45.926, 0)
, round(45.926, -1)
from dual;
select trunc(45.926, 2)
, trunc(45.926, 0)
, trunc(45.926, -1)
from dual;
select mod(1000, 300)
from dual;
select last_name, hire_date
from employees
where hire_date <= '31-Dec-2002';
select to_char(sysdate, 'YY/MM/DD HH24:MI:SS'),
sysdate + 2,
sysdate - 3,
to_char(sysdate + 3 / 24, 'YY/MM/DD HH24:MI:SS')
from dual;
select round(sysdate - to_date('01-Oct-2019', 'DD-Mon-YYYY'))
from dual;
select last_name,
round((sysdate - hire_date) / 7)
from employees
where department_id = 90;
select last_name,
round(months_between(sysdate, hire_date))
from employees
where department_id = 90;
select add_months(sysdate, 2)
from dual;
select next_day(sysdate, 'sun')
from dual;
select last_day(sysdate)
from dual;
select last_day(to_date('2020-02-01', 'YYYY-MM-DD'))
from dual;
select last_day('01-Feb-2020')
from dual;
select round(to_date('2019-10-14', 'YYYY-MM-DD'),'month'),
round(to_date('2019-10-16', 'YYYY-MM-DD'), 'month'),
-- 15日までは切捨て
-- 16日以降は切り上げ
round(to_date('2019-06-30', 'YYYY-MM-DD'), 'year'),
round(to_date('2019-07-01', 'YYYY-MM-DD'), 'year')
-- 6/30までは切捨て
-- 7/1以降は切り上げ
from dual;
select trunc(sysdate, 'month'),
trunc(sysdate, 'year')
from dual;
select sysdate "Date"
from dual;
select employee_id, last_name,
salary, trunc(salary*1.155),
trunc(salary*1.155) - salary "Increase"
--salary, trunc(salary*115.5%)
from employees
select last_name "Name",
length(last_name) "Length"
from employees
where substr(last_name, 1, 1) in ('J', 'A', 'M');
select last_name, 
round(months_between(sysdate, hire_date)) MONTHS_WORKED
from employees
--order by hire_date desc;
order by MONTHS_WORKED;
select last_name, salary
from employees
--where salary > '10000';
--where salary > '10,000';
where salary > to_number('10,000', '99,999');
select last_name, hire_date
from employees
--where hire_date >= '01-Jan-2000'
--where hire_date >= '2000-01-01'
where hire_date >= 
--to_date('2000-01-01', 'YYYY-MM-DD')
to_date('10-Jan-00', 'DD-Mon-YY')
select employee_id, 
--to_char(hire_date, 'MM/YY')
--to_char(hire_date, 'ddspth "of" Month')
--to_char(hire_date, 'YYYY-MM-DD HH:MI:SS')
to_char(hire_date, 
'fmDdspth(Day) "of" Month YYYY fmHH:MI:SS AM')
from employees;
select last_name, 
to_char(salary, '$999,999.00')
from employees
select to_char(-1000, '$999,999PR')
from dual
select last_name, 
upper(concat(substr(last_name, 1, 8) , '_US'))
from employees
select last_name, 
nvl(commission_pct,0)
from employees
select last_name,
--salary + salary*nvl(commission_pct,0) 
--nvl2(
--  commission_pct,
--  salary + salary*commission_pct,
--  salary) 
coalesce(
  salary + salary*commission_pct,
  salary,
  0) 
from employees
select 
first_name, length(first_name) e1,
last_name, 
nullif(length(first_name), 5)
from employees
select last_name, job_id, salary,
  case job_id
    when 'IT_PROG' then 1.10*salary
    when 'ST_CLERK' then 1.15*salary
    when 'SA_REP' then 1.20*salary
    else salary end "REVISED_SALARY"
from employees
select last_name, salary,
  case
    when salary < 5000 then 'Low'
    when salary < 10000 then 'Medium'
    when salary < 20000 then 'Good'
    else 'Excellent'
  end quollified_salay
from employees
select last_name, job_id, salary,
  decode( job_id
    , 'IT_PROG' , 1.10*salary
    , 'ST_CLERK' , 1.15*salary
    , 'SA_REP' , 1.20*salary
    , salary)  "EVISED_SALARY"
from employees
select last_name, salary,
  decode( trunc(salary/2000, 0),
    0, 0.00,
    1, 0.09,
    2, 0.20,
    3, 0.30,
    4, 0.40,
    5, 0.42,
    6, 0.44,
    0.45) TAX_RATE
from employees
select round(avg(salary)), 
max(salary),
min(salary), sum(salary)
from employees
where job_id like '%REP%'
select min(hire_date), max(hire_date)
from employees
select last_name, hire_date
from employees
where hire_date = 
(select max(hire_date) from employees)
select min(last_name), max(last_name)
from employees
select count(distinct department_id)
from employees
--where department_id = 50
--select avg(commission_pct)
select avg(coalesce(commission_pct,0))
from employees
select department_id, avg(salary),
min(salary), max(salary)
from employees
group by department_id
order by department_id
select avg(salary)
from employees
group by department_id
order by department_id
select department_id, job_id, 
avg(salary),
min(salary), max(salary), count(*)
from employees
--group by department_id, job_id
group by job_id, department_id
order by department_id
select department_id, avg(salary)
from employees
group by department_id
having avg(salary) < 5000
select department_id, max(salary)
from employees
group by department_id
having max(salary) > 10000
select job_id, sum(salary)
from employees
where job_id like '%REP%'
group by job_id
having sum(salary) > 13000
order by sum(salary)

select department_id, department_name,
location_id, city
from departments
natural join locations
where department_id in (20, 50)

select employee_id, last_name,
location_id, department_id, 
department_name
from employees
join departments
using (department_id)

select l.city, d.department_name
from locations l
join departments d
using (location_id)
where location_id = 1400

select e.employee_id, e.last_name,
d.location_id, d.department_id,
d.department_name
from employees e
join departments d
on e.department_id = d.department_id

select d.department_id,
d.department_name, e.last_name
from departments d
join employees e
on d.manager_id = e.employee_id
order by d.department_id

select employee_id, city,
department_name
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id

select e.employee_id, e.last_name,
e.department_id, d.department_id,
d.location_id
from employees e
join departments d
on e.department_id = d.department_id
-- and e.manager_id = 149
where e.manager_id = 149

select worker.last_name emp,
manager.last_name mgr
from employees worker
left outer join employees manager
on worker.manager_id = manager.employee_id

create table job_grades (
  grade_level varchar2(1),
  lowest_sal number,
  highest_sal number
)
insert into job_grades
values('A', 1000, 2999);
insert into job_grades
values('B', 3000, 5999);
insert into job_grades
values('C', 6000, 9999);
insert into job_grades
values('D', 10000, 14999);
insert into job_grades
values('E', 15000, 24999);
insert into job_grades
values('F', 25000, 40000);

select * from job_grades
order by grade_level;

select e.last_name, e.salary,
j.grade_level
from employees e
join job_grades j
-- on e.salary 
-- between j.lowest_sal and j.highest_sal
on e.salary >= j.lowest_sal
and e.salary <= j.highest_sal

select * from employees
where department_id is null

select employee_id, last_name,
e.department_id, department_name
from employees e
join departments d
--on e.department_id = d.department_id

select last_name, department_name
from employees
cross join departments

select location_id, street_address,
city, state_province, country_name
from locations
natural join countries

select location_id, street_address,
city, state_province, country_name
from locations l
join countries c
on l.country_id = c.country_id

select last_name, job_id, 
department_id, department_name
from departments
natural join locations
join employees
using (department_id)
where city = 'Toronto'

select e.last_name, e.hire_date
from employees e
join employees de
on e.hiredate >= 

select e.last_name, e.hire_date
from employees e join employees davies
on davies.last_name = 'Davies'
where davies.hire_date < e.hire_date

select salary from employees
where last_name = 'Abel'
-- 11000
-- 単一行副問合せ
select last_name, salary
from employees
where salary > (
select salary from employees
where last_name = 'Abel'
)
select last_name, salary
from employees
where salary = (
select min(salary) from employees
)
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (
  select min(salary)
  from employees
 where department_id = 50
 )
order by department_id

select job_id, avg(salary)
from employees
group by job_id
having avg(salary) = (
  select min(avg(salary))
  from employees
  group by job_id
)
-- 複数行副問合せ
select job_id, avg(salary)
from employees
group by job_id
-- having avg(salary) in (
-- having avg(salary) =any (
having avg(salary) <=all (
  select avg(salary)
  from employees
  group by job_id
)

select department_id, last_name, salary
from employees
-- where salary =any (
where salary in (
  select min(salary)
  from employees
  group by department_id
)
order by department_id

select employee_id, last_name,
job_id, salary
from employees
where salary <all (
  select salary
  from employees
  where job_id = 'IT_PROG'
)
-- where salary < (
--   -- select max(salary)
--   select min(salary)
--   from employees
--   where job_id = 'IT_PROG'
-- )

-- 部下がいない人のlast_name
select emp.last_name
from employees emp
where emp.employee_id not in (
  select mgr.manager_id
  from employees mgr
  where manager_id is not null
)

select employee_id, last_name,
salary
from employees
where salary > (
  select avg(salary)
  from employees
)
order by salary

select employee_id, last_name
from employees
where department_id =any (
  select department_id
  from employees
  where last_name like '%u%'
)

select last_name, department_id,
job_id
from employees
where department_id in (
  select department_id
  from departments
  where location_id = 1700
)

select * from job_history
order by employee_id, start_date

select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history
--order by employee_id

select employee_id
from employees
minus
select employee_id
from job_history

select distinct employee_id
from job_history

select location_id, department_name "Departments", 
to_char(null) "Warehouse location"
from departments
union
select location_id, to_char(null) "Departments",
state_province
from locations

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history

select department_id
from employees
minus
select department_id
from employees
where job_id = 'ST_CLERK'

select country_id, country_name
from countries
minus
select country_id, country_name
from countries
natural join locations
natural join departments

select distinct country_id, country_name
from countries
natural join locations
natural join departments

select job_id, department_id
from employees
where department_id = 10
union all
select job_id, department_id
from employees
where department_id = 50
union all
select job_id, department_id
from employees
where department_id = 20

alter session set nls_date_language = 'AMERICAN';
alter session set nls_date_language = 'JAPANESE';
alter session set nls_date_format = 'DD-MON-RR';
alter session set nls_date_format = 'RR-MM-DD';
select constraint_name, constraint_type,
column_name, search_condition, r_constraint_name
from user_constraints
natural join user_cons_columns
where table_name = upper('&table_name');
select index_name, index_type,
column_name
from user_indexes
natural join user_ind_columns
where table_name = upper('&table_name');