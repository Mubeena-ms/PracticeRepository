--Department table
create table Department(
Dept_no char(5) not null Primary key,
Dept_name varchar(30) not null,
[location] varchar(30)
)
insert into Department values('d1', 'Research', 'Dallas')
insert into Department values('d2', 'Accounting', 'Seattle')
insert into Department values('d3', 'Marketing', 'Dallas')
select * from Department

--Employee table
create table Employee(
emp_no char(5) not null Primary key,
emp_fname varchar(30) not null,
emp_lname varchar(30),
dept_no char(5) not null foreign key references Department(dept_no) 
)

insert into Employee values('25348', 'Matthew', 'Smith', 'd3')
insert into Employee values('10102', 'Ann', 'Jones', 'd3')
insert into Employee values('18316', 'John', 'Barrimore', 'd1')
insert into Employee values('29346', 'James', 'James', 'd2')
insert into Employee values('2581', 'Alen', 'James', 'd3')
insert into Employee values('9031', 'Manoj', 'James', 'd1')
insert into Employee values('28559', 'Hani', 'Ziya', 'd2')
select * from Employee


--Project table
create table Project(
project_no char(5) not null Primary key,
project_name varchar(30) not null,
Budget varchar(15)
)

insert into Project values('p1','Apollo','120000')
insert into Project values('p2','Gemini','95000')
insert into Project values('p3','Mercury','185600')
select * from Project

--Works_on table
create table Works_on(
emp_no char(5) not null foreign key references Employee(emp_no),
project_no char(5) not null foreign key references  Project(project_no),
Job varchar(30),
enter_date date
)

insert into Works_on values('10102','p1','Analyst','1997.10.1')
insert into Works_on values('10102', 'p3', 'manager', '1999.1.1')
insert into Works_on values('25348', 'p2', 'Clerk', '1998.2.15')
insert into Works_on values('18316', 'p2',' NULL', '1998.6.1')
insert into Works_on values('29346', 'p2', 'NULL', '1997.12.15')
insert into Works_on values('2581', 'p3', 'Analyst','1998.10.15')
insert into Works_on values('9031', 'p1', 'Manager','1998.4.15')
insert into Works_on values('28559', 'p1', 'NULL','1998.8.1')
insert into Works_on values('28559', 'p2', 'Clerk','1992.2.1')
insert into Works_on values('9031', 'p3', 'Clerk','1997.11.15')
insert into Works_on values('29346', 'p1', 'Clerk','1998.1.4')


--1. Get all row of the works_on table.
select * from Works_on

--2. Get the employee numbers for all clerks
select emp_no from Works_on where Job='Clerk'

--3. Get the employee numbers for employees working in project p2, and having employee numbers smaller than 10000.
select emp_no from Works_on where project_no='p2' and emp_no<10000

--4. Get the employee numbers for all employees who didn�t enter their project in 1998.
select emp_no from Works_on where year(enter_date)!=1998

--5. Get the employee numbers for all employees who have a leading job( i.e., Analyst or Manager) in project p1

--6. Get the enter dates for all employess in project p2 whose jobs have not been determined yet.
select enter_date from Works_on where project_no='p2' and Job='NULL'

--7. Get the employee numbers and last names of all employees whose first names contain two letter t�s.
select emp_no,emp_lname from Employee where emp_fname like '%t%t%'

--8. Get the employee numbers and first names of all employees 
select location,Dept_name from Department group by location, dept_name
 