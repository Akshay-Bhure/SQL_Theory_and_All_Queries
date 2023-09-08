
                                --  DAY 1

-- data : 

-- database : collection of data
-- large amount of data
-- data quality
-- security
-- concurrency
-- easy and fast search

-- DBMS : database management system 
-- goal :
-- to store and manage the data
-- to read the data for analytics

-- RDBMS : relational database management system
-- structured data
-- in the form of tables/relations

/*
emp : table
emp_id, emp_name, salary,loc    CONTACT    -- columns/fields/attributes/features
1001.   rahul.    60000. pune.  8983720070 -- rows/records

project :
proj_id, proj_name, no_of_emp, emp_id
10.       axis.     20.        1001
*/

-- oracle
-- mysql
-- sql server
-- db2
-- teradata
-- postgreSQL

-- MySQL :
-- database server 
-- user interface : workbench
-- connection

-- SQL : strctured query language
-- domain specific language : only used with relational databases
-- non procedural programming language -- what to do 
-- sql statements is called as QUERY , each query should end with semicolan.
-- syntax
-- non case sensitive language 

-- why data scientist used sql goal 
-- data gathering 

-- Types of commands :
-- DDL (data definition language)    : CREATE,ALTER,TRUNCATE,DROP  -- auto_committed
-- DML (data manipulation language)  : INSERT,UPDATE,DELETE        -- auto_committed
-- DCL (data control language)       : GRANT,REVOKE (DBA)
-- TCL (transaction control language): COMMIT(save),ROLLBACK(undo),SAVEPOINT
-- DQL (data query language)         : SELECT

/*
CUSTOMER   : cust_id,cust_name,ac_no,ac_balance
TRANSACTION: tran_id,tran_type,cust_id
*/

/*
insert
insert
insert
update
commit;
insert
SAVEPOINT A
insert
rollback;
rollback to SAVEPOINT A;
ETL : 1000 : 901 row is wrong : create savepoint at each 200 rows
*/

/*
data     : structured and unstructured data
database : collection of data
DBMS     : database management system
RDBMS    : relational database management system , store the data in the form tables/relations
MySQL    : software which helps us manage the database
SQL      : structured query language :  non case senstive, query ,domain specific 
types of commands :
DDL:-- create,alter,truncate,drop
DML -- insert,update,delete
DCL -- grant,revoke
TCL -- commit,rollback,savepoint
DQL -- select
*/

/*
target :
to store and manage the data
read the data 
get the data into a dataframe
*/


                               -- DAY 2


/*
Target >> 1.Stoar and manage the data
          2.Read the data
          3.Get the data in dataframe
*/

-- Types of commands
/*
1.DDL -  CREATE,ALTER,DROP,TRUNCATE - These are used for define or modifiy the structure
2.DML -  INSERT,UPDATE,DELETE - These are used for insert or modify the data
3.DCL -  GRANT,REVOKE
4.TCL -  COMMIT,ROLLBACK,SAVEPOINT
5.DQL -  SELECT - These are used for read the data.
*/
-- DDL : DDL,DML are used for stoare the data in databse
 -- databases : database : tables : rows and columns
 
 -- create database 
 -- create database database_name;
 create database ab_base;
 
 -- use database_name; whatever query we have witten it will be effect in this database like column create column insert 
 use ab_base;
 
 -- create table >> new table will be create in this
-- create table table_name (column1 datatype,column2 datatype); table defination
/*
table : emp
emp_id, emp_name, salary,loc   
*/
create table ab_base.emp ( emp_id int,emp_name varchar(10),salary int,location varchar(20));
 
 -- describe table
-- desc table_name; with this command we will see structural details alredy present inside a table
 desc emp;
 show databases; -- it will show all available databases
 show tables; -- it will show all available tables
 
 -- ALTER : used to modify the structure of existing database objects
-- add column
-- modify datatype or size
-- rename column
-- rename table
-- remove column
-- add constraints : rules on the data

-- 1. add column
/*
emp : table
emp_id, emp_name, salary,loc,contact   
*/

-- ALTER TABLE table_name ADD COLUMN column_definition; it will add at last position of column
alter table emp add column contact int;

-- row_id >> at first position
alter table emp add column row_id int first;

-- GENDER after emp_name
alter table emp add column gender char(1) after emp_name;

-- for multiple columns add a a one time
alter table emp add column gender char(1),add column row_id int first,add column contact char(20) after amp_name;


desc emp;

 -- varchar(size): alphanumeric values, variable length, varchar(10), neha
-- char(size)   :   alphanumeric values ,variable fixed length,char(10),neha

