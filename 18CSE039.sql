
--PART A----

--publisher sequence creation--

create sequence publisher_seq start with 1 increment by 1;

--publisher table creation---

create table publisher (
publisher_id number(11) primary key,
name varchar2 (255),
address varchar2 (255)
);

--publisher trigger creation---

CREATE OR REPLACE TRIGGER publisher_trigger   
	BEFORE  INSERT ON publisher 
	FOR EACH ROW
	BEGIN
	  SELECT publisher_seq.nextval
	  INTO   :new.publisher_id
	  FROM   dual;
	END;
	/
	
 --insert into publisher ---
--
insert into publisher(name,address) values ('Afser Brothers','Motijheel,Dhaka');
insert into publisher(name,address) values ('Agami Prokasoni','Dhanmondi,Dhaka');
insert into publisher(name,address) values ('Asia Publications','Motijheel,Dhaka');
insert into publisher(name,address) values ('Ananna','Mohammadpur,Dhaka');
insert into publisher(name,address) values ('Beauty Book House','Khalispur,Khlna');

--authors sequence creation--

create sequence authors_seq start with 1 increment by 1;

--authors table creation---

create table authors (
author_id number(11) primary key,
author_name varchar2 (255),
author_address varchar2 (255)
);

--authors trigger creation---
CREATE OR REPLACE TRIGGER authors_trigger   
	BEFORE  INSERT ON authors 
	FOR EACH ROW
	BEGIN
	  SELECT authors_seq.nextval
	  INTO   :new.author_id
	  FROM   dual;
	END;
	/
--insert into author--
insert into authors(author_name,author_address) values ('Humayun Ahmed','Motijheel,Dhaka');
insert into authors(author_name,author_address) values ('Tahmima Anam','Dhanmondi,Dhaka');
insert into authors(author_name,author_address) values ('K Anis Ahmed','Mohammadpur,Dhaka');
insert into authors(author_name,author_address) values ('Kaiser Haq','Khalispur,Khlna');
insert into authors(author_name,author_address) values ('Rashid Askari','Motijheel,Dhaka');

--borrowers sequence creation--

create sequence borrowers_seq start with 1 increment by 1;

--borrowers table creation---

create table borrowers (
borrower_id number(11) primary key,
firstname varchar2 (255),
lastname varchar2 (255),
address varchar2 (255),
email varchar2 (255),
phone varchar2 (255),
department varchar2 (255)
);
--borrowers trigger creation---

CREATE OR REPLACE TRIGGER borrowers_trigger   
	BEFORE  INSERT ON borrowers 
	FOR EACH ROW
	BEGIN
	  SELECT borrowers_seq.nextval
	  INTO   :new.borrower_id
	  FROM   dual;
	END;
	/
--insert into borrowers--
insert into borrowers(firstname,LASTNAME,ADDRESS,EMAIL,PHONE,DEPARTMENT) values ('Intifa Aman',' Taifa','Thana Council,Barisal','taifa.cse5.bu@gmail.com','01923456789','CSE');
insert into borrowers(firstname,LASTNAME,ADDRESS,EMAIL,PHONE,DEPARTMENT) values ('Nawshin Haque',' Juthi','Choumatha,Barisal','juthi.cse5.bu@gmail.com','01923468749','CSE');
insert into borrowers(firstname,LASTNAME,ADDRESS,EMAIL,PHONE,DEPARTMENT) values ('Rashed Hasan','Siam','Amtola,Barisal','rashed.cse5.bu@gmail.com','01923456789','CSE');
insert into borrowers(firstname,LASTNAME,ADDRESS,EMAIL,PHONE,DEPARTMENT) values ('Razinul',' Karim','Kaunia,Barisal','razin.cse5.bu@gmail.com','01383456789','CSE');
insert into borrowers(firstname,LASTNAME,ADDRESS,EMAIL,PHONE,DEPARTMENT) values ('Nawshin',' Tabassum','Kaunia,Barisal','nawshin.cse5.bu@gmail.com','01423456789','CSE');


