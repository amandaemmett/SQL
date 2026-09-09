/*Table created by break_into_tech*/
CREATE TABLE bank_products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    product_type TEXT,
    interest_rate DECIMAL(5, 2),
    monthly_fee DECIMAL(6, 2),
    minimum_balance DECIMAL(10, 2)
);

INSERT INTO bank_products (product_id, product_name, product_type, interest_rate, monthly_fee, minimum_balance)
VALUES
    (1, 'Savings Account', 'Savings', 0.75, 0.00, 100.00),
    (2, 'Checking Account', 'Checking', 0.25, 5.00, 50.00),
    (3, 'Business Account', 'Business', 1.50, 10.00, 500.00),
    (4, 'Credit Card', 'Credit Card', 18.99, 0.00, 0.00),
    (5, 'Mortgage Loan', 'Loan', 3.25, 0.00, 100000.00),
    (6, 'Certificate of Deposit', 'Savings', 1.50, 0.00, 1000.00),
    (7, 'Student Checking Account', 'Checking', 0.10, 0.00, 10.00),
    (8, 'Business Credit Card', 'Credit Card', 16.99, 0.00, 0.00),
    (9, 'Home Equity Loan', 'Loan', 4.50, 0.00, 50000.00),
    (10, 'IRA Account', 'Savings', 1.25, 0.00, 500.00),
    (11, 'Personal Loan', 'Loan', 8.75, 0.00, 5000.00),
    (12, 'Money Market Account', 'Savings', 1.00, 0.00, 500.00),
    (13, 'Youth Savings Account', 'Savings', 0.50, 0.00, 10.00),
    (14, 'Rewards Credit Card', 'Credit Card', 21.99, 0.00, 0.00),
    (15, 'Auto Loan', 'Loan', 4.25, 0.00, 20000.00);


/*Select all bank product names*/

SELECT product_name
FROM bank_products;

/*Select all products where the product type is checking or savings*/

SELECT product_name
FROM bank_products
WHERE product_type IN ("Savings","Checking");

/*Find a product for a customer who wants to save, a high interest rate, and no monthly fees*/

SELECT product_name
FROM bank_products
WHERE product_type="Savings" AND interest_rate>=.75 AND monthly_fee=0;

/* What interest rates are offered for non-borrowing accounts*/

SELECT product_type, MAX(interest_rate), MIN(interest_rate)
FROM bank_products
WHERE product_type NOT IN("Credit Card", "Loan")
GROUP BY product_type;

/*Select all information for the product with the lowest minimum balance*/

SELECT*
FROM bank_products
WHERE product_name IN (SELECT MIN(minimum_balance) FROM bank_products ORDER BY MIN(minimum_balance) ASC LIMIT 1);