-- 2. modify column >> we cam modify its datatype
-- ALTER TABLE table_name MODIFY COLUMN new_column_definition;
alter table emp modify column contact varchar (10),MODIFY COLUMN emp_name varchar(15);
 
 -- 3. rename column and rename table
-- ALTER TABLE table_name RENAME COLUMN old_column_name to new_column_name;
alter table emp rename column contact to contact_info;
alter table emp rename to emp_info;
-- alter database ab_base rename to _base1; -- we cant rename database name

-- 4. remove column
-- ALTER TABLE table_name DROP COLUMN column_name;
alter table emp_info drop column row_id;
alter table emp_info drop column contact_info, drop column gender;

-- TRUNCATE: delete entire data from table
-- truncate table table_name;
truncate table emp_info;
truncate table ab_base.emp_info; -- if we didnt apply use database so need to give database_name.table_name
 
 -- DROP : delete data as well as structure
-- drop table table_name;
drop table emp_info; -- we have droped whole table

-- drop database db_name; we have droped hole database
drop database ab_base;

-- DML : insert, update,delete
-- DQL : select 

-- CRUD : create data(insert) ,read(select ) ,update(update), delete(delete) >> combination of DML and DQL

-- insert data
-- db_test database

/*
student:
rollno, stud_name,gender, cgpa, branch
*/

create database test_data;
use test_data;
create table students(rollno int,stud_name varchar(10),gender char(1),cgpa int, branch varchar(20));
desc students;


-- insert into table_name (column names) values (set of values);

-- we can insert data with column names and its values as well like below example
insert into students (rollno,stud_name,gender,cgpa,branch) values (101,'rahul','M',9,'entc');

-- we can only  give values of columns bcz we have alredy mentioned the column names
insert into students  values (102,'rohit','M',8,'comp');

-- if we dont have column value that time we can give null word but remember we have to give same no.of values which we have columns else it will give error
insert into students  values (103,'akash','M',null,'comp');

-- else if we dont have any column value then we can drop that column and then we can give values and athe place of cgpa null automatic will come
insert into students (rollno,stud_name,gender,branch) values (104,'neha','F','entc');

-- at a time we can add multiple different values of our column
insert into students values(105,'dhiraj','M',6,'comp'),
                           (106,'nilesh','M',7,'comp');

-- READ DATA
-- * reperesents all columns
-- from clause is used to specify a data source
select * from students; -- all columns , all rows
select roll_no,stud_name from students; -- specific columns , all rows

-- all columns of specific rows
-- where clause : used to access a set of rows based on a condition
select * from students where branch='comp'; -- all columns, specific rows
-- a=b,c

-- specific columns of specific rows
-- select column_names from table_name where condition; 
select rollno from students where cgpa IS NOT NULL;


/*
= : equal to
!= : not eqaul to
> : greater than
>=: greater than equal to
<: less than
<=: less than equal to
IN : used to specify multiple possible values 
NOT IN : used to if specific values are not in column or rows
BETWEEN : used to give a range of values, start value and end value
NOT BETWEEN : used to give a range of values, where it will not between start value and end value
IS NULL : to check for null values 
IS NOT NULL : used to if specific values are not null values in column or rows

*/

select * from student;
select * from students where cgpa>7;
select * from students where rollno IN (101,103,108);
select * from students where rollno NOT IN (101,103,108);
select * from students where cgpa BETWEEN 7 and 9;
select * from students where cgpa NOT BETWEEN 7 and 9;
select * from students where cgpa IS NULL;
select * from students where cgpa IS NOT NULL;
select cgpa from students where cgpa!=7;


-- all columns ,all rows            : select * from table_name;
-- specific columns of all rows     : select column_names from table_name;
-- all columns of specific rows     : select * from table_name where condition;
-- specific column of specific rows : select column_names from table_name where condition;

/*
DDL : create,alter ,truncate,drop
-- create : create database and related objects>> related objects means tables and views
create database db_name;
create table table_name (columns datatype);

-- alter : used to modify table structure
alter table table_name add column/modify column/rename column/drop column column_definition;

-- truncate: to delete entire data
truncate table table_name;

-- drop : delete data as well as structure
drop table table_name;
drop database db_name;

-----------------------
CRUD : create,read,update, delete
insert : to insert data in a table
insert into table_name (column names) values (set of values);

-- read data :
select 
*/


                               -- Day-3
                               
/*
CRUD : create data,read data,update,delete

create >> insert 
insert into table_name (columns) values (set of values),
										(set of values);
*/
-- read data 
select * from autos_dataset;
select symboling,make from autos_dataset;
select * from autos_dataset where make='audi';
select aspiration,make from autos_dataset where stroke=3.4;
alter table autos_dataset rename to data1;
 select * from data1;

