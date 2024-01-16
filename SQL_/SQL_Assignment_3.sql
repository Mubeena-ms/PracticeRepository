
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


--Sample Table – Bonus
insert into Bonus(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT)
values(1 ,'2016-02-20 00:00:00', 5000),
(2, '2016-06-11 00:00:00 ',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500)

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

-- 1. Fetch  FIRST_NAME  from Worker table using the alias name as <WORKER_NAME>
select FIRST_NAME AS WORKER_NAME from Worker;
 
-- 2. Fetch  FIRST_NAME  from Worker table in upper case
select UPPER(FIRST_NAME) AS FIRST_NAME_UPPER from Worker;
 
-- 3. Fetch unique values of DEPARTMENT from Worker table
select DISTINCT DEPARTMENT from Worker;
 
-- 4. Print the first three characters of FIRST_NAME from Worker table
select LEFT(FIRST_NAME, 3) AS FIRSTNAME from Worker;
 
-- 6. Print the FIRST_NAME from Worker table after removing white spaces from the right side
select RTRIM(FIRST_NAME) AS FIRSTNAME FROM Worker;
 
-- 7. Print the DEPARTMENT from Worker table after removing white spaces from the left side
select LTRIM(DEPARTMENT) AS DEPARTMENT_NO FROM Worker;
 
-- 8. Fetch unique values of DEPARTMENT from Worker table and print its length
select DEPARTMENT, LEN(DEPARTMENT) from Worker GROUP BY DEPARTMENT;
 
-- 9. Print the FIRST_NAME from Worker table after replacing  a  with  A 
select REPLACE(FIRST_NAME, 'a', 'A') AS FIRSTNAME from Worker;
 
-- 10. Print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME
select FIRST_NAME + ' ' + LAST_NAME AS FULLNAME from Worker;
 
-- 11. Print all Worker details from the Worker table order by FIRST_NAME Ascending
SELECT * FROM Worker ORDER BY FIRST_NAME ASC;
 
-- 12. Print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
select * FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;
 
-- 13. Print details for Workers with the first name as  Vipul  and  Satish  from Worker table
select * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish');
 
-- 14. Print details of workers excluding first names,  Vipul  and  Satish  from Worker table
select * from Worker WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');
 
-- 15. Print details of Workers with DEPARTMENT name as  Admin 
select * from Worker WHERE DEPARTMENT = 'Admin';
 
-- 16. Print details of the Workers whose FIRST_NAME contains  a 
select * from Worker WHERE FIRST_NAME LIKE '%a%';
 
-- 17. Print details of the Workers whose FIRST_NAME ends with  a 
select * from Worker WHERE FIRST_NAME LIKE '%a';
 
-- 18. Print details of the Workers whose FIRST_NAME ends with  h  and contains six alphabets
select * from Worker WHERE FIRST_NAME LIKE '_____h';
 
-- 19. Print details of the Workers whose SALARY lies between 100000 and 500000
select * from Worker WHERE SALARY BETWEEN 100000 AND 500000;
 
-- 20. Print details of the Workers who have joined in Feb 2014
select * from Worker WHERE JOINING_DATE >= '2014-02-01' AND JOINING_DATE < '2014-03-01';
 
-- 21. Fetch worker names with salaries >= 50000 and <= 100000
select FIRST_NAME from Worker WHERE SALARY BETWEEN 50000 AND 100000;

--22. Write an SQL query to fetch the no. of workers for each department in the descending order. 
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers FROM worker GROUP BY DEPARTMENT ORDER BY No_Of_Workers DESC;

--23. Write an SQL query to print details of the Workers who are also Managers 
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE FROM Worker W JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID AND T.WORKER_TITLE in ('Manager'); 

--24.Write an SQL query to show the current date and time. 
SELECT gETDATE();

--25.Write an SQL query to show the top n (say 10) records of a table.
SELECT TOP 10*from Worker Order by JOINING_DATE desc