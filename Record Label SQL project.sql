For this project, I downloaded Chinook data from Kaggle. Then I created a table to insert Chinook data into. Finally, I performed analytics on the data using SQL. 


/*Show Customers (their full names, customer ID, and country) who are not in Canada*/
SELECT customerid, firstname, lastname, country FROM customers
WHERE country<>'Canada'
Order By country

/*Show only the Customers from Czech Republic*/
SELECT customerid, firstname, lastname FROM customers
WHERE country='Czech Republic'

/*Find the Invoices of customers who are from Czech Republic.*/
SELECT invoiceid, invoicedate, firstname, lastname, billingcountry
FROM customers
INNER JOIN invoices
ON customers.CustomerId=invoices.CustomerId 
WHERE billingcountry='Czech Republic'
ORDER BY invoicedate DESC


/*Show the Employees who work in IT*/
SELECT employeeid, title, firstname, lastname
FROM employees
WHERE title like '%it%'

/*Find a unique/distinct list of billing countries from the Invoice table*/
SELECT DISTINCT billingcountry
FROM invoices
ORDER BY billingcountry

/*Provide a query that shows the invoices associated with each sales agent.*/
SELECT invoices.invoiceid, employees.firstname, employees.lastname
FROM invoices
INNER JOIN customers
ON invoices.customerid=customers.CustomerId
INNER JOIN employees
ON employees.employeeid=customers.SupportRepId
GROUP BY invoices.InvoiceId
ORDER BY employees.lastname


/*Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.*/
SELECT invoices.total, customers.FirstName as 'customer_first', customers.LastName as 'customer_last', customers.country, employees.FirstName as 'agent_first', employees.LastName as 'agent_last' 
FROM invoices
INNER JOIN customers
ON invoices.customerid=customers.CustomerId
INNER JOIN employees
ON employees.employeeid=customers.SupportRepId
GROUP BY invoices.InvoiceId
ORDER BY customers.lastname

/*How many Invoices were there in 2010*/
SELECT DISTINCT count(invoiceid)
FROM invoices
WHERE invoicedate like '2010%'

/*What are the total sales for 2010?*/
SELECT FORMAT(SUM(invoices.Total),'C2') as 'total_sales'
FROM invoices

/*Write a query that includes the purchased track name with each invoice line ID*/
SELECT tracks.Name as 'trackname', invoice_items.InvoicelineId
FROM tracks
INNER JOIN invoice_items
ON tracks.TrackId=invoice_items.TrackId
ORDER BY trackname

/*Write a query that includes the purchased track name AND artist name with each invoice line ID*/
SELECT tracks.name as 'trackname', artists.name as 'artistname', invoice_items.InvoiceLineId as 'invoiceid'
FROM tracks
INNER JOIN invoice_items
ON tracks.trackid=invoice_items.TrackId
INNER JOIN albums
ON tracks.AlbumId=albums.AlbumId
INNER JOIN artists
ON albums.ArtistId=artists.ArtistId
ORDER BY artistname

/*Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre*/
SELECT tracks.name as 'track', albums.title as 'album', media_types.name as 'mediatype', genres.Name as 'genre' 
FROM tracks
INNER JOIN albums
ON tracks.AlbumId=albums.AlbumId
INNER JOIN media_types
ON tracks.MediaTypeId=media_types.MediaTypeId
INNER JOIN genres
ON tracks.GenreId=genres.GenreId

/*Show the total sales made by each sales agent*/
SELECT employees.lastname as 'agentlast', employees.FirstName as 'agentfirst', FORMAT(SUM(invoices.total),'C') as totalsales
FROM invoices
INNER JOIN customers
ON invoices.CustomerId=customers.CustomerId
INNER JOIN employees
ON customers.SupportRepId=employees.EmployeeId
GROUP BY agentlast, agentfirst

/*Which sales agent made the most dollars in sales in 2010?*/
SELECT employees.FirstName as 'agentfirst', employees.LastName as 'agentlast', ROUND(SUM(invoices.Total),2) as 'totalsales'
FROM invoices
INNER JOIN customers
ON invoices.CustomerId=customers.CustomerId
INNER JOIN employees
ON customers.SupportRepId=employees.EmployeeId
WHERE invoices.InvoiceDate LIKE '2010%'
GROUP BY agentfirst,agentlast
ORDER BY totalsales DESC
LIMIT 1

/*Which media type made the most sales in 2010?*/
WITH CTE as(
SELECT media_types.Name as 'mediatype' , SUM(invoices.Total) as 'sales'
FROM media_types
INNER JOIN tracks
ON media_types.MediaTypeId=tracks.MediaTypeId
INNER JOIN invoice_items
ON tracks.TrackId=invoice_items.TrackId
INNER JOIN invoices
ON invoice_items.InvoiceId=invoices.InvoiceId
WHERE invoices.InvoiceDate LIKE '2010%'
GROUP BY media_types.name)

SELECT mediatype
FROM CTE
ORDER BY sales DESC
Limit 1

/*What was the most used genre on playlists in 2010*/
WITH CTE as(
SELECT genres.Name as genre, count(playlist_track.trackid) as 'num_of_tracks'
FROM genres
INNER JOIN tracks
ON genres.GenreId=tracks.GenreId
INNER JOIN playlist_track
ON tracks.TrackId=playlist_track.TrackId
INNER JOIN invoice_items
ON tracks.TrackId=invoice_items.TrackId
INNER JOIN invoices
ON invoice_items.InvoiceId=invoices.InvoiceId
WHERE invoices.InvoiceDate LIKE '2010%'
GROUP BY genre)

SELECT genre
FROM CTE
ORDER BY num_of_tracks DESC
LIMIT 1

/*Which sales agent is the most veteran*/
SELECT employeeid, firstname, lastname, hiredate
FROM employees
ORDER BY hiredate 
LIMIT 1

/*Write a query that shows each sales agent, their customer's names, and the customer's phone number*/
SELECT employees.employeeid, customers.FirstName, customers.LastName, customers.Phone
FROM employees
INNER JOIN customers
ON employees.employeeid=customers.SupportRepId
ORDER BY employeeid

/*Which track has the longest duration*/
SELECT *
FROM tracks
ORDER BY milliseconds DESC
LIMIT 1




