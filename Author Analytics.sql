-Create an author database with multiple tables-

CREATE TABLE persons 
    (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER);
   
INSERT INTO persons (name, age) VALUES ("hemingway", 62);
INSERT INTO persons (name, age) VALUES ("twain", 75);
INSERT INTO persons (name, age) VALUES ("woolf", 59);
INSERT INTO persons (name, age) VALUES ("king", 75);
INSERT INTO persons (name, age) VALUES ("dickens", 58);



CREATE TABLE books 
    (id INTEGER PRIMARY KEY AUTOINCREMENT, author_id INTEGER, name TEXT, pages INTEGER, genre TEXT);
    
INSERT INTO books (author_id, name, pages, genre) VALUES (4, "The dark tower", 256, "horror");
INSERT INTO books (author_id, name, pages, genre) VALUES (4, "it", 1168, "horror");
INSERT INTO books (author_id, name, pages, genre) VALUES (4, "misery", 320, "suspense");
INSERT INTO books (author_id, name, pages, genre) VALUES (4, "the shining", 688, "horror");
INSERT INTO books (author_id, name, pages, genre) VALUES (4, "the stand", 1152, "post-apocalyptic");
INSERT INTO books (author_id, name, pages, genre) VALUES (1, "the old man and the sea", 128, "literary");
INSERT INTO books (author_id, name, pages, genre) VALUES (1, "a farewell to arms", 576, "war drama");
INSERT INTO books (author_id, name, pages, genre) VALUES (1, "for whom the bell tolls", 480, "war drama");
INSERT INTO books (author_id, name, pages, genre) VALUES (1, "the sun also rises", 251, "novel");
INSERT INTO books (author_id, name, pages, genre) VALUES (1, "a moveable feast", 256, "memoir");
INSERT INTO books (author_id, name, pages, genre) VALUES (2, "the celebrated jumping frog of calaveras county", 288, "fiction");
INSERT INTO books (author_id, name, pages, genre) VALUES (2, "the innocents abroad", 316, "travel literature"); 
INSERT INTO books (author_id, name, pages, genre) VALUES (2, "roughing it", 496, "autobiographical"); 
INSERT INTO books (author_id, name, pages, genre) VALUES (2, "the gilded age", 512, "fiction"); 
INSERT INTO books (author_id, name, pages, genre) VALUES (2, "the adventures of tom sawyer", 216, "fiction");
INSERT INTO books (author_id, name, pages, genre) VALUES (3, "Mrs Dalloway", 224, "fiction"); 
INSERT INTO books (author_id, name, pages, genre) VALUES (3, "to the lighthouse", 209, "fiction"); 
INSERT INTO books (author_id, name, pages, genre) VALUES (3, "Orlando", 352, "biography");
INSERT INTO books (author_id, name, pages, genre) VALUES (3, "The Waves", 324, "experimental literature");
INSERT INTO books (author_id, name, pages, genre) VALUES (3, "jacob's room", 290, "fiction");
INSERT INTO books (author_id, name, pages, genre) VALUES (5, "great expectations", 500, "black comedy");
INSERT INTO books (author_id, name, pages, genre) VALUES (5, "our mutual friend", 928, "fiction");
INSERT INTO books (author_id, name, pages, genre) VALUES (5, "david copperfield", 1019, "blidungsoman"); 
INSERT INTO books (author_id, name, pages, genre) VALUES (5, "bleak house", 640, "fiction");
INSERT INTO books (author_id, name, pages, genre) VALUES (5, "little dorrit", 688, "literary fiction");



CREATE TABLE personal_life
    (id INTEGER PRIMARY KEY AUTOINCREMENT, author_id INTEGER, married TEXT, pets TEXT, residence TEXT);
INSERT INTO personal_life (author_id, married, pets, residence) VALUES (1, "yes", "yes", "ketchum");
INSERT INTO personal_life (author_id, married, pets, residence) VALUES (2, "yes", "yes", "hartford");
INSERT INTO personal_life (author_id, married, pets, residence) VALUES (3, "yes", "yes", "london");
INSERT INTO personal_life (author_id, married, pets, residence) VALUES (4, "yes", "yes", "bangor");
INSERT INTO personal_life (author_id, married, pets, residence) VALUES (5, "yes", "yes", "london");

-Who wrote each book?-
SELECT persons.name, books.name FROM persons
    JOIN books
    ON persons.id=books.author_id;

-Where were books of different genres written?-
SELECT personal_life.residence, books.genre FROM personal_life
    JOIN books
    ON personal_life.author_id=books.author_id;
    
-Who wrote the book with the most pages at the youngest age?-    
SELECT persons.name, persons.age, books.name, books.pages FROM persons
    JOIN books
    WHERE persons.id=books.author_id
    ORDER BY persons.age, books.pages;

-Add a new author to the table-
INSERT INTO persons (name, age) VALUES ("Hoover", 43);

-Where did all the authors live?-
SELECT p.name, pl.residence
FROM persons p
LEFT OUTER JOIN personal_life pl
ON p.id=pl.author_id;

-Clean the data-
SELECT * FROM books
WHERE LOWER(name)="the dark tower"
;

UPDATE books SET name="The Gunslinger" WHERE id=1;

SELECT * FROM books WHERE id=1;

ALTER TABLE books ADD sequel_id INTEGER default "none";

SELECT * FROM books;

INSERT INTO books (author_id, name, pages, genre) VALUES (4, "The Drawing of the Three", 528, "horror");

INSERT INTO books (author_id, name) VALUES (2, "Tom Sawyer");

SELECT * FROM books WHERE id=26;

UPDATE books SET sequel_id=26 WHERE id=1;

SELECT * FROM books WHERE id=1;

SELECT * FROM books WHERE name= "Tom Sawyer";

UPDATE books SET sequel_id=27 WHERE id=15;

SELECT * FROM books;


-What books have a sequel?-
SELECT books.name first_book, sequel_id.name second_book
FROM books
JOIN books sequel_id
ON books.id=sequel_id.sequel_id;

-How many authors are in our database?-
SELECT COUNT(DISTINCT author_id) number_of_authors
FROM books;

-What are the most, least, and average number of pages?-
SELECT MAX(pages) max_pages, MIN(pages) min_pages, ROUND(AVG(pages)) avg_pages 
FROM books;

-Do we have any information onan author who's name ends with "way"?-
SELECT * FROM persons WHERE name LIKE "%way";

-Join all the information from the database-
SELECT * 
FROM persons
JOIN books
ON persons.id=books.author_id
JOIN personal_life
ON persons.id=personal_life.author_id;

