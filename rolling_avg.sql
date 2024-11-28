/* Using this dataset, show the SQL query to find the rolling 3 day average transaction amount for each day in January 2021. */

With cte as(
select  Date(transaction_time) as transaction_date, 
  sum(transaction_amount) as day_transaction_amount
from transactions
group by Date(transaction_time)
)
  
select *, 
avg(day_transaction_amount) over(order by transaction_date 
                               rows between 2 preceding and current row) as rolling_average_amount
                               
 from cte


/* I have not used a where condition to check the data from Jan 1 2021 to Jan 31 2021  because i have checked the data , and there are no outliers