--books sequence creation--
create sequence books_seq start with 1 increment by 1;

--books table creation---
create table books (
book_id number(11) primary key,
book_title varchar2 (255),
author_id number(11),
publisher_id number(11),
no_of_copies number(11),
foreign key (author_id) references authors(author_id),
foreign key (publisher_id) references publisher(publisher_id)
);

--books trigger creation---

CREATE OR REPLACE TRIGGER books_trigger   
	BEFORE  INSERT ON books 
	FOR EACH ROW
	BEGIN
	  SELECT books_seq.nextval
	  INTO   :new.book_id
	  FROM   dual;
	END;
	/
  
  --insert into books--
  insert into books(book_title,author_id,publisher_id,no_of_copies) values ('Algorithms',2,5,2);
  insert into books(book_title,author_id,publisher_id,no_of_copies) values ('Computer Fundamental',1,3,5);
  insert into books(book_title,author_id,publisher_id,no_of_copies) values ('Data Communication',5,2,1);
  insert into books(book_title,author_id,publisher_id,no_of_copies) values ('Programming Fundamental',3,4,3);
  insert into books(book_title,author_id,publisher_id,no_of_copies) values ('Compter Architecture',4,1,4);
  
 --booking sequence creation-- 
  create sequence booking_seq start with 1 increment by 1;
  
 --booking table creation--- 
  create table booking (
booking_id number(11) primary key,
book_id number(11),
borrower_id number(11),
bookingdate varchar2(30),
availabledate varchar2(30),
foreign key (book_id) references books(book_id),
foreign key (borrower_id) references borrowers(borrower_id)
);

--booking trigger creation---

CREATE OR REPLACE TRIGGER booking_trigger   
	BEFORE  INSERT ON booking 
	FOR EACH ROW
	BEGIN
	  SELECT booking_seq.nextval
	  INTO   :new.booking_id
	  FROM   dual;
	END;
	/ 
 
 --insert into booking--
