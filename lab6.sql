create TABLE  locations(
  location_id SERIAL Primary key,
  street_addres varchar(25),
  postal_code varchar(12),
  city varchar(30),
  state_province varchar(12)
);
CREATE table departments(
  department_id SERIAL PRIMARY KEY ,
  department_name varchar(50),
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);
CREATE table employees(
  employee_id SERIAL PRIMARY KEY ,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50),
  phone_number varchar(20),
  salary integer,
  manager_id INTEGER REFERENCES employees,
  department_id integer references departments
);
CREATE table job_grades(
  grade char(1),
  lowest_salary INTEGER,
  highest_salry INTEGER
);

select e.first_name, d.department_id, l.city, l.state_province from employees e inner join departments  d using (department_id) inner join locations l using(location_id) where e.last_name like '%b%';

SELECT d.department_name,l.city,l.state_province From  departments  d inner join  locations l  using (location_id);

select e.first_name ,e2.first_name from employees e full outer join employees e2 on e.employee_id = e2.manager_id;


select j.grade , avg(e.salary) from employees e inner join job_grades j on(salary between lowest_salary and highest_salry) group by grade;

select e.first_name,e.last_name from employees e join departments d using (department_id) join locations l using (location_id) where city like 'London';

-----------------------------------------------------------------------------------------

select e.first_name,e.last_name,d.department_name,l.city,l.state_province from employees e inner join departments d  using (department_id) inner join  locations l using (location_id);

select e.first_name,e.last_name,e.salary,g.grade from employees e inner join job_grades g on( salary between lowest_salary and highest_salry);

--select e.first_name,e.last_name,e.salary from employees e
select e.first_name,e2.first_name from employees e inner join employees e2 on(e.employee_id=e2.manager_id);

select e.first_name,e.last_name,d.department_id,d.department_name from employees e  left join departments d on(e.department_id=d.department_id);