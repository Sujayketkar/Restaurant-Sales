-- View the menu items table
USE Restaurant_db;
SELECT * FROM MENU_ITEMS;
-- Find thenumber of items on the menu
SELECT COUNT(*) FROM MENU_ITEMS;
-- what are the least and most expensive items on the menu
select * FROM MENU_ITEMS
ORDER BY PRICE DESC;

SELECT * FROM MENU_ITEMS
ORDER BY PRICE ASC;

-- How many italian dishes are on the menu? what is the most and least expensive amongst them?
select * from menu_items
where category = 'Italian';

select * from menu_items
where category = 'Italian'
order by price desc;
-- how many dishes are in each category.
select category, count('item_name') from menu_items
group by category
order by count('item_name') desc;
 
-- what is the average dish price within each category

select category, AVG(price) AS avg_price
from menu_items
group by category;

-- view the order details table

select * FROM order_details;

-- What is the date range of the table
select * from order_details
order by order_date;

select min(order_date), max(order_date) FROM order_details;
-- how many orders were made within this date range
select count(distinct order_id) from order_details;

-- how many items were ordered within this date range?
select count(*)from order_details;

-- which orders had the most number of items

select * from order_details;

select order_id, count(item_id) as num_items
from order_details
group by order_id
order by num_items desc;

-- how many orders have more than 12 items?
select  count(*) FROM
(select order_id, count(item_id) as num_items
from order_details
group by order_id
Having num_items>12) as num_orders;

-- HOW MANY ORDERS HAVE MORE THAN 13 ITEMS?

select * from order_details;

select count(*) from (select order_id, count(item_id) AS Items_count from order_details
GROUP BY order_id
HAVING Items_count>13) as num_count;

-- Combine thre menu_items and order_details tables into a single table.
select * from menu_items;
select * from order_details;

create table joiner_1 
select * 
from order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

 select * from joiner_1
 
 -- what were the least and most ordered items? what categories they were in
 
select item_name,count(order_details_id)
from joiner_1
group by item_name
order by count(order_details_id) desc;
-- what categories they were in
select item_name,category, count(order_details_id) as num_items
from joiner_1
group by item_name, category
order by num_items desc;

select * from joiner_1

select order_id, sum(price) as num_price
from joiner_1
group by order_id
order by num_price DESC
LIMIT 5
-- View the details of the highest spent order. what insights can you gather from the details?
 -- the highest spent order ( top1 ) from previous answer is 440, so lets dive in the record
 select * from joiner_1
 where order_id = 440;
 -- dive more- lets see what categories were ordered in 440
select category, count(category) from joiner_1
where order_id = 440
group by category;
 

 -- now lets dive more and get above details ( category) for top 5 records
 
 
 
 
 
 
 