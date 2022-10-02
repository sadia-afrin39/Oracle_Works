--que 1
create sequence incre_seq start with 1 increment by 1;


create table employee(
e_id number(11) primary key,
employee_name varchar2(255),
street varchar2(255),
city varchar2(255),
dob date
);

CREATE OR REPLACE TRIGGER employee_trigger   
	BEFORE  INSERT ON employee
	FOR EACH ROW
	BEGIN
	  SELECT incre_seq.nextval
	  INTO   :new.e_id
	  FROM   dual;
	END;
	/

create table company(
c_id number(11) primary key,
company_name  varchar2(255),
city  varchar2(255)
);


CREATE OR REPLACE TRIGGER company_trigger   
	BEFORE  INSERT ON company
	FOR EACH ROW
	BEGIN
	  SELECT incre_seq.nextval
	  INTO   :new.c_id
	  FROM   dual;
	END;
	/
  
 create table manages(
m_id number(11) primary key,
employee_id number(11),
manager_name varchar2(255),
FOREIGN KEY(employee_id) REFERENCES employee(e_id) on DELETE set null
);

CREATE OR REPLACE TRIGGER manages_trigger   
	BEFORE  INSERT ON manages
	FOR EACH ROW
	BEGIN
	  SELECT incre_seq.nextval
	  INTO   :new.m_id
	  FROM   dual;
	END;
	/
  
create table works(
w_id number(11) primary key,
employee_id number(11),
company_id number(11),
salary number(10,2),
FOREIGN KEY(employee_id) REFERENCES employee(e_id) on DELETE set null,
FOREIGN KEY(company_id) REFERENCES company(c_id) on DELETE set null
);

CREATE OR REPLACE TRIGGER works_trigger   
	BEFORE  INSERT ON works
	FOR EACH ROW
	BEGIN
	  SELECT incre_seq.nextval
	  INTO   :new.w_id
	  FROM   dual;
	END;
	/


--que2

insert into employee values(null, 'Habib', 'Ashraf ali', 'Barishal', TO_DATE('12/01/1996','DD/MM/YYYY'));
insert into employee values(null, 'Kabir', 'Sherebangla', 'barishal', TO_DATE('10-10-1991','DD-MM-YYYY'));
insert into employee values(null, 'Sabir', 'Farmgate', 'Dhaka', TO_DATE('12-12-1988','DD-MM-YYYY'));
insert into employee values(null, 'Ruba', 'Basabo', 'Khulna', TO_DATE('11-11-1997','DD-MM-YYYY'));
insert into employee values(null, 'Abir', 'Tallahasse', 'Florida', TO_DATE('03-04-1989','DD-MM-YYYY'));


insert into company values(null, 'IIT', 'Dhaka');
insert into company values(null, 'Google', 'California');
insert into company values(null, 'ESL', 'Dhaka');
insert into company values(null, 'Datasoft', 'Dhaka');


insert into manages values(null,1,'Shoyaib');
insert into manages values(null,2,'Khaled');
insert into manages values(null,3,'Zaman');
insert into manages values(null,4,'Khaled');
insert into manages values(null,5,'Robert');


insert into works values(null,1,14,22000.00);
insert into works values(null,2,7,120000.00);
insert into works values(null,3,8,51000.00);
insert into works values(null,4,6,32000.00);
insert into works values(null,5,7,150000.00);

--que3

--a
SELECT employee.employee_name, employee.street, employee.city
FROM employee inner JOIN manages on employee.E_ID=manages.EMPLOYEE_ID 
WHERE manages.MANAGER_NAME='Shoyaib'; 

--b
SELECT employee.employee_name FROM employee 
INNER JOIN works ON works.employee_id=employee.e_id
INNER JOIN company ON company.c_id=works.company_id
WHERE company.city=employee.city;


--c
SELECT employee.EMPLOYEE_NAME FROM employee 
INNER JOIN works ON works.employee_id=employee.e_id
where works.salary=( select
MAX(works.salary) from works);


--d

--e
SELECT  employee.employee_name From employee inner join  works 
on employee.e_id=works.employee_id
where works.salary < (SELECT AVG(works.salary) From works);

--SELECT AVG(works.salary) From works;