CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(128)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" TIMESTAMP   NOT NULL,
    "first_name" VARCHAR(128)   NOT NULL,
    "last_name" VARCHAR(128)   NOT NULL,
    "gender" CHAR(1)   NOT NULL,
    "hire_date" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "from_date" TIMESTAMP   NULL,
    "dept_name" VARCHAR(128)   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR(128)   NOT NULL,
    "from_date" TIMESTAMP   NOT NULL,
    "to_date" TIMESTAMP   NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" TIMESTAMP   NOT NULL,
    "to_date" TIMESTAMP   NULL
);

CREATE TABLE "dept_manager" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "from_date" TIMESTAMP   NOT NULL,
    "to_date" TIMESTAMP   NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE dept_emp 
RENAME COLUMN dept_name TO to_date;


ALTER TABLE dept_emp
ALTER COLUMN to_date TYPE TIMESTAMP USING to_date::timestamp without time zone;








	

