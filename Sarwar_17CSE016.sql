--           Qn:01



--Employee Table

create table employee(
e_id number(11) primary key,
employee_name varchar2(255),
street varchar2(255),
city varchar2(255),
dob date
);
DROP TABLE employee;

SELECT * FROM employee;


--WOrks Table

create table works(
w_id number(11) primary key,
employee_id number(11),
company_id number(11),
salary number(10,2),
FOREIGN KEY(employee_id) REFERENCES employee(e_id) on DELETE CASCADE,
FOREIGN KEY(company_id) REFERENCES company(c_id) on DELETE CASCADE
);
DROP TABLE works;

SELECT * FROM works;

--Company Table

create table company(
c_id number(11) primary key,
company_name  varchar2(255),
city  varchar2(255)
);
DROP TABLE company;

SELECT * FROM company;

--Manages Table

create table manages(
m_id number(11) primary key,
employee_id number(11),
manager_name varchar2(255),
FOREIGN KEY(employee_id) REFERENCES employee(e_id) on DELETE CASCADE
);
DROP TABLE manages;

SELECT * FROM manages;

--ends qn1

--      Qn2

insert into employee
values(1, 'Habib', 'Ashraf ali', 'Barishal', TO_DATE('12/01/1996','DD/MM/YYYY'));

insert into employee
values(2, 'Kabir', 'Sherebangla', 'barishal', TO_DATE('10-10-1991','DD-MM-YYYY'));

insert into employee
values(3, 'Sabir', 'Farmgate', 'Dhaka', TO_DATE('12-12-1988','DD-MM-YYYY'));

insert into employee
values(4, 'Ruba', 'Basabo', 'Khulna', TO_DATE('11-11-1997','DD-MM-YYYY'));

insert into employee
values(5, 'Abir', 'Tallahasse', 'Florida', TO_DATE('03-04-1989','DD-MM-YYYY'));


insert into company
values(1, 'IIT', 'Dhaka');
insert into company
values(2, 'Google', 'California');
insert into company
values(3, 'ESL', 'Dhaka');


insert into works
values(1,1,1,22000.00);
insert into works
values(2,2,2,120000.00);
insert into works
values(3,3,3,51000.00);
insert into works
values(4,4,1,32000.00);
insert into works
values(5,5,2,150000.00);



insert into manages
values(1,1,'Shoyaib');
insert into manages
values(2,2,'Khaled');
insert into manages
values(3,3,'Zaman');
insert into manages
values(4,4,'Khaled');
insert into manages
values(5,5,'Robert');

-- Qn2 ends


--          Qn:3

--query1:
SELECT employee.employee_name, employee.street, employee.city FROM employee 
INNER JOIN works ON works.employee_id=employee.e_id
INNER JOIN company ON company.c_id=works.company_id
WHERE company.company_name='Google';

--query2:
SELECT employee.employee_name FROM employee 
INNER JOIN works ON works.employee_id=employee.e_id
INNER JOIN company ON company.c_id=works.company_id
WHERE company.city=employee.city;

--query3:
SELECT * FROM employee 
INNER JOIN works ON works.employee_id=employee.e_id
where works.salary=( select
MAX(works.salary) from works);
SELECT * FROM employee 
INNER JOIN works ON works.employee_id=employee.e_id
where works.salary=( select
MIN(works.salary) from works);

--query4:
SELECT * FROM employee e WHERE (trunc( sysdate,'YEAR') - trunc( e.dob, 'YEAR'))>29;


--Query 5
SELECT  e.employee_name,e.street,e.city,e.dob  From employee e, works w  
where w.salary>(SELECT AVG(works.salary) From works) and e.e_id=w.employee_id;