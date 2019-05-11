CREATE TABLE department
(
    dept_no varchar NOT NULL,
    dept_name varchar,
    CONSTRAINT pk_dept PRIMARY KEY (dept_no)
);
	
CREATE TABLE dept_emp
(
    dept_no varchar NOT NULL,
    emp_no integer NOT NULL,
    from_date date,
    to_date date,
    CONSTRAINT pk_dept_emp PRIMARY KEY (dept_no, emp_no)
);

ALTER TABLE dept_emp
    ADD CONSTRAINT fk_dept_emp_dept FOREIGN KEY (dept_no)
    REFERENCES department (dept_no);
	

ALTER TABLE dept_emp
    ADD CONSTRAINT fk_dept_emp_emp FOREIGN KEY (emp_no)
    REFERENCES employees (emp_no);
	
CREATE TABLE dept_manager
(
    dept_no varchar NOT NULL,
    emp_no integer NOT NULL,
    from_date date,
    to_date date,
    CONSTRAINT pk_dept_mng PRIMARY KEY (emp_no)
);

ALTER TABLE dept_manager
    ADD CONSTRAINT fk_dept_emp FOREIGN KEY (emp_no)
    REFERENCES employees (emp_no);
	
ALTER TABLE dept_manager
    ADD CONSTRAINT fk_dept_mng_dept FOREIGN KEY (dept_no)
    REFERENCES department (dept_no);
	
CREATE TABLE employees
(
    emp_no integer NOT NULL,
    birth_date date,
    first_name varchar,
    last_name varchar,
    gender varchar,
    hire_date date,
    CONSTRAINT pk_emp PRIMARY KEY (emp_no)
);
	
CREATE TABLE salaries
(
    emp_no integer NOT NULL,
    salary numeric,
    from_date date,
    to_date date,
    CONSTRAINT pk_salar PRIMARY KEY (emp_no),
);

ALTER TABLE salaries
    ADD CONSTRAINT fk_emp_salar FOREIGN KEY (emp_no)
    REFERENCES employees (emp_no);
	
CREATE TABLE titles
(
    emp_no integer NOT NULL,
    title varchar,
    from_date date,
    to_date date,
    CONSTRAINT pk_title PRIMARY KEY (emp_no, title, from_date)
);

ALTER TABLE titles
    ADD CONSTRAINT fk_emp_title FOREIGN KEY (emp_no)
    REFERENCES employees (emp_no);
	



