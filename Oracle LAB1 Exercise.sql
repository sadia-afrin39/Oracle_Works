
---DATA TYPES--
character:
char: fixed length
varchar2 : variable length

number (precision, scale/ decimal): 
number (4, 2) [23.22]

date :
default value: DD-MON-YY (3-FEB-20)

insert into table
values ('abc', (to_date('03/02/2020', 'dd/mm/yyyy')), 234);

--AUTO_INCREMENT/SEQUENCE
create sequence temp start with 1000 increment by 1;
uses: temp.nextval

https://stackoverflow.com/questions/11296361/how-to-create-id-with-auto-increment-on-oracle

---SQL USING GUI----
create table
insert data
--CREATE TABLE with primary key---
--method1: 
create table students_tbl(
	id number(3) primary key,
	name varchar2(20),
	address varchar2(50),
	contact varchar2(12)
);
--drop table
drop table students_tbl;

--method 2:with constraint 
create table students_tbl(
	id number(3) constraint st_tbl_pk_id primary key,
	name varchar2(20),
	address varchar2(50),
	contact varchar2(12)
);
---method 3:
create table students_tbl(
	id number(3), 
	name varchar2(20),
	address varchar2(50),
	contact varchar2(12),
	constraint st_tbl_pk_id primary key (id)
);

--drop primary key
alter table students_tbl drop st_tbl_pk_id;

---method 4:
create table students_tbl(
	id number(3), 
	name varchar2(20),
	address varchar2(50),
	contact varchar2(12),	
);
alter table students_tbl add constraint st_tbl_pk_id primary key (id);

--method 5: composite primary key
create table students_tbl(
	id number(3), 
	name varchar2(20),
	address varchar2(50),
	contact varchar2(12),	
);
alter table students_tbl add constraint st_tbl_pk_id primary key (id, name);


---FOREIGN KEY---

batch (id, name, semester, cr)


--method 1:
create table batch(
id number(3) primary key,
name varchar2(20),
semester varchar2(20),
cr number(3),
foreign key(cr) references students_tbl(id)
);

--method 2:
create table batch(
id number(3) primary key,
name varchar2(20),
semester varchar2(20),
cr number(3) references students_tbl(id)
);
--method 3: using alter table
alter table batch foreign key(cr) references students_tbl(id);

alter table tarin add constraint frkey   foreign key (emp_id) references employees (employee_id); 

---FOREIGN KEY : SET NULL--
create table batch(
id number(3) primary key,
name varchar2(20),
semester varchar2(20),
cr number(3),
foreign key(cr) references students_tbl(id) on delete set null
);

---FOREIGN KEY : CASCADE--
create table batch(
id number(3) primary key,
name varchar2(20),
semester varchar2(20),
cr number(3),
foreign key(cr) references students_tbl(id) on delete cascade
);



---ALTER / RENAME/ TABLE NAME---
alter table batch rename bsc_batch;

--ADDING/ DELETING/MODIFY COLUMN in TABLE--
alter table batch add year varchar2(20); --add
alter table batch drop column year; --delete

alter table batch rename column year to academic_year;

alter table batch modify academic_year number(10);

---INSERT DATA into TABLE---
insert into students_tbl
values(1, 'samss', 'barishal', '0987654');






