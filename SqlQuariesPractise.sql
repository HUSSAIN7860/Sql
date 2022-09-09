/* Question 1.*/
select
p.FirstName , p.LastName , e.JobTitle , h.Rate , AverageRate = avg(h.rate) over()

from person.Person as p
join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
	on e.BusinessEntityID = h.BusinessEntityID

/* Question 2.*/
select
p.FirstName , p.LastName , e.JobTitle , h.Rate ,
AverageRate = avg(h.rate) over(), MaximumRate = max(h.rate) over()

from person.Person as p
join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
	on e.BusinessEntityID = h.BusinessEntityID

/* Question 3.*/
select
p.FirstName , p.LastName , e.JobTitle , h.Rate ,
AverageRate = avg(h.rate) over(), MaximumRate = max(h.rate) over(),
DiffFromAvg = h.rate - avg(h.rate) over()

from person.Person as p
join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
	on e.BusinessEntityID = h.BusinessEntityID

/* Question 4.*/
select
p.FirstName , p.LastName , e.JobTitle , h.Rate ,
AverageRate = avg(h.rate) over(), MaximumRate = max(h.rate) over(),
DiffFromAvg = h.rate - avg(h.rate) over(),
PercentofMaxRate = h.rate /max(h.rate) over() *100
from person.Person as p
join HumanResources.Employee as e
	on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as h
	on e.BusinessEntityID = h.BusinessEntityID

