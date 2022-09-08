/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EMPLOYEE_ID]
      ,[FIRST_NAME]
      ,[LAST_NAME]
      ,[EMAIL]
      ,[PHONE_NUMBER]
      ,[HIRE_DATE]
      ,[JOB_ID]
      ,[SALARY]
      ,[COMMISSION_PCT]
      ,[MANAGER_ID]
      ,[DEPARTMENT_ID]
  FROM [dbo].[employees]


  /**/

  select 
  FIRST_NAME , salary , round(SALARY,2) as roundsalary
  from dbo.employees



  /**/

    Select 
  	MANAGER_ID , min(salary) from dbo.employees
	where MANAGER_ID is not null
  group by MANAGER_ID
  order by min(salary) desc


  /**/
  select
  avg(salary) as avgsalary , 
  DEPARTMENT_ID
  from dbo.employees
  group  by DEPARTMENT_ID
  having count(*)>10

  /**/
  select 
  FIRST_NAME , LAST_NAME , SALARY
from  dbo.employees
where SALARY > ( select  SALARY
from  dbo.employees
where EMPLOYEE_ID = 163)


/**/

select 
FIRST_NAME , LAST_NAME
 from dbo.employees
 where  SALARY in (
select 
 min (salary)
from dbo.employees
group by  DEPARTMENT_ID)

/**/
select
*
from dbo.employees
where 