insert into booking(book_id,borrower_id,bookingdate,availabledate) values (2,1,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss')); 
insert into booking(book_id,borrower_id,bookingdate,availabledate) values (3,2,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'));
insert into booking(book_id,borrower_id,bookingdate,availabledate) values (5,5,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'));
insert into booking(book_id,borrower_id,bookingdate,availabledate) values (1,4,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss')); 
insert into booking(book_id,borrower_id,bookingdate,availabledate) values (4,3,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'));
 
 --borrow_book sequence creation--
 create sequence borrow_book_seq start with 1 increment by 1;
 
--borrow_book table creation--- 
 create table  borrow_book (
id number(11) primary key,
book_id number(11),
borrower_id number(11),
borrowingdate varchar2(30),
duedate varchar2(30),
foreign key (book_id) references books(book_id),
foreign key (borrower_id) references borrowers(borrower_id)
);

--borrow_book trigger creation---

create or replace trigger borrow_book_trigger
before insert on borrow_book
for each row
begin
  select borrow_book_seq.nextval
  into :new.id
  from dual;
end;
/

--insert into borrow_book--
insert into borrow_book(book_id,borrower_id,borrowingdate,duedate) values (2,1,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss')); 
insert into borrow_book(book_id,borrower_id,borrowingdate,duedate) values (3,2,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'));
insert into borrow_book(book_id,borrower_id,borrowingdate,duedate) values (5,5,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'));
insert into borrow_book(book_id,borrower_id,borrowingdate,duedate) values (5,1,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'));
insert into borrow_book(book_id,borrower_id,borrowingdate,duedate)values (2,3,to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'),to_char(sysdate,'dd/mm/yyyy hh24:mi:ss'));
 
  
 


--PART B---

--Query 1----
select * from borrowers;

--Query 2----
select books.book_title as Title,authors.author_name as Author,publisher.name as Publisher
from books inner join authors on books.AUTHOR_ID = authors.AUTHOR_ID
inner join publisher on books.publisher_ID = publisher.PUBLISHER_ID;

--Query 3----
select distinct(books.book_title) from books inner join borrow_book
on books.BOOK_ID=borrow_book.BOOK_ID;

--Query 4----
select books.book_id,books.BOOK_TITLE,books.AUTHOR_ID,books.PUBLISHER_ID,books.NO_OF_COPIES from books inner join authors on books.AUTHOR_ID = authors.AUTHOR_ID
where authors.AUTHOR_NAME like 'Nazrul%';

--Query 5----
select * from authors where AUTHOR_NAME like 'M%' or 
AUTHOR_NAME like 'S%' or AUTHOR_NAME like 'R%';

--Query 6--
SELECT * FROM borrowers WHERE borrower_id=(SELECT borrower_id FROM borrow_book GROUP BY(borrower_id) 
HAVING COUNT(borrower_id)=( SELECT MAX(t) FROM (SELECT COUNT(b2.book_id) as t FROM borrow_book b2 GROUP BY(book_id) ) as b1));

--Query 7--

 SELECT DISTINCT b.borrower_id,firstname,lastname,address,email,phone,department
 FROM borrowers b INNER JOIN borrow_book bb ON bb.borrower_id=b.borrower_id;

--Query 8----
create or replace TRIGGER Tarin_039
AFTER INSERT ON borrow_book
FOR EACH ROW

BEGIN
UPDATE books SET books.no_of_copies=books.no_of_copies-1
WHERE books.book_id  =:new.book_id;
END;
/
--Query 9----
CREATE OR REPLACE PROCEDURE  Tarin
    (id number)
    IS
       tarin authors%ROWTYPE;
    BEGIN
        SELECT a.* INTO tarin
        FROM authors a,books b
        where a.author_id = b.author_id AND b.book_id=id;
        dbms_output.put_line( tarin.author_name || ' ' ||
         tarin.author_address );
    END;
    /
EXECUTE Author_Details(5);

--Query 10--
CREATE OR REPLACE FUNCTION  Func (tarin OUT SYS_REFCURSOR,eml IN VARCHAR2) RETURN tarin
IS 
BEGIN
    OPEN tarin FOR
        SELECT TO_DATE(b.duedate,'YYYY-MM-DD')-TO_DATE(SYSDATE,'YYYY-MM-DD')  FROM borrowers b INNER JOIN
		borrow_book bb ON bb.borrower_id=b.borrower_id WHERE b.email=eml;

    RETURN tarin;
END;

--Query 11----
create view cse039 as ( select borrowers.firstname || borrowers.lastname  as borrower_name,books.book_title
 as bookname,borrow_book.borrowingdate from borrowers join borrow_book using(borrower_id) join books using (book_id));

--Query12----

CREATE TABLE writters( 
writer_id number primary key,
writer_name varchar(40),
writer_address varchar(40)

);

--CREATE SECOND SEQUENCE------
create sequence writter_sequence
start with 1
INCREMENT by 1 
MAXVALUE 5000
nocache;

---CREATE TRIGGER FROM   LIBRARY_AUTHOR-----
CREATE OR REPLACE TRIGGER writter_trigger
before insert on writters
for each row
enable
declare 
v_id writters.writer_id%TYPE;
begin 
select   writter_sequence.nextval into v_id from dual;
:NEW.writer_id:=v_id;
end writte_trigger;
/
insert into writters(writer_name ,writer_address ) select author_name,author_address from library_author;


--Query13--
select * from borrow_book where rownum<4;

--Query14--
select * from borrowers where rownum=1 order by borrower_id desc;

---Part C----
CREATE FUNCTION PrimeChecker (id IN books.book_id%TYPE) RETURN VARCHAR2
IS
  declare 
       num number;
num:=id	   
       i number:=1; 
       c number:=0; 
  begin 

       for i in 1..num 
       loop 
          if((mod(num,i))=0) 
           then 
              c:=c+1; 
         end if; 
      end loop; 
     if(c>2) 
     then 
         dbms_output.put_line(num||' The number is not prime'); 
     else 
        dbms_output.put_line(num||' The number is prime'); 
     end if; 
  end; 
   /



--------------------END-------------------


