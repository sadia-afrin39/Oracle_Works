create sequence incre start with 1 increment by 1;

drop table teacher ;

create table teachers(
id number(5),
name varchar2(50),
designation varchar2(50),
phone varchar2(20),
joining_date date,
salary number(10,2),
 primary key(id)
);

create table student(
id number(5) primary key,
name varchar2(50),
phone varchar2(20),
supervisor number(5),
foreign key (supervisor) references teachers(id)
);



insert into  teachers
values (incre.nextval,'Md Sams','lecturer', '09876543',to_date('06-02-2020','dd-mm-yyyy'),40000);
