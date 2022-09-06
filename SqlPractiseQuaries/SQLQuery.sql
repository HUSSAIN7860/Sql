/* 1. First Quary */

SELECT *
  FROM [dbo].[Employee]
where emp_dept= 57


/* 2. Second Quary */

select 
 Winner 

from dbo.noblePrizeWinners 
where subject = 'Literature' and Year = 1970 ; 


/* 3. Third Quary */

select
  year ,
  subject ,
  winner
from dbo.noblePrizeWinners 
where year = 1971;

/* 4. Fourth Quary */
select
  year ,
  subject
from dbo.noblePrizeWinners
where Winner = 'Dennis Gabor';

/*5. Fifth Quary */

select 
winner
from  dbo.noblePrizeWinners
where subject = 'Physics' and year >=1950;


/*6. Sixth*/
select

*
from dbo.noblePrizeWinners 
where subject not like 'p%';