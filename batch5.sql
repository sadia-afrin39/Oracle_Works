select country_name from COUNTRIES where region_id=1;

select * from EMPLOYEES;

desc locations;

create table lab1(
id number(5) primary key,
description varchar2(50),
class_date date,
notes varchar2(50)
--constraint lab1_pk primary key (id,description)
);

drop table lab1;

desc lab1;

--sequence

create sequence inc_auto  start with 2000 increment by 2;

insert into lab1(id, description, class_date,notes)
values (inc_auto.nextval,'second class', to_date('04-02-2020','DD-MM--YYYY'),'class ongoing');

select * from lab1;

create table lab2(
id number(5) primary key,
description varchar2(50),
class_date date,
lab1_id number(5) references lab1(id) on delete set null/cascade,
notes varchar2(50)
--foreign key (lab1_id) references lab1(id)
);


insert into lab2(id, description, class_date,lab1_id,notes)
values (inc_auto.nextval,'second class', to_date('04-02-2020','DD-MM--YYYY'),2000,'class ongoing');

select * from lab2;

delete from lab1 where id=2000;