-- <,>,<=,>=,IN,NOT IN, BETWEEN,NOT BETWEEN, IS NULL,IS NOT NULL
 
use test_data;
desc students;


select * from students;
select * from students where roll_no in (102,104,106);
select * from students where roll_no not in (102,104,106);
select * from students where cgpa between 7 and 9; -- <= and <=
select * from students where cgpa not between 7 and 9; 

select * from students where branch is null;
select * from students where branch is not null;

select * from students where cgpa is null;

select * from students; 
 
 -- and & or :
-- AND : all the conditions specified should be satisfied by a row
-- OR  : either of the condition should be satisfied

 select * from students where roll_no=102 and roll_no=104;
 select * from students where roll_no=102 and stud_name='Rahul';
 select * from students where roll_no=102 and roll_no=105;
 select * from students where roll_no=102 and stud_name='rohit';
 select * from students where branch='comp' and cgpa is null;

select * from students where roll_no is null or stud_name is null or gender is null or cgpa is null;

-- UPDATE :
-- update table_name set column_name= new value;
-- branch='mech'
 update students set branch='mech';
 update students set branch='computer' where roll_no in (102,103);
 
 -- add new column name of column >> internships
alter table students ADD COLUMN internships int;
update students set internships=2;

-- case statement:
-- roll no 101 intenships no 2,
       --  103               1,
	   --  104               3

 update students set internships=
 case roll_no
 when 101 then 2
 when 103 then 1
 when 105 then 3
else internships
end;
 
 select * from student; 
update students set internships=
case roll_no
when 101 then 2
when 103 then 1
when 104 then 3
end; -- if we not give else statement then it will update null values to all the other column names

update students set internships=
case roll_no
when 101 then 2
when 103 then 1
when 104 then 3
else 0
end;

-- DELETE :
-- select * from table_name;
-- delete from table_name;

delete from students;
delete from students where stud_name='dhiraj';
 
delete from students; -- delete entire data
delete from students where roll_no=106;

truncate table students; -- delete entire data and we can not add where condition here and it is faster than delete
drop table students; -- delete entire data and delete table structure as well
 select * from students; 
 
 
-- CONSTRAINTS : rules/limitations those are used for managing the data in database
-- unique,not null, primary key, foreign key,check, default,auto_increment

-- unique : restrict the entry of duplicate values,null are allowed

 create table emp_det (emp_name char(10) unique,emp_id int,bank_details varchar(18));
 desc emp_det;
 use emp_det;
insert into emp_det values('Rahul',1001,null);
select * from emp_det;

insert into emp_det values(null,5,12);
insert into emp_det values('Rahul',1004,null);
insert into emp_det values('Rahul',1004,null); -- it gives error bcz duplicate emp_id
select * from emp_det;

alter table students modify column roll_no varchar(8) UNIQUE;
desc students;
select * from students;

alter table students drop index roll_no; -- removing the unique constraint from applied column



-- NOT NULL: restrict the entry of null values duplicates allowed

create table emp_nn(empid int NOT NULL,empname varchar(10),cgpa int NOT NULL);
DESC emp_nn;
insert into emp_nn values(1001,'rahul',9);
select * from emp_nn;
insert into emp_nn (empname) values('rahul');
insert into emp_nn values(1002,'rahul',null);

alter table students modify column roll_no int NOT NULL;
DESC students;

alter table students modify column roll_no int; -- removing the not null constraint from applied column

-- PRIMARY KEY : resrtict null as well as duplicate values
-- we can apply only one primary key in one table means from whole column names in table we apply any one column name primery key
-- PRIMARY KEY (EMPID,EMPNAME)
-- ADD : COSNTRAINT CONSTRAINT_NAME PRIMARY KEY (EMPID,EMPNAME)
-- null ,rahul
-- 1002,null
-- null,null -- not allowed
-- rahul,rahul -- not allowed
-- 1001 ,rahul
-- 1001,rohit

create table emp_pk (empid int PRIMARY KEY, emp_name varchar(10)); -- ,CONSTRAINT cons_name primary key (empid,empname)
create table emp_pk (empid int, emp_name varchar(10),CONSTRAINT cons_name primary key (empid,empname));  -- at a time we are adding primery key on two joint table
DESC emp_pk;
insert into emp_pk values(1001,'rohit');
select * from emp_pk;
insert into emp_pk values(1001,'rohit');
insert into emp_pk values(null,'rohit');

alter table students modify column roll_no int PRIMARY KEY ;
desc students;

alter table students DROP PRIMARY KEY; -- removing the primary key constraint from applied column


create table emp_test (empid int unique not null,empname varchar(10) unique not null); -- on seperate column we can apply all constraint many times only except primery key
desc emp_test;

