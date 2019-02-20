CREATE TABLE STUDENT(REGNO VARCHAR(30) PRIMARY KEY,NAME VARCHAR(30) NOT NULL,MAJOR VARCHAR(30) NOT NULL,BDATE DATE NOT NULL);CREATE TABLE COURSE(COURSE INTEGER PRIMARY KEY,CNAME VARCHAR(30) NOT NULL,DEPT VARCHAR(30) NOT NULL);CREATE TABLE ENROLL(REG_NO VARCHAR(30) NOT NULL,COURSE INTEGER NOT NULL,SEM INTEGER NOT NULL,MARKS INTEGER NOT NULL,PRIMARY KEY(REG_NO,COURSE_,SEM),FOREIGN KEY (REG_NO) REFERENCES STUDENT(REGNO) DELETE ONCASCADE,FOREIGN KEY (COURSE) REFERENCES COURSE(COURSE) DELETE ONCASCADE);CREATE TABLE TEXT(BOOKISBN INTEGER PRIMARY KEY,BOOKTITLE VARCHAR(30) NOT NULL,PUBLISHER VARCHAR(30) NOT NULL,AUTHOR VARCHAR(30) NOT NULL);CREATE TABLE BOOK_ADOPTION(COURSE INTEGER NOT NULL,SEM INTEGER NOT NULL,
24


BOOK_ISBN INTEGER NOT NULL,PRIMARY KEY(COURSE_,SEM,BOOK_ISBN),FOREIGN KEY (COURSE) REFERENCES COURSE(COURSE) DELETE ONCASCADE,FOREIGN KEY(BOOK_ISBN) REFERENCES TEXT(BOOKISBN) DELETE ONCASCADE);INSERT INTO STUDENT VALUES('1BM02IS012','ANSHUMANATRI','DATBASE','15-JAN-84');INSERT INTO STUDENT VALUES('1BM02CS012','A MNC','DMS','25-FEB-84');INSERT INTO STUDENT VALUES('1BM02TC012','TELE TECHNO','SSDT','11-DEC-84');INSERT INTO STUDENT VALUES('1BM02EE012','ELCTRA','POWER GENERATION','1-APR-84');INSERT INTO STUDENT VALUES('1BM02EC012','GG','POWER ELECTRONICS','5-NOV-84');INSERT INTO COURSE VALUES(1,'DATABASE','IS');INSERT INTO COURSE VALUES(2,'DMS','IS');INSERT INTO COURSE VALUES(3,'SSDT','TC');INSERT INTO COURSE VALUES(4,'POWER GENERATION','EE');INSERT INTO COURSE VALUES(5,'POWER ELECTRONICS','EC');INSERT INTO TEXT VALUES(1,'DATABASE A SYSTEMATICAPPROACH','JOHN WILEY','R ASHOK KUMAR');INSERT INTO TEXT VALUES(2,'DMS FOR DUMMIES','PEARSON','MADHUPRIYA');INSERT INTO TEXT VALUES(3,'SSDT NO ONE CAN TEACHBETTER','PEARSON','GAURA');INSERT INTO TEXT VALUES(4,'POWER GENERATIONBIBLE','TMH','MEENA');INSERT INTO TEXT VALUES(5,'POWER OF POWER ELECTRONICS','OREILLY','GG THE GREAT');INSERT INTO ENROLL VALUES('1BM02IS012',1,5,98);INSERT INTO ENROLL VALUES('1BM02CS012',2,3,88);INSERT INTO ENROLL VALUES('1BM02TC012',3,5,88);INSERT INTO ENROLL VALUES('1BM02EE012',4,5,88);INSERT INTO ENROLL VALUES('1BM02EC012',5,5,88);
25

INSERT INTO BOOK_ADOPTION VALUES(1,5,1);INSERT INTO BOOK_ADOPTION VALUES(2,3,2);INSERT INTO BOOK_ADOPTION VALUES(3,5,3);INSERT INTO BOOK_ADOPTION VALUES(4,5,4);INSERT INTO BOOK_ADOPTION VALUES(5,5,5);







CREATE TABLE STUDENT(REGNO VARCHAR(30) PRIMARY KEY,NAME VARCHAR(30) NOT NULL,MAJOR VARCHAR(30) NOT NULL,BDATE DATE NOT NULL);

