Q1: Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1

Q2: Which country have the  most  invoices?

SELECT COUNT (*) as c, billing_country  FROM invoice
GROUP BY billing_country
ORDER BY c DESC

Q3: What are top 3 values in total invoice?

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3

Q4: Which country has the best customers? We would like to throw a promotional musical festival in the city
    we made most money. Find the city that has highest sum of invoice total. Return both the city name and 
	sum of all invoice totals. 

SELECT SUM(total) as invoice_total, billing_city FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC

Q5: Who is the best customer. The customer who has spent the most money will be declared as best customer.
    Find the customer who has spent the most money.
	
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
FROM customer
JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1

Q6: List the email,first name,last name  of all rock music listeners.
    Return your list ordered aplhabetically by email starting with A.
	
SELECT DISTINCT email,first_name,last_name FROM customer
JOIN invoice on customer.customer_id = invoice.customer_id
JOIN invoice_line on invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	    SELECT track_id FROM track
	    JOIN genre ON track.genre_id = genre.genre_id
	    WHERE genre.name LIKE 'Rock'
	)
ORDER BY email


Q7: list the artist who have written most rock music in our dataset.
    write a query that returns the artist name and total track  count of top 10 rock bands.
	
SELECT artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
FROM track
JOIN album on album.album_id = track.album_id
JOIN artist on artist.artist_id = album.artist_id
JOIN genre on genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10


Q8: Return all the track names that have a song length longer than average song length.
    Return the name and milliseconds for each track. Order by the song length with the longest songs listed first.
	
SELECT name,milliseconds
FROM track
WHERE milliseconds > (
                 SELECT AVG(milliseconds)
	             FROM track
                           )
ORDER BY milliseconds DESC


#  INSIGHTS ;-
                 - Madan mohan( senior gen. manager)  is the most senior most employee of the company.
	         
                 - countries having maximum invoices are USA,Canada & brazil.

	         - prague is the city having most invoice.

	         - R Madhav is the best customer who spent the most money.

	         - most popular genre is rock.

	         - Artists who have written maximum rock songs  Angus young & malcom young.

	         - Track naming 'precipice' is the longest track as 5286953 milliseconds.

# CONCLUSION :
               Organise festivals,Music concerts in countries like USA,Canada & Brazil. Also, cities like Prague should be focused more by providing them 
               offers. Best customer like R madhav should be rewarded so as to make customers keen towards becoming best customer for which they have to
               purchase more. Artists creating most popular songs should be encouraged as they are leading to increase in particular song purchase among 
               customers.


    
