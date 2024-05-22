1--  What are the total sales for each branch in the last month?

SELECT Branch, SUM(total) AS Total_Sales
FROM sales.sales
WHERE date between '3/8/2019' and '3/9/2019'
GROUP BY Branch
order by total_sales desc

2--Which city has the highest average rating foor customer satisfaction?

select city, round(avg(rating),2) as customer_satisfaction from sales.sales
group by city
order by customer_satisfaction desc


3--What is the total revenue generated_by_each product line?

select `product line` as product_line, round(sum(total),2) as total_sales from sales.sales
group by product_line
order by total_sales desc


4--What is the difference between the total made by members and non members ?
select 
abs(round(sum(case
        when `customer type`= 'member' then total else 0 end),0) 
      -  round(sum(case
        when `customer type`= 'normal' then total else 0 end),0)) as sales_member_type_difference
        from sales.sales
        
        
5--What is the average transaction value for each payment method?

select payment, round(avg(total),0) as total
from sales.sales
group by payment
order by total desc


6--Which branch has the highest gross income over the last quarter?

select branch,round(sum(`gross income`),0) as gross_income
from sales.sales
where date between '3/6/2019' and '3/9/2019'
GROUP by branch
order by gross_income desc 

7--Which product line has the highest quantity of items sold?

select `product line` as product_line, sum(quantity) as quantity
from sales.sales
group by product_line
order by quantity desc

8--What is the distribution of sales across different times of the day?

select distinct hour(time), round(sum(total),0) as total_sales
from sales.sales
group by hour(time) 
order by hour(time) asc

9--How does the average unit price vary between product lines?

select `product line` as product_line, round(avg(`unit price`),2) as average_unit_price
from sales.sales
group by product_line
order by average_unit_price desc

10--What is the average gross margin percentage for each branch?

select branch, round(avg(`gross margin percentage`),2) as gross_margin_percentage
from sales.sales
group by branch 
order by gross_margin_percentage desc

11-What is the average transaction value for each product line in each branch over the past six months?

select  distinct branch, `product line`,
round(avg (total) over ( partition by `product line`),2) as average_transaction_value
 from sales.sales
 where date between '3/3/2019' and '3/9/2019'
 order by branch, average_transaction_value desc
 

12-- Which product lines have seen the largest increase in sales quantity over the last quarter compared to the previous quarter?

select distinct city, payment, round(sum(total) over( partition by payment),2) as revenue_per_payment_method
from sales.sales
order by city, payment


13-- Calculate the average customer rating for each branch and determine which branch has the highest overall customer satisfaction.

select branch, round(avg(rating),2) as average_rating
from sales.sales
group by branch
order by average_rating desc