use test_data;
desc students;
select * from students;
insert into students values(104 ,'aksh','M',9.0,'chemical',1);
insert into students values(101,'anita','F',8.0,'chemical',1);
delete from students where roll_no=106;

-- FOREIGN KEY : it is used to maintain referential integrity
-- referential integrity means >> foreign keys are used to define a relation between different database table
-- foreign key column can have duplicate entries
-- following kind of relation can say that one to many
-- if we define foreign key we can not delete anything from parent table as well
-- so in this case we have to delete from child class then we can delete from parent class bcz to maintain data consistency
-- whichever column we have set as a  primery key and foeign key, only those from primary key column values should have in foreign key column 
/*
student                                     course
rollno  stud_name  branch.                 course_id  course_name   rollno
101     rahul      entc                     10        data science   101
										    20        java           101
rollno: primery key						    rollno :  foreign key
parent table	                            child table
*/


                                       -- day-4

/*
unique     : restricts the dups
not null.  : restricts the null values
primary key: not null + unique 
foreign key: to maintain the referential integrity

student                          course
rollno,stud_name,cgpa            course_id ,course_name  ,roll_no
101     rahul.   7.                1.       data science.  101
rollno: pk                        roll_no : fk

*/


alter table students drop primary key;

drop table course;

alter table students modify column roll_no int PRIMARY KEY;
create table course(course_id int,course_name varchar(10),roll_no int,
FOREIGN KEY (roll_no) references students(roll_no));

alter table courses modify column student_name varchar(10) foreign key (student_name) references students(student_name);

SELECT * from students;

create table course(course_id int,course_name varchar(10),roll_no int,
FOREIGN KEY (roll_no) references students(roll_no)
on delete cascade
on update cascade
);
-- cascade means reflect the changes in all the related objects

SELECT * from students;

insert into course values(1,'testing',102);
select * from course;

-- can not insert a value in child table which is not present in parent table
insert into course values(1,'testing',106);

-- can not delete a parent table's value which is already there in child table
delete from students where roll_no=101;

-- we can delete a parent table's value which is already there in child table so first need to delete from child class
delete from course where roll_no=101;
delete from students where roll_no=101;

create table course(course_id int,course_name varchar(10),roll_no int,
FOREIGN KEY (roll_no) references students(roll_no)
on delete cascade
on update cascade);

insert into course values(1,'testing',103);
update students set roll_no=103 where roll_no=108; -- also update from course table as well
delete from students where roll_no=108; -- also delete from course table as well

select * from students;
select * from course;

alter table course drop foreign key course_ibfk_1; -- droping foreign key constraint course_ibfk_1 is constraint name
show create table students; -- we ca see constraint name with this query

--     check

-- CHECK: Check for a condition before inserting data in a table
create table emp_chk (empid int,emp_name varchar(10),empage int,CHECK(empage>20));

insert into emp_chk values(1001,'rahul',25);
select * from emp_chk;
insert into emp_chk values(1001,'rahul',18);

select * from students;
desc students;
alter table students modify column gender char(1) check (gender in ('m','f'));
insert into students (gender) values ('d');
insert into students (roll_no,gender) values (null,'d');

insert into students (roll_no,gender) values (101,'d');

-- alter table students drop constraint constraint_name;
show create table students; -- we can check constraint name
alter table students drop constraint students_chk_1; -- droping check constarint


alter table students drop primary key;
insert into students (roll_no,gender) values (101,'d');
select * from students;

-- DEFAULT :  used to set a default value for any column
create table emp_dflt (empid int, empname varchar(10),dept_name varchar(10) DEFAULT 'bench');
insert into emp_dflt values(1001,'rahul','tech');
select * from emp_dflt;
insert into emp_dflt (empid,empname) values(1002,'rohit');

select * from students;
alter table students modify column branch varchar(20) DEFAULT 'comp'; -- either modify column or only modify we can use like down line syntax
alter table students modify branch varchar(20) DEFAULT 'comp';
insert into students (roll_no,stud_name,gender,cgpa) values (106,'nita','F',5);

-- following syntax is for droping 'deafault' constraint or we can use same below syntax for droping another constraint
alter table students alter branch drop default; -- droping deafault constraint

-- AUTO_INCREMENT : increments a value by 1 for each new insertion
-- there is one rule we can use only one time auto increment in our table and with auto increment construnt we have to give any constraint
create table emp_auc (empid int AUTO_INCREMENT PRIMARY KEY,empname varchar(10));
use emp_auc;

INSERT INTO emp_auc (empname) values('rahul');
select * from emp_auc;
INSERT INTO emp_auc (empname) values('rahul');

