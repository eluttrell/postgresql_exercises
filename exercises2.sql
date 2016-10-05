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
INSERT INTO restaurant (name, address, category) values ('Naanstop', '123 Fake St.', 'Fast Food');
INSERT INTO restaurant (name, address, category) values ('Subway', '124 Fake St.', 'Fast Food');
INSERT INTO restaurant (name, address, category) values ('Chick-Fil-A', '125 Fake St.', 'Fast Food');
INSERT INTO restaurant (name, address, category) values ('Krystal', '126 Fake St.', 'Fast Food');
INSERT INTO restaurant (name, address, category) values ('McDonalds', '127 Fake St.', 'Casual');
INSERT INTO restaurant (name, address, category) values ('Wendy''s', '128 Fake St.', 'Casual');
INSERT INTO restaurant (name, address, category) values ('Churche''s Chicken', '129 Fake St.', 'Casual');
INSERT INTO restaurant (name, address, category) values ('Mrs. Winner''s', '130 Fake St.', 'Fine Dining');
INSERT INTO restaurant (name, address, category) values ('Long John Silvers', '131 Fake St.', 'Fine Dining');
INSERT INTO restaurant (name, address, category) values ('Captain D''s', '132 Fake St.', 'Fine Dining');
INSERT INTO restaurant (name, address, category) values ('Papa John''s', '133 Fake St.', 'Fine Dining');

-- Insert info into table reviewer
INSERT INTO reviewer (name, email, karma) values ('John Goodman', 'jgoodman@email.com', 7);
INSERT INTO reviewer (name, email, karma) values ('Christian Slater', 'cslater@email.com', 4);
INSERT INTO reviewer (name, email, karma) values ('Wierd Al', 'oogabooga@emailemail.com', 0);
INSERT INTO reviewer (name, email, karma) values ('Donald Trump', 'shitheel@wanker.com', .3);
INSERT INTO reviewer (name, email, karma) values ('Rosie Odonnel', 'rodonnel@email.com', 7);

-- Insert info into table review
INSERT INTO review (author_reviewer_id, stars, title, review, restaurant_id) values (4, 5, 'Best Indian Food Ever', 'The only time I had better Indian food was at Trump Tower!', 1);
INSERT INTO review (author_reviewer_id, stars, title, review, restaurant_id) values (1, 1, 'Sub-PAR-way more like!', 'Went in for five footlongs and they forgot to put double mayo on one! Last time I ever eat there #talkaboutshittyservice', 2);
