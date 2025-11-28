----------------------------
-- CTEs for Cosmetics Shop
----------------------------
--------------
-- main CTE
--------------
with cosmetics_main_table as (
select
s.sale_id, s.sale_date, s.quantity, s.discount_percent,
p.product_name, p.brand_name, p.category, p.price,
c.customer_name, c.city, c.gender,
round(p.price * s.quantity, 2) as gross_revenue,
round(p.price * s.quantity * s.discount_percent, 2) as discount_value,
round(p.price * s.quantity * (1 - s.discount_percent), 2) total_revenue
from cosmetics.sales s
join cosmetics.products p on s.product_id = p.product_id
join cosmetics.customers c on s.customer_id = c.customer_id
),
select *
from cosmetics_main_table

---------------------------------------
-- top spending customers (top 10) CTE
---------------------------------------

customer_revenue as (
select
customer_name, sum(total_revenue) as customer_total_revenue
from cosmetics_main_table
group by customer_name
),
select *
from customer_revenue
order by customer_total_revenue desc
limit 10

----------------------------------
-- brand performance by city CTE
----------------------------------

city_brand_sales as (
select
brand_name, city, count(sale_id) as sales_count_by_city, 
sum(total_revenue) as city_total_revenue
from cosmetics_main_table
group by city, brand_name
),

-------------------------
-- top 5 brands by city
-------------------------

top_brands_by_city as (
select
city, brand_name, sales_count_by_city, 
city_total_revenue, 
rank () over (partition by city order by city_total_revenue desc, sales_count_by_city) as brand_rank
from city_brand_sales
),

select *
from top_brands_by_city
where brand_rank <= 5

--------------------------------
-- gender based preferences CTE
--------------------------------

gender_based_quantity as (
select
gender, product_name, sum(quantity) sum_quantity_by_gender
from cosmetics_main_table 
group by gender, product_name
),

-- top 5 products by gender

top_products_by_gender as (
select 
gender, product_name, sum_quantity_by_gender,
dense_rank() over(partition by gender order by sum_quantity_by_gender desc) as product_rank
from gender_based_quantity
),
select *
from top_products_by_gender
where product_rank <= 10

----------------------
-- monthly revenue
----------------------

monthly_revenue as (
select date_trunc('month', sale_date) as months,
sum (total_revenue) as sum_total_revenue
from cosmetics_main_table
group by date_trunc('month', sale_date)
)
select months, sum_total_revenue,
lag(sum_total_revenue) over (order by months) as previous_month_revenue,
 round((sum_total_revenue - lag(sum_total_revenue) over (order by months)) 
        / nullif(lag(sum_total_revenue) over (order by months), 0) * 100, 2) as growth_percent
from monthly_revenue;*/

-----------------------------------
-- Subqueries for Cosmetics Shop
-----------------------------------
---------------------------------------
-- customers who spent above average
---------------------------------------

select c.customer_name,
round(sum(p.price * s.quantity * (1 - s.discount_percent)), 2) as total_spent
from cosmetics.sales s
join cosmetics.products p on s.product_id = p.product_id
join cosmetics.customers c on s.customer_id = c.customer_id
group by c.customer_name
having sum(p.price * s.quantity * (1 - s.discount_percent)) >
(
select avg(total_sum) 
from (
select sum(p.price * s.quantity * (1 - s.discount_percent)) as total_sum
from cosmetics.sales s
join cosmetics.products p on s.product_id = p.product_id
group by s.customer_id
) customer_spent
);

--------------------
-- popular products
--------------------

select p.product_name,
sum(s.quantity) as total_sold
from cosmetics.sales s
join cosmetics.products p on s.product_id = p.product_id
group by p.product_name
having sum(s.quantity) > (
select avg(total_quantity)
from (
select sum(quantity) as total_quantity
from cosmetics.sales
group by product_id
) popular_products
);