CREATE TABLE COURSE(COURSE INTEGER PRIMARY KEY,CNAME VARCHAR(30) NOT NULL,DEPT VARCHAR(30) NOT NULL);

CREATE TABLE ENROLL(REG_NO VARCHAR(30) NOT NULL,COURSE INTEGER NOT NULL,SEM INTEGER NOT NULL,MARKS INTEGER NOT NULL,PRIMARY KEY(REG_NO,COURSE_,SEM));


CREATE TABLE TEXT(BOOKISBN INTEGER PRIMARY KEY,BOOKTITLE VARCHAR(30) NOT NULL,PUBLISHER VARCHAR(30) NOT NULL,AUTHOR VARCHAR(30) NOT NULL);


CREATE TABLE BOOK_ADOPTION(COURSE INTEGER NOT NULL,SEM INTEGER NOT NULL,BOOK_ISBN INTEGER NOT NULL,PRIMARY KEY(COURSE_,SEM,BOOK_ISBN),FOREIGN KEY (COURSE) REFERENCES COURSE(COURSE) ,FOREIGN KEY(BOOK_ISBN) REFERENCES TEXT(BOOKISBN));

INSERT INTO STUDENT VALUES('1BM02IS012','ANSHUMANATRI','DATBASE','15-JAN-84');INSERT INTO STUDENT VALUES('1BM02CS012','A MNC','DMS','25-FEB-84');INSERT INTO STUDENT VALUES('1BM02TC012','TELE TECHNO','SSDT','11-DEC-84');INSERT INTO STUDENT VALUES('1BM02EE012','ELCTRA','POWER GENERATION','1-APR-84');INSERT INTO STUDENT VALUES('1BM02EC012','GG','POWER ELECTRONICS','5-NOV-84');INSERT INTO COURSE VALUES(1,'DATABASE','IS');INSERT INTO COURSE VALUES(2,'DMS','IS');INSERT INTO COURSE VALUES(3,'SSDT','TC');INSERT INTO COURSE VALUES(4,'POWER GENERATION','EE');INSERT INTO COURSE VALUES(5,'POWER ELECTRONICS','EC');INSERT INTO TEXT VALUES(1,'DATABASE A SYSTEMATICAPPROACH','JOHN WILEY','R ASHOK KUMAR');INSERT INTO TEXT VALUES(2,'DMS FOR DUMMIES','PEARSON','MADHUPRIYA');INSERT INTO TEXT VALUES(3,'SSDT NO ONE CAN TEACHBETTER','PEARSON','GAURA');INSERT INTO TEXT VALUES(4,'POWER GENERATIONBIBLE','TMH','MEENA');INSERT INTO TEXT VALUES(5,'POWER OF POWER ELECTRONICS','OREILLY','GG THE GREAT');INSERT INTO ENROLL VALUES('1BM02IS012',1,5,98);INSERT INTO ENROLL VALUES('1BM02CS012',2,3,88);INSERT INTO ENROLL VALUES('1BM02TC012',3,5,88);INSERT INTO ENROLL VALUES('1BM02EE012',4,5,88);INSERT INTO ENROLL VALUES('1BM02EC012',5,5,88);
INSERT INTO BOOK_ADOPTION VALUES(1,5,1);INSERT INTO BOOK_ADOPTION VALUES(2,3,2);INSERT INTO BOOK_ADOPTION VALUES(3,5,3);INSERT INTO BOOK_ADOPTION VALUES(4,5,4);INSERT INTO BOOK_ADOPTION VALUES(5,5,5);

--actual code begins
CREATE TABLE student (
  regno VARCHAR(20) PRIMARY KEY,
  name VARCHAR(50),
  major VARCHAR(20),
  bdate DATE
);
CREATE TABLE course (
  course_no INT PRIMARY KEY,
  cname VARCHAR(30),
  dept VARCHAR(30)
);
CREATE TABLE enroll (
  regno VARCHAR(20),
  course_no INT,
  PRIMARY KEY(regno, course_no),
  FOREIGN KEY(regno) REFERENCES student(regno),
  FOREIGN KEY(course_no) REFERENCES course(course_no)
);
CREATE TABLE text (
  book_isbn INT PRIMARY KEY,
  book_title VARCHAR(50),
  publisher VARCHAR(50),
  author VARCHAR(50)
);
CREATE TABLE book_adoption (
  course_no INT,
  sem INT,
  book_isbn INT,
  PRIMARY KEY (course_no, book_isbn),
  FOREIGN KEY (course_no) REFERENCES course(course_no), -- ON DELETE CASCADE,
  FOREIGN KEY (book_isbn) REFERENCES text(book_isbn)
);

