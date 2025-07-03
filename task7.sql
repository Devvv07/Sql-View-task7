## Human Resource Management System ##

### Task 7 ###
#create view and Use And Drop 

create table employer(
empid int primary key,
ename varchar(20) not null,
dept varchar(35),
salary bigint);

insert into employer(empid,ename,dept,salary) values
(101,"john","hr",230000),
(102,"vyom","sequal",120000),
(103,"tom","it",200000),
(104,"helly","order management",190000),
(105,"dolly","hr",320000);

#View ---


create view employee_view as
select * from employer;

select * from employee_view;

create view emp_view as
select ename,salary from employer;

select * from emp_view;

create view e_view as
select empid,ename as employee_name,dept,salary as department from employer where salary < 200000;

select * from e_view;

drop view emp_view;

## One or More table retrive data from view using join ---

create table department1(
deptid int not null,
dept varchar(35),
location varchar(20),
empid int,
foreign key(empid) references employer(empid));

insert into department1(deptid,dept,location,empid) values
(111,"it","mumbai",103),
(222,"sequal","delhi",102),
(333,"hr","kolkata",101),
(444,"order management","mumbai",104),
(555,"Quality checker","mumbai",102);

create view report_employees as 
select e.empid,e.ename,e.salary,d.dept,d.location from employer e join department1 d on e.empid = d.empid;

select * from report_employees;

create view report_mumbai as 
select e.empid,d.dept,d.location from employer e join department1 d on e.empid = d.empid where location="mumbai";

select * from report_mumbai;

drop view report_employees;
