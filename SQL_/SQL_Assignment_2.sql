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

--4. Get the employee numbers for all employees who didn’t enter their project in 1998.
select emp_no from Works_on where year(enter_date)!=1998

--5. Get the employee numbers for all employees who have a leading job( i.e., Analyst or Manager) in project p1select emp_no,Job from Works_on where (Job='Analyst' or Job='Manager') and project_no='p1'

--6. Get the enter dates for all employess in project p2 whose jobs have not been determined yet.
select enter_date from Works_on where project_no='p2' and Job='NULL'

--7. Get the employee numbers and last names of all employees whose first names contain two letter t’s.
select emp_no,emp_lname from Employee where emp_fname like '%t%t%'

--8. Get the employee numbers and first names of all employees 	--whose last names have a letter o or a as the second character and end with the letters es.select emp_no,emp_fname from Employee where emp_lname like '_[o,a]%es'--9. Get the employee numbers of all employees whose departments are located in Seattle.select e.emp_no,d.[location] from Employee e inner join Department d on e.dept_no=d.Dept_no where d.[location]='Seattle'--10. Find the last and first names of all employess who entered their projects on 04.01.1998select e.emp_fname,e.emp_lname from Employee e inner join Works_on w on w.emp_no=e.emp_no where w.enter_date='1998.01.04'--11. Group all departments using their locations.
select location,Dept_name from Department group by location, dept_name
 --12. Find the biggest employee number.select MAX(emp_no) from Employee--13. Get the jobs that are done by more than two employees.select job from Works_on group by job having COUNT(*)>2 --14. Find the employee numbers of all employees who are clerks or work for department d3.select w.emp_no from Works_on w where w.Job='Clerk' or exists (SELECT e.dept_no FROM Employee e where e.emp_no=w.emp_no and e.dept_no='d3' )-- JoinSELECT e.Emp_no FROM Employee e JOIN Department d ON e.Dept_no = d.Dept_no WHERE d.Dept_name = 'Marketing'
 
--correlated
select * from Department
select * from Employee
 
SELECT emp_no FROM Employee WHERE Dept_no IN ( SELECT Dept_no FROM Department d WHERE d.dept_name = 'Marketing')
 
 
--Insert the data of a new employee called Julia Long, whose employee number is 1111. Her department number is not known yet.
INSERT INTO Employee (emp_no, emp_fname, emp_lname) VALUES (1111, 'Julia', 'Long');
  
--Modify the job of all the employees in project p1 who are managers. They have to work as clerks from now on. 
UPDATE Works_on SET Job = 'Clerk' WHERE project_no = 'p1' AND Job = 'Manager';
 
 
--The budgets of all projects are no longer determined. Assign all budgets the NULL value.
UPDATE project SET Budget = NULL;
 
--Increase the budget of the project where the manager has the employee number 10102. The increase is 10%. 
UPDATE Project SET Budget = Budget * 1.1 WHERE project_no IN (SELECT project_no FROM Works_on WHERE emp_no = 10102 AND Job = 'Manager');
 
--Change the enter date for the projects for those employees who work in project p1 and belong to the department Sales. The new date is 12.12.1998. 
UPDATE Works_on SET enter_date = '1998-12-12' WHERE project_no = 'p1' AND emp_no IN (SELECT emp_no FROM Employee WHERE Dept_no = 'Sales');

--Create a stored procedure to insert data into department and Employee table.
CREATE PROCEDURE sp_InsertDepartmentAndEmployee
@dept_name NVARCHAR(255),
@Location NVARCHAR(255),
@EmployeeName NVARCHAR(255),
@EmployeePosition NVARCHAR(255) 
AS BEGIN 
-- Insert into the department table
INSERT INTO department (dept_name, Location) VALUES (@dept_name, @Location); 
-- Get the department ID of the newly inserted record
DECLARE @DepartmentID INT; 
SET @DepartmentID = SCOPE_IDENTITY(); 
-- Insert into the employee table with the corresponding department ID 
INSERT INTO employee (emp_fname, dept_no) VALUES (@EmployeeName, @DepartmentID);
END;