alter table emp_auc auto_increment=100;
INSERT INTO emp_auc (empname) values('rahul');

-- alter table table_name modify column column_name data_type: -- removing auto_increment constraint
alter table emp_auc modify column empname varchar(10); -- droping the constraint

-- CLAUSES :  clauses are used for reading the data in different ways
-- 1.order by >> at the end
-- 2.limit >> use after order by at the end
-- 3.distinct >> use after slect distinct * or distinct column name
-- 4.count >> atfter select or after column name

-- 5.aggrigate functions >> min,max sum,avg,count >> use after select
-- 6.group by >> use at the end
-- 7.having >> use after group by at the end

-- final we can say that we always write following sequence if we use all the query at a time
-- distinct >> count >> aggrigate functions
-- group by >> having >> order by >> limit

-- ORDER BY : sort the data
-- default sort order is ascending
-- ascending or descending

select * from emp order by dept_name; -- by deafault ascending order readin
select * from emp order by dept_name desc; -- decending order 

-- desc table_name : describe table
-- order by desc   : descending sort
select * from emp order by dept_name,salary;

-- IT dept emp in desc salary order
select * from emp where dept_name='IT' order by salary desc;

-- DISTINCT : fetch unique values from a column
select distinct dept_name from emp;
select * from emp;

select distinct salary from emp;
select distinct dept_name from emp;
select * from emp;


-- unique records from table
/*
101,mohan,admin,4000
101,mohan,admin,4000
*/
select distinct * from emp;


-- LIMIT : limits the no of rows in the output
-- limit offset >> no of rows to read
-- offset : no of rows to skip from top,default offset value is 0

-- read top 5 rows of output
select * from emp limit 0,5;
select * from emp limit 5;

-- skip top 2 rows and read 5 rows after that
select * from emp limit 2,5;

-- read rows from 10 to 15
select * from emp limit 9,6;

-- read rows from 16 to 25
select * from emp limit 15,10;

-- 10th row
select * from emp limit 9,1;

-- second highest salary
select * from emp order by salary desc;
select * from emp order by salary desc limit 1,1;

-- third highest salary
select * from emp order by salary desc limit 2,1; -- it is not working when duplicates numbers are available
select distinct salary from emp order by salary desc limit 2,1;

-- nth highest salary   >>this question would be asked in interview
-- select distinct salary from emp order by salary desc limit n-1,1;
-- select distinct salary from emp order by salary desc limit n-1,1;

-- aggregate functions : those functions which we can perform on group of data its called aggrigate functions
-- min,max,avg,sum,count
select * from emp;
select min(salary),max(salary),sum(salary),avg(salary),count(salary) from emp;

-- count: it shows total no of rows in the table
select count(*) from emp; -- total no of rows
select count(1) from emp; -- total no of rows
select count(emp_id) from emp; -- count of total non null values in that specified column

select * from students;
select count(1) from students;
select count(roll_no) from students;
select count(stud_name) from students;

alter table students drop column internships;
insert into students values(101,'rahul','M',8,'comp');
insert into students values(102,null,'M',8,'comp');
select count(stud_name) from students;
select * from students;

alter table students drop primary key;
drop table course;
desc students;
alter table students modify column roll_no int ;

insert into students values(null,null,null,null,null);
select * from students;

--  set sql_safe_updates=0; -- for removing error of reject updated and delete with no restrictions
-- `any column name` -- this will help us to rename any column name or read any column who have special
--  characteristics or space between column name. like data-science,data science,data*science
-- simply we have to give that column name in backticks (``) backticks is above the tab button at keyboard

                                              -- Day-5
									
-- order by : sort the data
-- distinct : to fetch unique values
-- limit    : to limit the no of rows in output

-- aggregate functions: min,max,sum,avg,count
use test_data;
desc movies;
select * from movies;

-- avg budget of movies released during normal days
select avg(`budget(inr)`) from movies where `release period`='normal';
alter table movies rename column `budget(inr)`to budget; -- renamed the column for easy to write the query
select avg(budget) from movies where `release period`='normal';
-- budget(inr) : `budget(inr)`

-- count total no of screens where drama movies were released
select sum(`number of screens`),count(`number of screens`) from movies where genre='drama';

select * from placement;
drop table placement1,placements,student_marks; -- at a time many columns droping
-- calculate avg cgpa of mech students
select avg(cgpa) from placement where branch='mechanical';

-- count of all students
select count(*) from placement;

-- list of students who has cgpa>5, does not have any backlog and have done atleast 1 internship
select * from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0;

-- count of these students above
select count(*) from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0;  -- 1293

-- branchwise count
select distinct branch from placement;

