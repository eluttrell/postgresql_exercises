-- Create database restaurants_db_v2
CREATE DATABASE restaurants_db_v2;

-- For version 2 of the restaurant database, you will have the following tables:

-- restaurant
CREATE TABLE restaurant (
  id serial PRIMARY KEY,
  name varchar,
  address varchar,
  category varchar
);
-- reviewer
CREATE TABLE reviewer (
  id serial PRIMARY KEY,
  name varchar,
  email varchar,
  karma numeric CONSTRAINT positive_karma CHECK (karma < 7)
);
-- review
CREATE TABLE review (
  id serial PRIMARY KEY,
  author_reviewer_id serial ,
  stars numeric CONSTRAINT positive_stars CHECK (stars < 5),
  title varchar,
  review varchar,
  restaurant_id serial
);

-- Insert info into table restaurant
INSERT INTO restaurant
(
  name,
  address,
  category
)
values
(
  'Naanstop',
  '123 Fake St.',
  'Fast Food'
),
(
  'Subway',
  '124 Fake St.',
  'Fast Food'
),
(
  'Chick-Fil-A',
  '125 Fake St.',
  'Fast Food'
),
(
  'Krystal',
  '126 Fake St.',
  'Fast Food'
),
(
  'McDonalds',
  '127 Fake St.',
  'Casual'
),
(
  'Wendy''s',
  '128 Fake St.',
  'Casual'
),
(
  'Churche''s Chicken',
  '129 Fake St.',
  'Casual'
),
(
  'Mrs. Winner''s',
  '130 Fake St.',
  'Fine Dining'
),
(
  'Long John Silvers',
  '131 Fake St.',
  'Fine Dining'
),
(
  'Captain D''s',
  '132 Fake St.',
  'Fine Dining'
),
(
  'Papa John''s',
  '133 Fake St.',
  'Fine Dining'
);

-- Insert info into table reviewer
INSERT INTO reviewer
(
  name,
  email,
  karma
)
values
(
  'John Goodman',
  'jgoodman@email.com',
  7
),
(
  'Christian Slater',
  'cslater@email.com',
  4
),
(
  'Wierd Al',
  'oogabooga@emailemail.com',
  0
),
(
  'Donald Trump',
  'shitheel@wanker.com',
  .3
),
(
  'Rosie Odonnel',
  'rodonnel@email.com',
  7
);

-- Insert info into table review
INSERT INTO review
(
  reviewer_id,
  stars,
  title,
  review,
  restaurant_id
)
values
(
  4,
  5,
  'Best Indian Food Ever',
  'The only time I had better Indian food was at Trump Tower!',
  1
),
(1, 1, 'Sub-PAR-way more like!', 'Went in for five footlongs and they forgot to put double mayo on one! Last time I ever eat there #talkaboutshittyservice', 2)
(1, 4, 'The only fine dining Mrs. Winner''s found outside of North Korea!', 'I had my doubts, but I am now thouroughly convinced that all Mrs. Winner's should be retro converted to emulate this establishments fine dining atmosphere. The food was delicious (of course), but you can't beat that high class feeling you get when you walk across the cracked parking lot on the side of I-20!', 8)
;
INSERT INTO review (author_reviewer_id, stars, title, review, restaurant_id) values ;
INSERT INTO review (author_reviewer_id, stars, title, review, restaurant_id) values ;
INSERT INTO review (author_reviewer_id, stars, title, review, restaurant_id) values (2, 3, 'In a word, "meh".', ' took my girlfriend Heather there, and though the food quality wasn''t bad, we were thouroughly unimpressed with the clientelle. Wound up murdering all of them, but made it look like a mass suicide! HA!', 4);
INSERT INTO review (author_reviewer_id, stars, title, review, restaurant_id) values (3, 1.22234, 'Papa don''t dance with no squares!', 'I enjoy cats the most because the Russians didn''t send one to space?', 11);

-- Queries
-- 1. list the reviews for a given restaurant (filter by its name or id)
select * from review, restaurant where restaurant.name = 'Subway' and review.restaurant_id = restaurant.id;
-- 2. list the reviews for a given reviewer (filter by his/her name or id)
select * from review, reviewer where reviewer.name = 'John Goodman' and review.reviewer_id = reviewer.id;
-- 3. list each review along with the restaurant they were written for. Select just the restaurant name and the review text
select restaurant.name, review.review from restaurant, review where restaurant.id = review.restaurant_id;
-- 4. get the average stars by restaurant. (restaurant name, average star rating)
select name, round(avg(stars), 2) from restaurant, review where restaurant.id = review.restaurant_id group by restaurant.name;
-- 5. get the number of reviews written for each restaurant. Select the restaurant name and the review count.
select name, count(review) from restaurant, review where restaurant.id = review.restaurant_id group by restaurant.name;
-- 6. list each review along with the restaurant, and the reviewer's name. Select the restaurant name, the review text, and the reviewer name
select review, reviewer.name, restaurant.name from review, restaurant, reviewer where review.reviewer_id = reviewer.id and restaurant.id = review.reviewer_id group by restaurant.name;
-- 7. get the average stars by reviewer (reviewer name, average star rating)
select name, round(avg(stars), 2) from reviewer, review where reviewer.id = review.reviewer_id group by reviewer.id;
-- 8. get the lowest star rating for each reviewer (reviewer name, lowest star rating)
select name, min(stars) from reviewer, review where reviewer.id = review.reviewer_id group by reviewer.id;
-- 9. get the number of restaurants in each category (category name, restaurant count)
select category, count(category) from restaurant group by category;
-- 10. get number of 5 star reviews by restaurant (restaurant name, 5-star count)
select restaurant.name, review.stars from restaurant, review where stars = 5 and restaurant.id = review.restaurant_id group by restaurant.name, review.stars;
-- 11. average star rating for a food category (category name, average star rating)
select category, round(avg(stars), 2) from restaurant, review where restaurant.id = review.restaurant_id group by restaurant.category;
