--------------
-- ETL 
--------------

select s.sale_id, s.sale_date,
c.customer_name, c.city, c.gender,
p.product_name, p.brand_name, p.category, p.price, 
s.quantity, s.discount_percent, s.payment_method,
round(p.price * s.quantity, 2) as gross_revenue,
round(p.price * s.quantity * s.discount_percent, 2) as discount_value,
round(p.price * s.quantity * (1 - s.discount_percent), 2) as total_revenue
from cosmetics.sales s
join cosmetics.products p on s.product_id = p.product_id
join cosmetics.customers c on s.customer_id = c.customer_id