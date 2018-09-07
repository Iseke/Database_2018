CREATE DATABASE lab1;
 CREATE TABLE users(
   id SERIAL,
   firstname varchar(50) ,
   lastname VARCHAR(50)

 );
SELECT * FROM users;
 ALTER table users
     add column isadmin int;

alter table users
    alter column isadmin set data type boolean USING isadmin::boolean;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users
  ADD  CONSTRAINT Doren primary key (id);

CREATE table tasks (
  id SERIAL,
  name VARCHAR(50),
  users_id int
)
  SELECT * FROM tasks;
Drop table tasks;
Drop DATABASE lab1;
