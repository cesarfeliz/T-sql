use TSQL2012
go

/*This code will look for the top 2 
products base on the unite price per category*/

with p as (
select 
	ROW_NUMBER() over(partition by categoryid
					 order by Unitprice desc, productid) Rownum
	,unitprice
	,Productid
	,productname
	,categoryid
from 
	production.products
)


select 
	categoryid,
	productid,
	productname,
	unitprice
from 
	p
where 
	rownum < 3;
