CREATE INDEX name_ofcountries_like_string  on countries (countries);

CREATE INDEX name_surname_of_coutries on countries (name,surname);

CREATE INDEX salary_employee  On employees (salary);


CREATE INDEX substr_empkoyee On employees (substring(name from 1 for 4));


CREATE Index dep_budget On departments (department_id,budget);

CREATE INDEX  epml_salary On employees(department_id,salary);