--insertion
insert into student values('a101','anil','bcom',str_to_date('09 november 1987', '%d %M %Y'));
insert into student values('a102','vineet','bsc', str_to_date('16 08 1988', '%d %m %Y'));
insert into student values('a103','sourav','mba', str_to_date('20 05 1988', '%d %m %Y'));
insert into student values('a104','mandeep','msc', str_to_date('28 08 1989', '%d %m %Y'));
insert into student values('a015','vicky','btech', str_to_date('17 08 1989', '%d %m %Y'));

insert into course values(1001,'mca','dca');
insert into course values(1002,'bsc','cs');
insert into course values(1003,'bbm','dom');
insert into course values(1004,'msc','cs');
insert into course values(1005,'bca','dca');

insert into enroll values('a101',1001);
insert into enroll values('a102',1005);
insert into enroll values('a103',1003);
insert into enroll values('a104',1002);
insert into enroll values('a101',1003);

insert into text values(2100,'networks','pearson','stallings');
insert into text values(3123,'dbms','mcgraw','navathe');
insert into text values(4567,'oops','tata','venugopal');
insert into text values(6412,'sys soft','reilly','dhamdere');
insert into text values(8455,'tech com','peterson','mathew');

insert into book_adoption values(1002,2,2100);
insert into book_adoption values(1004,3,3123);
insert into book_adoption values(1004,2,2100);
insert into book_adoption values(1005,4,8455);
insert into book_adoption values(1003,3,4567);

--a. List the courses which uses more than 1 text book.
select course_no, count(book_isbn)
from book_adoption
group by course_no
having count(book_isbn) > 1;

select cname, count(book_isbn)
from book_adoption natural join course
group by course_no
having count(book_isbn) > 1;

--b. List the departments whose ALL course text books are published by a particular publisher.
-- DP: HAVING: aggregate logic WHERE : non aggregate
select table1.dept
from
  (
    select dept, count(*) as total
    from course
    group by dept
  ) as table1,
  (
    select dept, count(*) as total
    from (course natural join book_adoption) natural join text
    where publisher = 'mcgraw'
    group by dept
  ) as table2
where
  table1.total = table2.total AND table1.dept = table2.dept;

select c.dept
from course c
where course_no in
  (
    select course_no from book_adoption where
    book_isbn=(select book_isbn from text where publisher='mcgraw'));

-- Produce a list of students who are not enrolled.
-- TESTED 1
select regno
from student
where regno not in (
  select regno
  from enroll
);

-- List the books which are adopted by the course as well as enrolled by the student.
-- TESTED 1
select book_isbn
from text natural join book_adoption
where course_no in (
  select distinct course_no
  from enroll
);

-- List the courses which has adapted at least two books from a specific publisher.
select course_no, count(*) as total
from (course natural join book_adoption) natural join text
where publisher = 'mcgraw'
group by course_no
having count(*)  >= 2

-- Identify the students who are enrolled for maximum number of books.
select regno
from enroll natural join book_adoption
group by regno
having count(book_isbn) = (
  select max(table1.tot)
  from (
      select count(book_isbn) as tot
	     from enroll natural join book_adoption
	      group by regno
      ) as table1
);
-- List the publishers along with the number of books published by them.
select publisher, count(*)
from text
group by publisher;


--List the students who are enrolled to all their courses which adopts books. EXCEPT .. MINUS
--(note: some of the courses need not adopt books)
select
from student s
where not exists (
  (
    select distinct course_no
    from BOOK_ADOPTION
  )
  MINUS
  (
    select course_no
    from enroll
    where s.regno =
  )
)
-- CANT DO THIS = all (select distinct course_no from book_adoption)


--1
select cname
from book_adoption natural join course
group by course_no
having count(book_isbn) > 1

--2
select c.dept
from course c
where course_no in
(select course_no from book_adoption where
book_isbn=(select book_isbn from text where publisher='mcgraw'));
--another answer

select dept
from course NATURAL JOIN book_adoption NATURAL JOIN book_isbn
where publisher = 'mcgraw';
