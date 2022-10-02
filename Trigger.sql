
create sequence inc_seq start with 1 increment by 1;  --create sequence

drop table teacher;

create table teacher(
id number(5),
name varchar2(30),
designation varchar2(30),
phone varchar2(15),
join_date date,
salary number(10,2),
primary key(id)
);
insert into teacher 
values(2, 'sdfghjkd', 'Lecturer', '09876543', '06-feb-20', 20000.20);

create table student(
id number(5) primary key,
name varchar2(30),
phone varchar2(15),
supervisor number(5),
foreign key(supervisor)references teacher(id)
);

insert into student
values('', 'kjhgfd','0987654',1);

select * from student;

CREATE OR REPLACE TRIGGER student_trigger   --create trigger
	BEFORE/after  INSERT/update/delete ON student 
	FOR EACH ROW

	BEGIN
	  SELECT INC_seq.nextval
	  INTO   :new.id
	  FROM   dual;
	END;
	/

DROP TRIGGER SUPPLIERS_T1;   --DROP TRIGGER

ALTER TRIGGER trigger_name DISABLE;  --DISABLE trigger

ALTER TABLE table_name DISABLE ALL TRIGGERS;   --disable all trigger from the table

ALTER TRIGGER trigger_name ENABLE;   --enable trigger

ALTER TABLE table_name ENABLE ALL TRIGGERS;   --enable all trigger from the table


--plsql

set SERVEROUTPUT ON;

declare
msg varchar2(50) :='Hello Oracle';
myself varchar2(50) :='I am abcd';

begin
DBMS_OUTPUT.PUT_LINE(msg || myself);
END;
/


declare
num1 Number(5) :=10;
num2 Number(5) :=20;
num3 Number(5);
begin
num3:=num1+num2;
DBMS_OUTPUT.PUT_LINE('The sum is: ' || num3);
END;
/

describe dual;





