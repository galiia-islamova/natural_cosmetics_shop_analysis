------------------
-- Create tables
------------------
------------------
-- create schema
-----------------

create schema if not exists cosmetics;

--------------------------
-- create table: products 
---------------------------

create table if not exists cosmetics.products (
product_id serial primary key,
product_name text,
brand_name text,
category text,
price numeric (8, 2)
);

---------------------------
-- create table: customers
---------------------------

create table if not exists cosmetics.customers (
customer_id serial primary key,
customer_name text,
city text,
gender text
);

-----------------------
-- create table: sales
-----------------------

create table if not exists cosmetics.sales (
sale_id serial primary key,
sale_date date,
product_id int,
quantity int,
customer_id int,
discount_applied text,
payment_method text,
discount_percent numeric (4, 2) default 0.00
)