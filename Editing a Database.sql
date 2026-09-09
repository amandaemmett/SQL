-Create a data base for an app, based on hulu-

CREATE TABLE hulu_user_data (id INTEGER PRIMARY KEY AUTOINCREMENT, age INTEGER, email TEXT, profiles INTEGER, gender TEXT, watchtime_hours INTEGER);

INSERT INTO hulu_user_data (age, email, profiles, gender, watchtime_hours) 
    VALUES (4, "amanda@gmail.com", 1, "female", 4);
INSERT INTO hulu_user_data (age, email, profiles, gender, watchtime_hours) 
    VALUES (17, "brandon@gmail.com", 3, "male", 15);
INSERT INTO hulu_user_data (age, email, profiles, gender, watchtime_hours) 
    VALUES (27, "scout@gmail.com", 2, "declined", 35);


CREATE TABLE hulu_content_data (id INTEGER PRIMARY KEY AUTOINCREMENT, show_name TEXT, genre TEXT, average_length INTEGER, trending TEXT, number_of_ads INTEGER, ad_length INTEGER);

INSERT INTO hulu_content_data (show_name, genre, average_length, trending, number_of_ads, ad_length)
VALUES ("the 1916 project", "documentary", 60, "no", 3, 180);

INSERT INTO hulu_content_data (show_name, genre, average_length, trending, number_of_ads, ad_length)
VALUES ("superstore", "comedy", 22, "yes", 2, 45);

INSERT INTO hulu_content_data (show_name, genre, average_length, trending, number_of_ads, ad_length)
VALUES ("scandal", "drama", 45, "no", 3, 180);

INSERT INTO hulu_content_data (show_name, genre, average_length, trending, number_of_ads, ad_length)
VALUES ("castle", "comedy", 40, "no", 2, 45);


CREATE TABLE users_and_shows (id INTEGER PRIMARY KEY AUTOINCREMENT, user_id INTEGER, content_id INTEGER);

INSERT INTO users_and_shows (user_id, content_id) 
VALUES (1, 3);
INSERT INTO users_and_shows (user_id, content_id)
VALUES (2,3);
INSERT INTO users_and_shows (user_id, content_id)
VALUES (1, 4);
INSERT INTO users_and_shows (user_id, content_id)
VALUES (3, 2);
INSERT INTO users_and_shows (user_id, content_id)
VALUES (3, 3);


SELECT * FROM hulu_user_data;

-Edit tables to add new data-
ALTER TABLE hulu_user_data ADD occupation TEXT default "unknown";

SELECT * FROM hulu_user_data;

SELECT * FROM hulu_user_data WHERE id=1;

UPDATE hulu_user_data SET age="24" WHERE id=1;

SELECT * FROM hulu_user_data;

SELECT * FROM hulu_user_data WHERE id=1;

DELETE FROM hulu_user_data WHERE id=1;

SELECT * FROM hulu_user_data;