select count(*) from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0
and branch='civil';

select branch,count(*) from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0
group by branch;  -- group by always add after where condition and group by working is it to creating groups of specified condition or columns
-- and whichever column we have mention in group by only that column name we can put after select statement
select * from placement order by branch; -- order by working is for creating orderwise columns or any other specified condition it could be ascending or descending
 
select branch,count(*),avg(cgpa) from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0
group by branch;  -- 1293

-- fetch max salary from each dept
select dept_name,max(salary),count(*) from emp group by dept_name;

-- fetch only groups where count of students >150
select branch,count(*),avg(cgpa) from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0
group by branch
having count(*)>150;  -- maximum times having used on aggrigated values

-- count of placed and non placed students
select branch,count(*),avg(cgpa) from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0
group by branch;

select * from placement;

select branch,placedornot,count(*),avg(cgpa) from placement 
where cgpa>5 
and historyofbacklogs=0
and internships>0
group by branch,placedornot
order by branch; -- order by used after group by

select * from student_mark;
-- percentage of each student
-- sum(marks)/sum(out_of)*100

select rollno,sum(marks)/sum(`out of`)*100 from student_mark group by rollno;

-- avg budget ,avg revenue of aamir khan released during holidays and normal days both
select * from movies;
select budget,`revenue(inr)` from movies where `lead star`='aamir khan' and
`release period`= 'holiday';
select `release period`,avg(budget),avg(`revenue(inr)`) from movies where `lead star`='aamir khan' group by 
`release period`order by `release period` desc;

-- SUBQUERIES : query within query 
-- select: select outer query ( select inner query )  >> called subqueries
-- create
-- insert
-- scalar subquery : in scalar subquery inner query will return a single value
-- MULTIROW SUBQUERIES : inner query returns more than one value


-- fetch the details of emp having max salary
select * from emp;
select max(salary) from emp;
select * from emp where salary=10000;

-- scalar subquery : in scalar subquery inner query will return a single value

select * from emp where salary=(select max(salary) from emp);

-- second highest salary using max function
/*
90
90
80  -- second highest
70
60
50
*/

select distinct salary from emp order by salary desc limit 1,1;

select * from emp where salary=(
select max(salary) from emp where salary <(select max(salary) from emp));

-- details of an emp having 5th highest salary 
select * from emp where salary=(
select distinct salary from emp order by salary desc limit 4,1);

-- fetch the name and salary of emp where salary> avg salary of all emp
select * from emp_data;
-- avg salary of all emp
-- name and salary of emp having salary> above output

select fname,salary from emp_Data where salary>(
select avg(salary) from emp_data);

-- list the emp from dept_id 30 having salary > avg salary of emp from dept id 20
select * from emp_data;

-- avg salary of emp from dept id 20
-- compare it with salaries of emp from dept_id 30

select * from emp_data where dept_id=30 and 
salary>(
select avg(salary) from emp_data where dept_id=20);

select * from movies;
-- fetch a movie name which has min budget and max revenue
-- min budget
-- max revenue
-- a movie name satisfying both of the above filters

select * from movies where budget=(select min(budget) from movies);
select * from movies where `revenue(inr)`=(select max(`revenue(inr)`) from movies);

select `movie name` from movies 
where budget=(select min(budget) from movies)
and `revenue(inr)`=(select max(`revenue(inr)`) from movies);

select `movie name` from movies 
where budget=(select min(budget) from movies)
or `revenue(inr)`=(select max(`revenue(inr)`) from movies);

select * from emp_data;
select * from dept;

-- MULTIROW SUBQUERIES : inner query returns more than one value

-- fetch emp ids from emp_data table which are not present in dept table
select empid from emp_data where empid NOT IN (
select distinct empid from dept);

-- fetch a movie name ,genre,star rating if star rating= max star rating of either of the genre
select * from movies;

-- max star rating for each genre
-- star rating of all movies with the above output

-- ROLLNO=101,102,103
select `movie name` from movies where star_rating IN ( 
select max(star_rating) from movies group by genre);

Select * from paintings; -- id,painting_name,artist_id,listed_price
select * from artists; -- id,fname,lname
select * from sales;  -- id,painting_id,artist_id,colelctor_id,sales_price

-- select an artist name who have sold atleast one painting in gallery

select * from artists where id IN(
select distinct artist_id from sales);

-- artist name who have not sold anything

select * from artists where id NOT IN(
select distinct artist_id from sales);

select * from dept;
-- fetch the count of emp from each dept who needs to travel as well as do not need to travel
select dept_name,travel_required,count(*) 
from dept 
group by dept_name,travel_required
having count(*)>5
order by dept_name;

-- fetch the count of emp from each dept who needs to travel

