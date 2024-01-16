CREATE TABLE Worker (
WORKER_ID INT PRIMARY KEY IDENTITY(1,1),
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
--Table – Workerinsert into Worker(FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)values('Monika', 'Arora', 100000,'2014-02-20 09:00:00','HR'),('Niharika', 'Verma', 80000, '2014-06-11 09:00:00','Admin'),('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00','HR'),('Amitabh', 'Singh', 500000 ,'2014-02-20 09:00:00','Admin'),
('Vivek', 'Bhati', 500000,'2014-06-11 09:00:00','Admin'),
('Vipul','Diwan' ,200000, '2014-06-11 09:00:00','Account'),
('Satish', 'Kumar', 75000 ,'2014-01-20 09:00:00','Account'),
('Geetika' ,'Chauhan', 90000 ,'2014-04-11 09:00:00','Admin')

select * from Worker

--Sample Table – Bonus
insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT)
values(1 ,'2016-02-20 00:00:00', 5000),
(2, '2016-06-11 00:00:00 ',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500)
select * from Bonus

--Sample Table – Title
insert into Title(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)
values(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst. Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00'),
(6,'Lead','2016-06-11 00:00:00'),
(3,'Lead','2016-06-11 00:00:00')
select * from Title

--1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>. 

--2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case. 

--3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table. 

--4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table. 

--5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table. 

--6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side. 

--7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side. 

--8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length. 

--9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’. 

--10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them. 

--11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending. 

--12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 

--13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table. 

--14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table. 

--15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”. 

--16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

--17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’. 

--18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 

--19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000. 

--20. Write an SQL query to print details of the Workers who have joined in Feb’2014. 

--21. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000. 

--22. Write an SQL query to fetch the no. of workers for each department in the descending order.

--23. Write an SQL query to print details of the Workers who are also Managers 

--24.Write an SQL query to show the current date and time. 

--25.Write an SQL query to show the top n (say 10) records of a table.