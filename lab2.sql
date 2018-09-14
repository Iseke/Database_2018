CREATE DATABASE lab2;
CREATE table Countries(
  country_id SERIAL PRIMARY KEY ,
  country_name VARCHAR(50),
  region_id integer,
  population integer
)
  INSERT INTO Countries(country_id,country_name,region_id,population)
   VALUES (DEFAULT ,'USA',13,10000),
          (DEFAULT ,'Russia',14,120000),
          (DEFAULT ,'Kazakhstan',17,1000000);
SELECT * FROM Countries;
DROP table Countries;

INSERT INTO Countries(country_id,country_name)
values (DEFAULT ,'Uzbekistan')

SELECT * FROM Countries;

INSERT INTO Countries(region_id)
VALUES (null );

INSERT INTO Countries(country_id,country_name,region_id,population)
   VALUES (DEFAULT ,'United Kingdom',23,112300),
          (DEFAULT ,'Spain',33,125000),
          (DEFAULT ,'Italy',2,100500);
ALTER TABLE Countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO Countries(country_name)
values (default );

INSERT INTO Countries
VALUES (default );

CREATE TABLE countries_new (LIKE Countries);

SELECT *FROM countries_new;

INSERT INTO countries_new SELECT *FROM Countries RETURNING * ;

UPDATE countries_new SET region_id=1 WHERE region_id is null ;

UPDATE Countries SET population=population*1.1 RETURNING country_name,population AS "New Population";

DELETE FROM Countries WHERE population<100000;

DELETE FROM countries_new AS SN  USING countries AS S WHERE SN.country_id = s.country_id RETURNING *;

DELETE FROM Countries RETURNING *;