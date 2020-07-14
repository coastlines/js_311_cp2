DROP TABLE IF EXISTS users, users_contact, users_location, users_credentials, plants, users_plants
,users_plant_actions_water, users_plant_actions_rotate, users_plant_actions_fertilized
,users_plant_actions_soil, users_plants_growth, users_plants_foliage, users_plant_flower_fruit
,users_plant_location;

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(40),
  last_name VARCHAR(75),
  PRIMARY KEY (id)
);

CREATE TABLE users_contact (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  phone_mobile VARCHAR(50),
  email VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
);

CREATE TABLE users_location (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(10),
  climate_zone VARCHAR(10),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)
  REFERENCES users (id)
);

CREATE TABLE users_credentials (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(25),
  password VARCHAR(100),
  PRIMARY KEY (id),
  UNIQUE KEY (username)
);

CREATE TABLE plants (
  id INT NOT NULL AUTO_INCREMENT,
  botanical_name VARCHAR(40),
  common_name_1 VARCHAR(75),
  common_name_2 VARCHAR(75),
  common_name_3 VARCHAR(75),
  PRIMARY KEY (id)
);

CREATE TABLE users_plants (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  user_plant_nickname varchar(75),
  is_alive tinyint(1),
  timestamp timestamp,
  date_created datetime,
  date_inactive datetime,
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users_plant_actions_water (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  action_date timestamp,
  watered tinyint(1),
  water_type varchar(15),
  water_source varchar(15),
  water_amount varchar(10),
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users_plant_actions_rotate (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  action_date timestamp,
  rotated tinyint(1),
  rotated_direction varchar(10),
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users_plant_actions_fertilized (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  action_date timestamp,
  fertilized tinyint(1),
  fertilized_type varchar(20),
  fertilized_amount varchar(10),
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users_plant_actions_soil (
  id INT NOT NULL AUTO_INCREMENT, 
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  action_date timestamp,
  soil_amended tinyint(1),
  soil_new tinyint(1),
  soil_type varchar(20),
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE users_plant_growth (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  date_added timestamp,
  height varchar(15),
  width varchar(15),
  circumference varchar(15),
  growth_leggy tinyint,
  growth_dense tinyint,
  leaf_issue tinyint,
  blooming tinyint,
  fruiting tinyint,
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users_plant_foliage (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  date_added timestamp,
  leaf_condition tinyint,
  leaf_color varchar(20),
  leaf_spotting tinyint,
  leaf_spotting_detail varchar(20),
  leafs_new tinyint,
  leafs_pruned tinyint,
  leaf_brown tinyint,
  leaf_yellow tinyint,
  leaf_drop tinyint,
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users_plant_flower_fruit (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  attribute_date timestamp,
  flowers_new tinyint,
  flowers_pruned tinyint,
  fruit_new tinyint,
  fruit_harvested tinyint,
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users_plant_location (
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  plant_id INT NOT NULL,
  users_plant_id INT NOT NULL,
  location_date timestamp,
  room tinyint,
  direction tinyint,
  distance_from_window tinyint,
  light_quality varchar(20),
  light_hours tinyint,
  draft tinyint,
  PRIMARY KEY (id),
  FOREIGN KEY (plant_id) REFERENCES users_plants (plant_id),
  FOREIGN KEY (users_plant_id) REFERENCES users_plants (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);