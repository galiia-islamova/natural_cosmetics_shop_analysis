------------------------
-- views for Power BI
------------------------
-------------------------
-- 1 - clean sales view
-------------------------

create or replace view cosmetics.clean_sales_view_bi as
select s.sale_id, s.sale_date,
p.product_id, p.product_name, p.brand_name, p.price,
s.quantity, s.discount_percent,
round(p.price * s.quantity * (1 - s.discount_percent), 2) as total_revenue,
c.customer_id, c.customer_name, c.gender, c.city, s.payment_method
from cosmetics.sales s
join cosmetics.products p on s.product_id = p.product_id
join cosmetics.customers c on s.customer_id = c.customer_id;

-------------------------
-- 2 - revenue by city view
--------------------------

create or replace view cosmetics.revenue_by_city_view_bi as
select city,
round(sum(total_revenue), 2) as total_revenue_by_city,
count(distinct customer_id) as unique_customers,
count(distinct sale_id) as total_sales_by_city
from cosmetics.clean_sales_view_bi
group by city
order by total_revenue_by_city desc;

-------------------------
-- 3 - revenue by brand view
-------------------------

create or replace view cosmetics.revenue_by_brand_view_bi as
select brand_name, round(sum(total_revenue), 2) as total_revenue_by_brand,
count(distinct sale_id) as total_sales_by_brand,
round(avg(total_revenue), 2) as avg_sale_value_by_brand
from cosmetics.clean_sales_view_bi
group by brand_name
order by total_revenue_by_brand desc;

-----------------------
-- 4 - gender based sales
-----------------------

create or replace view cosmetics.gender_based_sales_view_bi as
select gender, round(sum(total_revenue), 2) as total_revenue_by_gender,
count(distinct customer_id) as total_customers,
round(avg(total_revenue), 2) as avg_spend_by_gender
from cosmetics.clean_sales_view_bi
group by gender;

------------------
-- 5 - monthly revenue
-------------------

create or replace view cosmetics.monthly_revenue_view_bi as
select date_trunc('month', s.sale_date)::date as months,
round(sum(p.price * s.quantity * (1 - s.discount_percent)), 2) as total_revenue_by_months,
count(distinct sale_id) as total_sales_by_months
from cosmetics.sales s
join cosmetics.products p on s.product_id = p.product_id
group by date_trunc('month', sale_date)
order by months;

-----------------------
-- 6 - payment method 
----------------------

create or replace view cosmetics.payment_method_view_bi as
select payment_method, round(sum(total_revenue), 2) as total_revenue_by_payment_method,
count(distinct sale_id) as total_sales_by_payment_method
from cosmetics.clean_sales_view_bi
group by payment_method
order by total_revenue_by_payment_method desc;

----------------------------
-- 7 - top 5 brands by city
------------------

create or replace view cosmetics.top_brands_by_city_view_bi as
with brand_rank_cte as (
select city, brand_name, ROUND(sum(total_revenue), 2) as total_revenue_city_brand,
rank() over (partition by city order by sum(total_revenue) desc) as brand_rank_by_city
from cosmetics.clean_sales_view_bi
group by city, brand_name
)
select * 
from brand_rank_cte
where brand_rank_by_city <= 5;