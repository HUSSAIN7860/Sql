CREATE TABLE Product
(ProductID INT, ProductName VARCHAR(100) )
GO
 
CREATE TABLE ProductDescription
(ProductID INT, ProductDescription VARCHAR(800) )
GO
 
INSERT INTO Product VALUES (680,'HL Road Frame - Black, 58')
,(706,'HL Road Frame - Red, 58')
,(707,'Sport-100 Helmet, Red')
GO
 
INSERT INTO ProductDescription VALUES (680,'Replacement mountain wheel for entry-level rider.')
,(706,'Sturdy alloy features a quick-release hub.')
,(707,'Aerodynamic rims for smooth riding.')


select * from Product

select * from ProductDescription

-- Stored Procedure

create Procedure GetProdDescriptionn as 
begin
set NOcount on

select 
p.ProductID , p.ProductName , pd.ProductDescription
from Product as p
inner join ProductDescription as pd
on p.ProductID = pd.ProductID

end

exec GetProdDescriptionn

-- Stored with one Parameter

create Procedure GetProdDesc_withOnePara @ProductId nvarchar(30) as 
begin
set NOcount on

select 
p.ProductID , p.ProductName , pd.ProductDescription
from Product as p
inner join ProductDescription as pd
on p.ProductID = pd.ProductID

where p.ProductID >= @ProductId

end

-- executing the Stored Procedure 
exec GetProdDesc_withOnePara 706  




-- here we rename the Stored Procedure 
exec sp_rename 'GetProdDesc_withOnePara','Changed_nameOfOnePara'


-- Stored Procedure with Multiple Parameter 
create Procedure GetProdDesc_withMultipara @ProductId nvarchar(30) ,@PName varchar(100)
begin
set NOcount on

select 
p.ProductID , p.ProductName , pd.ProductDescription
from Product as p
inner join ProductDescription as pd
on p.ProductID = pd.ProductID

where p.ProductID >= @ProductId and ProductName = @PName

end




exec GetProdDesc_withOneMutlti 706 , 'Sport-100 Helmet, Red'


-- Local Variable with default parameter 

create Procedure #temp1
as begin
print('Local temp Procedure')
end

exec #temp1


create Procedure ##temp2
as begin
print('Gobal Temp Procedure ')
end

exec ##temp2