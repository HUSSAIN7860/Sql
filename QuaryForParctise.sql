CREATE TABLE Worker (
	WORKER_ID int NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY int,
	JOINING_DATE CHAR(25),
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE char(25),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM CHAR(25),
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');


 Select * from Worker ,Title ,Bonus



 -- Question 1.
 --1. Write an SQL query to fetch the list of employees with the same salary.
 select 
 FIRST_NAME , LAST_NAME , SALARY  from Worker
 where salary in (
 select salary from Worker 
 group by SALARY
 having count(*) >1)


 -- Question 2.
 --2. Write an SQL query to show the second highest salary from a table.
 Select FIRST_NAME , Last_name , SALARY from worker where SALARY = (
 select max(salary)
 from Worker
 where  SALARY <> (select max(salary) from Worker) 
 )


 -- Question 3.
 -- 3. Write an SQL query to fetch the first 50% records from a table.
 select
 top(select count(First_name)/2 
 from Worker)First_name from worker


 -- Question 
 -- 4. Write an SQL query to show all departments along with the number of people in there.

 select
 DEPARTMENT , Count(*) as NumberOfpeople
 from Worker 
 group by DEPARTMENT


 -- Question
 --5. Write an SQL query to fetch departments along with the total salaries paid for each of them.

 select
 DEPARTMENT , Count(*) as NumberOfpeople , Sum(Salary) as TotalSalaryPaid
 from Worker 
 group by DEPARTMENT

 --Question 
 --6. Write an SQL query to fetch the names of workers who earn the highest salary.

 Select FIRST_NAME , LAST_NAME ,Salary
 from Worker
 where SALARY=( select max(salary) from worker)

 -- Question 
 --7. Write an SQL query to show the last record from a table

 Select *
 from Worker
 where WORKER_ID=( select max(WORKER_ID) from worker)

 -- Question 
 --8. Write an SQL query to fetch three min salaries from a table
 select * from(
 Select * ,
 d_rank = DENSE_RANK() over(order by salary)
 from worker)X
 where d_rank <=3

 -- Question 
 --9. Write an SQL query to print the name of employees having the highest salary in each department
 select * from (
 Select * ,
 d_rank = DENSE_RANK() over(partition by department order by salary desc)

 from worker) X
 where d_rank =1
 where d_rank <=3
 





 




  