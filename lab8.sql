CREATE TABLE salesman(
  salesman_id int PRIMARY KEY ,
  name varchar(250),
  city varchar(250),
  commission numeric
);
create table customer (
  customer_id int PRIMARY KEY ,
  cust_name varchar(250),
  city varchar(250),
  grade int ,
  salesman_id int REFERENCES salesman
);
create table orders(
  ord_no integer,
  purch_amt numeric,
  ord_date date,
  customer_id integer REFERENCES customer,
  salesman_id integer REFERENCES salesman
);
-----------------lab8.2-----------------------------
CREATE role junior_dev1 login password  'class';

CREATE or replace view avg_tot_orders AS select s.name as sal_name , avg(ord_no), count(ord_no) FROM salesman s inner join orders o using(salesman_id) group by s.name;

select * from avg_tot_orders;

CREATE VIEW numb_orders AS select city,count(c.customer_id) FROM customer c group by city;
select *FROM numb_orders;
grant all privileges on numb_orders to junior_dev1;

CREATE VIEW show_low_grade  AS SELECT * FROM customer order by grade  asc  nulls last limit 1 ;
GRANT SELECT on show_low_grade to junior_dev1;

CREATE VIEW num_sals As SELECT c.grade ,count(salesman_id) FROM customer c join salesman s2  using (salesman_id) group by grade ;

CREATE or replace VIEW more_once AS SELECT * FROM salesman where salesman_id in(SELECT salesman_id From orders group by salesman_id having count(ord_no)>1);


------------------------------------------------------------------------
-----------------lab8---------------

CREATE ROLE jun_dev login password 'cisco';

CREATE VIEW belongs_city_NY as select * from salesman where city='New york';

CREATE VIEW show_cus_sal AS select s.name , c.cust_name  from salesman s join customer c using (salesman_id);
grant all privileges on show_cus_sal to jun_dev;

Create VIEW high_grade As SELECT * FROM customer order by grade desc  nulls last limit 1 offset 0;
GRANT SELECT on high_grade to jun_dev;
CREATE VIEW num_sal As SELECT city,count(salesman_id) from salesman group by city;

create view more_one AS SELECT s.name,count(*) FROM salesman s join customer c using (salesman_id) group by salesman_id having count(8)>1;

CREATE ROLE Inter ;
reassign owned by jun_dev to Inter;