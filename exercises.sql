-- Create the table
CREATE TABLE restaurants2 (
  id serial primary key,
  name varchar UNIQUE,
  distance real NOT NULL,
  stars numeric,
  category varchar,
  favdish varchar,
  takeout boolean,
  lastate date DEFAULT '1900-01-01'
);

-- Insert data
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Naanstop', .01, 3.6, 'Fast Food', 'Spicy paneer', true, '2016-09-23');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Jason''s Deli', .02, 3.2, 'Fast Food', 'Salad Bar', true, '2016-09-28');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Subway', .02, 3.1, 'Fast Food', 'Veggie Sub', true, '2016-09-15');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('The Optimist', 6, 5, 'Fine Dining', 'Scallops', true, '2015-11-28');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Sushi Avenue', 10, 4.5, 'Casual', 'Dynamite Roll', true, '2016-08-12');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Chipotle', .01, 3.6, 'Fast Food', 'Burrito', true, '2016-01-19');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Harmony', 4, 4.8, 'Casual', 'Shark Fin Soup', true, '2016-02-14');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Pea Ridge', 8, 4.2, 'Casual', 'Trout Banh Mi', true, '2016-06-25');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout, lastate) values ('Farmburger', .01, 4.0, 'Casual', 'Burger', true, '2016-04-15');
INSERT INTO restaurants2 (name, distance, stars, category, favdish, takeout) values ('Bones', 2, 4.0, 'Fast Food', 'Steak', false);

-- Select everything from table restaurants2
select * from restaurants2;

-- Write queries to get:

-- 1. The names of the restaurants that you gave a 5 stars to
select * from restaurants2 where stars = 5;
-- 2. The favorite dishes of all 5-star restaurants
select favdish from restaurants2 where stars = 5;
-- 3. The the id of a restaurant by a specific restaurant name, say 'NaanStop'
select id, name from restaurants2 where name = 'NaanStop';
-- 4. restaurants in the category of 'BBQ'
select name, category from restaurants2 where category = 'Fast Food';
-- 5. restaurants that do take out
select * from restaurants2 where takeout = true;
-- 6. restaurants that do take out and is in the category of 'BBQ'
select * from restaurants2 where takeout = true and category = 'Fast Food';
-- 7. restaurants within 2 miles
select name, distance from restaurants2 where distance < 2.0;
-- 8. restaurants you haven't ate at in the last week
select name, lastate from restaurants2 where lastate < '2016-09-28';
-- 9. restaurants you haven't ate at in the last week and has 5 stars
select name, lastate, stars from restaurants2 where lastate < '2016-09-28' and stars = 5;

-- Aggregation and Sorting Queries

-- 1. list restaurants by the closest distance.
select name, distance from restaurants2 order by distance desc;
-- 2. list the top 2 restaurants by distance.
select name, distance from restaurants2 order by distance limit 2;
-- 3. list the top 2 restaurants by stars.
select name, stars from restaurants2 order by stars desc limit 2;
-- 4. list the top 2 restaurants by stars where the distance is less than 2 miles.
select name, stars, distance from restaurants2 where distance < 2.0 order by stars desc limit 2;
-- 5. count the number of restaurants in the db.
select count(*) from restaurants2;
-- 6. count the number of restaurants by category.
select category, count(*) from restaurants2 group by category;
-- 7. get the average stars per restaurant by category.
select round(avg(stars), 2), category from restaurants2 group by category; -- note: round() function will not round reals, only numerics or decimals. Had to convert 'stars' to numeric in Postico structure tab. Made corresponding change to CREAT TABLE above.
-- 8. get the max stars of a restaurant by category.
select max(stars), category from restaurants2 group by category;
