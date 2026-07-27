# DQL Commands 

SELECT column_name
FROM table_name
WHERE condition
GROUP BY column_name
HAVING condition
ORDER BY column_name
LIMIT number;

CREATE DATABASE SMART;
USE SMART;
-- Level 1: SELECT (Basic Retrieval)
-- Display all smartphones.
SELECT * FROM SMARTPHONES;
-- Display only the brand name and model.
SELECT BRAND_NAME,MODEL,Price FROM SMARTPHONES;
SELECT BRAND_NAME AS 'Brand Name',MODEL as 'Model Number', Price FROM SMARTPHONES; # aliasing 
-- Show the model, price, and rating of all smartphones.
SELECT Model,Price, Rating from smartphones;
SELECT Model,Price, Rating/10 from smartphones; # ratings on the scale of 1-10
SELECT Model,Price, Rating/10 as 'Ratings' from smartphones; # aliasing 
-- Display all unique smartphone brands.
SELECT BRAND_NAME FROM smartphones;
SELECT DISTINCT(BRAND_NAME) FROM smartphones;
SELECT COUNT(DISTINCT(BRAND_NAME)) FROM smartphones;
-- Display all unique processor brands.
SELECT DISTINCT(PROCESSOR_BRAND) FROM SMARTPHONES;


-- Level 2: WHERE (Filtering)
-- Show all smartphones priced above ₹30,000.
SELECT * FROM SMARTPHONES WHERE PRICE>30000;
-- Display all Samsung smartphones.
SELECT * FROM SMARTPHONES WHERE BRAND_NAME='Samsung';
SELECT Model,Price,Rating/10 as Ratings FROM SMARTPHONES WHERE BRAND_NAME='Samsung';
-- Show all smartphones with a rating greater than 85.
SELECT * FROM SMARTPHONES WHERE RATING>85;
-- Display all smartphones with a battery capacity of 5000 mAh.
SELECT * FROM SMARTPHONES WHERE BATTERY_CAPACITY = 5000;
-- Show all smartphones that support NFC.
SELECT * FROM SMARTPHONES WHERE Has_NFC = 'True';
-- Display all smartphones that have an IR Blaster.
SELECT * FROM SMARTPHONES WHERE Has_IR_Blaster='True' and brand_name='Samsung';
-- Show Apple smartphones with a rating above 80.
SELECT * FROM SMARTPHONES WHERE RATING>80 AND BRAND_NAME='aPPLE';
-- Display smartphones priced between ₹20,000 and ₹40,000.
SELECT * FROM SMARTPHONES WHERE PRICE<=40000 AND PRICE>=20000;
SELECT * FROM SMARTPHONES WHERE PRICE BETWEEN 20000 AND 40000;
-- Show smartphones powered by either Snapdragon or Bionic processors.
SELECT * FROM smartphones WHERE PROCESSOR_BRAND='Snapdragon' or processor_brand='Bionic';
SELECT Model,Brand_name as Brand, Price, Rating/10 as Rating, processor_brand as Processor, ram_capacity as RAM,
internal_memory as 'Offered Memory'
FROM smartphones 
WHERE PROCESSOR_BRANd in ('Snapdragon', 'Bionic');
-- Display smartphones that do not support 5G.
SELECT * FROM SMARTPHONES WHERE HAS_5G='fALSE';
-- Level 3: ORDER BY (Sorting)
-- Display all smartphones sorted by price in ascending order.
SELECT * FROM SMARTPHONES 
ORDER BY Price;
-- Display all smartphones sorted by rating in descending order.
select * from smartphones order by rating desc;
-- Show the most expensive smartphones.
SELECT * FROM SMARTPHONES ORDER BY PRICE DESC LIMIT 10;
-- Sort smartphones first by brand name and then by price in descending order.
SELECT * FROM SMARTPHONES ORDER BY BRAND_NAME, PRICE DESC;
-- Level 4: LIMIT OFFSET 
-- Display the top 10 most expensive smartphones.
SELECT * FROM SMARTPHONES ORDER BY PRICE DESC LIMIT 10 OFFSET 2;
SELECT * FROM SMARTPHONES ORDER BY PRICE DESC LIMIT 1 OFFSET 2;
-- Display the 5 cheapest smartphones.
SELECT * FROM SMARTPHONES ORDER BY PRICE LIMIT 5;
-- Level 5: GROUP BY
-- Count the number of smartphones available for each brand.
SELECT Brand_Name, count(*) as Total_number from smartphones group by brand_name order by count(*) desc;
-- Find the average price of smartphones for each brand.
select brand_name, round(avg(price),2) as 'Average Price' 
from smartphones group by brand_name 
order by avg(price) desc limit 10 offset 3;
-- Find the maximum battery capacity offered by each brand.
select brand_name, max(battery_capacity) from smartphones group by brand_name;
-- Count the number of smartphones available for each processor brand.

-- Level 6: HAVING
-- Display brands that have more than 10 smartphones.
SELECT Brand_Name, count(*) as Total_number from smartphones
group by brand_name having count(*)>10 order by count(*) desc ;
-- Show brands whose average rating is greater than 85.
SELECT BRAND_NAME, AVG(RATING) AS Rating
FROM SMARTPHONES 
GROUP BY BRAND_NAME 
HAVING AVG(RATING)>85;
-- Display processor brands that have more than 20 smartphones.
SELECT PROCESSOR_BRAND, COUNT(*) 
FROM SMARTPHONES 
group by PROCESSOR_BRAND 
HAVING COUNT(*)> 20 ORDER  BY COUNT(*) DESC;
-- Level 7: Mixed Concepts
-- Find the top 5 brands with the highest average smartphone price.
SELECT BRAND_NAME AS Brand, round(AVG(PRICE),2) AS 'Price(in INR)'
FROM SMARTPHONES
group by brand_name 
order by avg(price) desc limit 5;
-- Find the average price of 5G smartphones for each brand where the average price is greater than ₹30,000. 
-- Sort the result in descending order of average price.

SELECT Brand_Name, round(avg(Price),2) as Price
FROM SMARTPHONES 
WHERE has_5g='True'
group by brand_name 
having avg(price)>30000
order by avg(price) desc;
