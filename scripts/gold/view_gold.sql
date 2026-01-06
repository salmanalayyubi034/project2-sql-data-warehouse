create view gold.fact_cafe_sales as

select 
[Transaction ID] as transaction_id,
Item as item,
[Price Per Unit] as price,
Quantity as quantity,
[Total Spent] as total_spent,
[Payment Method] as payment_method,
[Location] as [location],
[Transaction Date] as transaction_date
from silver.clean_cafe_sales
