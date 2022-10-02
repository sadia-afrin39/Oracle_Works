--create as
CREATE TABLE newcustomers  
	AS (SELECT *   FROM departments  WHERE department_id >70;
	
	
--declare date as varchar2 then system's date & time show
	to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss')


CREATE TABLE newcustomers3  
  AS (SELECT regularcustomers.rcustomer_id, regularcustomers.rc_city, irregularcustomers.ircustomer_name  
      FROM regularcustomers, irregularcustomers  
      WHERE regularcustomers.rcustomer_id = irregularcustomers.ircustomer_id  
      AND regularcustomers.rcustomer_id < 5000);   
	
	
--alter table 
ALTER TABLE customers  
  ADD customer_age varchar2(50);     <!--add column-->
  
ALTER TABLE customers  
  ADD (customer_type varchar2(50),  
       customer_address varchar2(50));  
	  
ALTER TABLE customers  
  MODIFY customer_name varchar2(100) not null;  <!--changes column constraints-->
  
ALTER TABLE customers  
  MODIFY (customer_name varchar2(100) not null,  
          city varchar2(100));  
		  
ALTER TABLE customers           --drop column of a table-->
  DROP COLUMN customer_name; 		  

ALTER TABLE customers                  -- rename column of a table-->
 RENAME COLUMN customer_name to cname; 
 
 ALTER TABLE customers  <!--rename table-->
RENAME TO retailers;  


--drop table
DROP TABLE customers;	<!--drops table->


--view
CREATE VIEW sup_orders AS  
	SELECT suppliers.supplier_id, orders.quantity, orders.price    --create view
	FROM suppliers  
	INNER JOIN orders  
	ON suppliers.supplier_id = supplier_id  
	WHERE suppliers.supplier_name = 'VOJO'; 


CREATE or REPLACE VIEW sup_orders AS  
  SELECT suppliers.supplier_id, orders.quantity, orders.price    --update view
  FROM suppliers  
  INNER JOIN orders  
  ON suppliers.supplier_id = supplier_id  
  WHERE suppliers.supplier_name = 'HCL';  
  
DROP VIEW sup_orders;   --drop view

--queries

SELECT * from customers;  --select

SELECT age, address, salary  
	FROM customers  
	WHERE  age < 25  
	AND salary > '20000'  
	ORDER BY age ASC, salary DESC; 
	
SELECT customers.name, courses.trainer  
	FROM courses  
	INNER JOIN customers  
	ON courses.course_id = course_id  
	ORDER BY name;
	

insert into customers values(101,'rahul','delhi');  --insert

INSERT INTO suppliers  
	(supplier_id, supplier_name)  
	SELECT age, address  
	FROM customers  
	WHERE age > 20;

SELECT count(*)      --check the number of rows that you want to insert
	FROM customers  
	WHERE age > 20;
	
	
update customers set name='bob', city='london' where id=101; --update

UPDATE customers  
	SET name = (SELECT supplier_name  
					 FROM suppliers  					--update By selecting records from another table
					 WHERE suppliers.supplier_name = customers.name)  
	WHERE age < 25; 

delete from customers where id=101;  --delete

DELETE FROM customers  
	WHERE last_name = 'Maurya'  
	AND customer_id > 2; 

truncate table customers;   --remove records of a table. It doesn't remove structure

DELETE TABLE customers;
--Both the statements will remove the data from the "customers" 
--table but the main difference is that you can roll back the DELETE statement
-- whereas you can't roll back the TRUNCATE TABLE statement.


SELECT DISTINCT name, age, salary  	--distinct
	FROM customers  
	WHERE age >= '60'; 
	
SELECT *  			--order by
	FROM supplier  
	ORDER BY last_name DESC/asc;
	
SELECT state, COUNT(*) AS "Number of customers"   --group by
	FROM customers  
	WHERE salary > 10000  
	GROUP BY state;
	
SELECT department,   
	MIN(salary) AS "Lowest salary"    --group by min()
	FROM employees  
	GROUP BY department;
	
SELECT department,  		
	MAX(salary) AS "Highest salary"    --group by max()
	FROM employees  
	GROUP BY department;  

SELECT item, SUM(sale) AS "Total sales"    --having sum()
	FROM salesdepartment  
	GROUP BY item  
	HAVING SUM(sale) < 1000;  	
	
SELECT state, COUNT(*) AS "Number of customers"     --having count()
	FROM customers    
	WHERE salary > 10000  
	GROUP BY state  
	HAVING COUNT(*) >= 2;  
	
	
SELECT suppliers.supplier_id, suppliers.supplier_name, order1.order_number   --inner join
	FROM suppliers   
	INNER JOIN order1  
	ON suppliers.supplier_id = order1.supplier_id;  
	
--PROCEDURE

create table user(id number(10) primary key,name varchar2(100)); --Table creation:

create or replace procedure "INSERTUSER"     --Procedure Code:
	(id IN NUMBER / user.id%type,    
	name IN VARCHAR2)    
	is    
	begin    
	insert into user values(id,name);   --here user is the table   
	end;    
	/  

BEGIN    				--Oracle program to call procedure
   insertuser(101,'Rahul');  
   dbms_output.put_line('record inserted successfully');    
	END;    
	/   
	
execute insertuser(101,'Rahul');

DROP PROCEDURE pro1;   --drop procedure

--function
create or replace function adder(n1 in number, n2 in number)    -- create a function
	return number    
	is     
	n3 number(8);    
	begin    
	n3 :=n1+n2;    
	return n3;    
	end;    
	/   

DECLARE       --call the function
	   n3 number(2);    
	BEGIN    
	   n3 := adder(11,22);    
	   dbms_output.put_line('Addition is: ' || n3);    
	END;    
	/    
	
	
DECLARE  					--Another Oracle Function Example
	   a number;  
	   b number;  
	   c number;  
	FUNCTION findMax(x IN number, y IN number)   
	RETURN number  
	IS  
		z number;  
	BEGIN  
	   IF x > y THEN  
		  z:= x;  
	   ELSE  
		  Z:= y;  
	   END IF;  
	  
	   RETURN z;  
	END;   
	BEGIN  
	   a:= 23;  
	   b:= 45;  
	  
	   c := findMax(a, b);  
	   dbms_output.put_line(' Maximum of (23,45): ' || c);  
	END;  
	/
	
	
CREATE OR REPLACE FUNCTION totalCustomers  	--Oracle function example using table(create)
	RETURN number IS  
	   total number(2) := 0;  
	BEGIN  
	   SELECT count(*) into total  
	   FROM customers;  
		RETURN total;  
	END;  
	/  
	
DECLARE  					--Oracle function example using table(call)
	   c number(2);  
	BEGIN  
	   c := totalCustomers();  
	   dbms_output.put_line('Total no. of Customers: ' || c);  
	END;  
	/  											
	
DROP FUNCTION function_name;   --DROP FUNCTIOn	
	