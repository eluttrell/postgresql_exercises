-- Create the table
CREATE TABLE restaurants2 (
  id serial primary key,
  name varchar UNIQUE,
  distance real NOT NULL,
  stars real,
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
