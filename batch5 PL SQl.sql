--set serveroutput on
declare 
message varchar2(50):='Oracle PL/SQL';
BEGIN
DBMS_OUTPUT.PUT_LINE(message);
END;
/


declare 
num1 number :=10;
num2 number:= 20;
c number;
begin 
c:=num1+num2;
DBMS_OUTPUT.PUT_LINE('The sum is: ' || c);
end;
/

--CREATE A TABLE CUSTOMERS

CREATE TABLE CUSTOMERS( 
   ID   NUMBER(5), 
   NAME VARCHAR2(20), 
   AGE NUMBER(5), 
   ADDRESS VARCHAR2(25), 
   SALARY   NUMBER(18, 2),        
   PRIMARY KEY (ID) 
); 
--INSERT INTO CUSTOMERS
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );
  
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (6, 'Komal', 22, 'MP', 4500.00 );

--PL/SQL PROGRAM

DECLARE 
   c_id customers.id%type := 1; 
   c_name  customers.name%type; 
   c_addr customers.address%type; 
   c_sal  customers.salary%type; 
BEGIN 
   SELECT name, address, salary INTO c_name, c_addr, c_sal 
   FROM customers 
   WHERE id = c_id;  
   dbms_output.put_line 
   ('Customer ' ||c_name || ' from ' || c_addr || ' earns ' || c_sal); 
END; 
/

-- A SAMPLE PROGRAM FOR CIRCEL OPERATIONS

DECLARE 
   -- constant declaration 
   pi constant number := 3.141592654; 
   -- other declarations 
   radius number(5,2);  
   dia number(5,2);  
   circumference number(7, 2); 
   area number (10, 2); 
BEGIN  
   -- processing 
   radius := 9.5;  
   dia := radius * 2;  
   circumference := 2.0 * pi * radius; 
   area := pi * radius * radius; 
   -- output 
   dbms_output.put_line('Radius: ' || radius); 
   dbms_output.put_line('Diameter: ' || dia); 
   dbms_output.put_line('Circumference: ' || circumference); 
   dbms_output.put_line('Area: ' || area); 
END; 
/ 
--EXAMPLE OF PROCEDURE
DECLARE 
   a number; 
   b number; 
   c number;
PROCEDURE findMin(x IN number, y IN number, z OUT number) IS 
BEGIN 
   IF x < y THEN 
      z:= x; 
   ELSE 
      z:= y; 
   END IF; 
END;   
BEGIN 
   a:= 23; 
   b:= 45; 
   findMin(a, b, c); 
   dbms_output.put_line(' Minimum of (23, 45) : ' || c); 
END; 
/
--FUNCTION FOR FACTORIAL
DECLARE 
   num number; 
   factorial number;  
   
FUNCTION fact(x number) 
RETURN number  
IS 
   f number; 
BEGIN 
   IF x=0 THEN 
      f := 1; 
   ELSE 
      f := x * fact(x-1); 
   END IF; 
RETURN f; 
END;  

BEGIN 
   num:= 6; 
   factorial := fact(num); 
   dbms_output.put_line(' Factorial '|| num || ' is ' || factorial); 
END; 
/

desc employees;

create view empl_info as
select first_name, last_name, email from employees;

select * from empl_info;


SELECT * 
FROM employees 
WHERE EMPLOYEE_ID IN (107,108,109);


desc regions;
select count(*) columns from regions;

select first_name|| '''s last name is '|| last_name from employees;

--creating trigger for table lab1 by sequence
create sequence lab1_inc start with 5 increment by 1;

CREATE OR REPLACE TRIGGER lab1_seq 
BEFORE INSERT ON lab1 
FOR EACH ROW

BEGIN
  SELECT LAB1_INC.nextval
  INTO   :new.id
  FROM   dual;
END;
/

desc lab2;

insert into lab1
values(null,  'mobile com', '4-feb-20','class tomorrow');

insert into lab2
values(null,  'mobile com', '5-feb-20',1,'class tomorrow');

select * from lab2;

select * from dual;
