/* Question.1 */
select 
p.name as ProductName , p.ListPrice as Listprice ,c.ProductSubcategoryID as Name , 
pc.name as ProductCategory


from Production.Product as p
join Production.ProductSubcategory as c
	 on p.ProductSubcategoryID = c.ProductSubcategoryID
join Production.ProductCategory as pc
	on c.ProductCategoryID = pc.ProductCategoryID

/* Question.2 */
select 
p.name as ProductName , p.ListPrice as Listprice ,c.ProductSubcategoryID as Name , 
pc.name as ProductCategory ,
AvgPriceCategory = avg(ListPrice) over(partition by pc.name)-- group by ProductCategory)--  order by Listprice)


from Production.Product as p
join Production.ProductSubcategory as c
	 on p.ProductSubcategoryID = c.ProductSubcategoryID
join Production.ProductCategory as pc
	on c.ProductCategoryID = pc.ProductCategoryID

/* Question.3 */
select 
p.name as ProductName , p.ListPrice as Listprice ,c.ProductSubcategoryID as Name , 
pc.name as ProductCategory ,
AvgPriceCategory = avg(ListPrice) over(partition by pc.name) , 
AvgPriceByCategoryAndSubCategory = avg(ListPrice) over (partition by pc.name , c.ProductSubcategoryID)

from Production.Product as p
join Production.ProductSubcategory as c
	 on p.ProductSubcategoryID = c.ProductSubcategoryID
join Production.ProductCategory as pc
	on c.ProductCategoryID = pc.ProductCategoryID

/* Question.4 */
select * ,  Listprice - AvgPriceByCategoryAndSubCategory  as ProductVsCategoryDelta from 
(
select 
p.name as ProductName , p.ListPrice as Listprice ,c.ProductSubcategoryID as Name , 
pc.name as ProductCategory ,
AvgPriceCategory = avg(ListPrice) over(partition by pc.name) , -- group by ProductCategory)--  order by Listprice)
AvgPriceByCategoryAndSubCategory = avg(ListPrice) over (partition by pc.name , c.ProductSubcategoryID)
--ProductVsCategoryDelta = (Listprice - AvgPriceByCategoryAndSubCategory) 
from Production.Product as p
join Production.ProductSubcategory as c
	 on p.ProductSubcategoryID = c.ProductSubcategoryID
join Production.ProductCategory as pc
	on c.ProductCategoryID = pc.ProductCategoryID
) x
