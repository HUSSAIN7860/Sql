/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
  /**
Scalar Subqueries - Exercises 
Exercise 1  
Create a query that displays all rows and the following columns from the AdventureWorks2019.
HumanResources.Employee table: 
BusinessEntityID 
JobTitle 
VacationHours 
Also include a derived column called "MaxVacationHours" that
returns the maximum amount of vacation hours for any one employee, in any given row. **/

Select 
BusinessEntityID,JobTitle,VacationHours ,(
select max(vacationHours) from [AdventureWorks2019].[HumanResources].[Employee])as MaxVacationHours

from [AdventureWorks2019].[HumanResources].[Employee] 