select dept_name,count(*) 
from dept 
where travel_required='yes'
group by dept_name
having count(*)>5
order by dept_name;



                                                       -- Day-6

use stud_data; 

-- JOINS : combines the data from multiple tables
/*
inner join/join.           : common records from both the tables
left join/left outer join  : all records from left table and only matching from right table
right join/right outer join: all records from right table and only matching from left table
full join/full outer join  : right join + left join

a right join b : a is the left table and b is the right table
*/
select emp_id,emp_name from emp;

-- INNER JOIN :
select * from tbl1;
select * from tbl2;

select * from tbl1 INNER JOIN tbl2 ON tbl1.col1=tbl2.col2;
select tbl1.* from tbl1 JOIN tbl2 ON tbl1.col1=tbl2.col2;

select * from students;
select * from course;

select * from students inner join course on students.roll_no=course.roll_no;

select students.roll_no,course.roll_no,stud_name,course_name
from students 
inner join course 
on students.roll_no=course.roll_no;

-- LEFT JOIN :
select * from tbl1 LEFT JOIN tbl2 ON tbl1.col1=tbl2.col2;
select tbl2.*,tbl1.* from tbl1 LEFT JOIN tbl2 ON tbl1.col1=tbl2.col2;

select *
from students 
left join course 
on students.roll_no=course.roll_no;

select students.roll_no,course.roll_no,stud_name,course_name
from students 
left join course 
on students.roll_no=course.roll_no;

-- RIGHT JOIN :

select * from tbl1 RIGHT JOIN tbl2 ON tbl1.col1=tbl2.col2;

select *
from students 
right join course 
on students.roll_no=course.roll_no;

select students.roll_no,course.roll_no,stud_name,course_name
from students 
right join course 
on students.roll_no=course.roll_no;

-- union and union all : append the result sets
-- Rules
-- same number of columns in all select statements
-- same datatype should be all the columns
-- sequense of columns should be same

select col1 from tbl1
union all -- it adds all records from tbl1 and tbl2 even duplicates presents
select col2 from tbl2;
-- 10 + 5 == 15

select col1 from tbl1
union -- it adds only those records which are not duplicates
select col2 from tbl2;
-- 10 + 5 (3) = 10 + 5-3=12

select roll_no,stud_name from students
union 
select roll_no,course_name from course; 


select stud_name,roll_no from students
union all
select roll_no,course_name from course; -- here sequense is not same so will get error

               -- full join :

select * from tbl1 RIGHT JOIN tbl2 ON tbl1.col1=tbl2.col2
union all
select * from tbl1 LEFT JOIN tbl2 ON tbl1.col1=tbl2.col2;


select * from tbl1 RIGHT JOIN tbl2 ON tbl1.col1=tbl2.col2
union
select * from tbl1 LEFT JOIN tbl2 ON tbl1.col1=tbl2.col2;

use test_data;
select students.roll_no,course.roll_no,stud_name,course_name
from students
right join course 
on students.roll_no=course.roll_no -- on basis of roll number we join the tables
union 
select students.roll_no,course.roll_no,stud_name,course_name
from students
left join course 
on students.roll_no=course.roll_no; -- on basis of roll number we join the tables

select students.roll_no,stud_name,course_name
from students
right join course 
on students.roll_no=course.roll_no -- on basis of roll number we join the tables
union 
select students.roll_no,stud_name,course_name
from students
left join course 
on students.roll_no=course.roll_no; 


-- all emp,their dept names, mgr names and proj names

select * from manager;

select emp_id,emp_name,dept_name,mgr_name,proj_name
from employee e -- alias for table we changed employee name to e
left join 
department d
on e.dept_id=d.dept_id -- on basis on employee department id  and department id we join tables
left join 
manager m
on e.mgr_id=m.mgr_id -- on basis on employee manager id  and manager id we join tables
left join 
project p
on e.emp_id=p.team_member_id;  -- on basis on employee id  and project team member id we join tables


-- a join b and b join c
-- a join b and a join c


                                                 -- Day-7

-- FETCH TOTAL AMOUNT OF SALES FOR EACH ARTIST AND HIS NAME WHO HAS SOLD AT LEAST ONE PAINTING IN GALLERY

select * from sales;
select * from artists;

select * from artists 
inner join 
(select artist_id,sum(sales_price) as total_sales from sales group by artist_id) sq
on artists.id=sq.artist_id;

-- self join : joining a table with itself
select * from emp_data;

-- employees who are managers
select e.empid,d.fname,e.lname,e.mgr_id from 
emp_data e
inner join 
emp_data d
on e.empid=d.mgr_id;


-- FETCH TOTAL AMOUNT OF SALES FOR EACH ARTIST AND HIS NAME WHO HAS SOLD AT LEAST ONE PAINTING IN GALLERY
-- total amount of sales for each artist

select * from artists
INNER JOIN
(select artist_id,sum(sales_price) from sales group by artist_id) sq
ON artists.id=sq.artist_id;

-- Window functions/analytical functions : aggrigate functions can be used as a windows functions

/* over >> it simply over a value on different columns as per given conditions and also partition by use for same column values used for 
row_number(): assignes a seqeunce value to each row assigned value will be table value
row_number(partition by column_name): assignes a seqeunce value to each row assigned value will be column_name
rank(order by column_name)      : ranks the rows with gaps
dense_rank(order by column_name): ranks the rows without gaps 
lead(column_name,offset,default): fetch the value from opreceding row
lag(column_name,offset,default) : fetch the value from privious row
*/

select max(salary) from emp;
select dept_name,max(salary) from emp group by dept_name;

select salary,salary+100,salary-100,salary*0.25 from emp;
select dept_name,max(salary) over() from emp;

select emp_id,emp_name,dept_name,salary,max(salary) over () from emp;
select emp_id,emp_name,dept_name,salary,
max(salary) over (partition by dept_name),
min(salary) over (partition by dept_name) from emp;

-- row_number(): assign a sequence number to each row of the partition
select emp_id,emp_name,dept_name,salary,row_number()over()from emp;
select emp_id,emp_name,dept_name,salary,
row_number() over (partition by dept_name order by salary) from emp;

-- fetch first 2 emp to join the company from each dept (consider min emp id is the oldest emp)

select dept_name,min(emp_id) from emp group by dept_name;
/*
'Admin','101'
admin.   105
'HR','   102'
HR.      106
'IT',   '103'
IT.      107
'Finance','104'
finance.  108
*/

select * from (
select emp_id,emp_name,dept_name,salary,
row_number() over (partition by dept_name order by emp_id) rn
from emp ) sq
where rn<3;

select salary,salary+100,salary-100,salary*0.25 per_sal from emp
where salary*0.25>1000;
-- where per_sal>1000;

-- rank and dense_rank
-- rank : ranks the rows with gaps
-- dense_rank : rank the rows without gaps

select *,rank() over (order by salary) rnk,
dense_rank() over (order by salary) dense_rnk from emp;

select *,
row_number() over (partition by dept_name order by  salary ) rn,
rank() over (partition by dept_name order by salary ) rnk,
dense_rank() over (partition by dept_name order by salary ) dense_rnk from emp;

-- fetch top 3 emp from each dept earning the max salary

select * from (
select *,
dense_rank() over (partition by dept_name order by salary desc) dense_rnk from emp) dr
where dense_rnk<4;

-- even number of rows from a table
select * from (
select emp_id,emp_name,dept_name,salary,
row_number() over () as  rn          -- as keyword give or dont give no matter. 
from emp ) sq
where rn%2=0;

-- odd number of rows
select * from (
select emp_id,emp_name,dept_name,salary,
row_number() over () as rn
from emp ) sq
where rn%2!=0;

-- lead and lag :
-- lead(column_name,offset,default) : fetch the value of a column from next row
-- lag(column_name,offset,default)  : fetch the value of a column from previous row

select *,
lead(salary) over () as next_sal,
lag(salary) over () as priv_sal
from emp;

select *,
lead(salary,2) over () as next_sal,
lag(salary,2) over () as priv_sal
from emp;

select *,
lead(salary,2,0) over () as next_sal,
lag(salary,2,0) over () as priv_sal
from emp;

select * from cars;
-- fetch the distance travelled by each car per day
select *,
distance_travlled-lag(distance_travlled,1,0) over (partition by cars) as dis_per_day
from cars;



                                                        -- Views
                                                        
select emp_id,emp_name from emp;

create view emp_view as select emp_id,emp_name from emp;
select * from emp_view;

insert into emp (emp_id,emp_name) values (122,'Akshay');
select emp_id,emp_name from emp;
select * from emp_view;

delete from emp where emp_id=122;
select emp_id,emp_name from emp;
select * from emp_view;

update emp set emp_id=121 where emp_id=101;
select emp_id,emp_name from emp;
select * from emp_view;

delete from emp_view where emp_id=121;
select * from emp_view;
select emp_id,emp_name from emp;

create view emp_n1 as select distinct emp_id,emp_name from emp;
insert into emp (emp_id,emp_name) values (122,'Akshay');
select emp_id,emp_name from emp;
select * from emp_n1;

delete from emp_n where emp_id=122;   -- we cant delete the views which we have creted with the help of clause 