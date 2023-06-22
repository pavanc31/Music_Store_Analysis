/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
   Return your list ordered alphabetically by email starting with A */
   
 Select DISTINCT first_name, last_name, email from customer as c
 join invoice  as i
 on c.customer_id = i.customer_id
 join invoice_line as il
 on i.invoice_id = il.invoice_id
 join track as t 
 on t.track_id = il.track_id
 join genre as g
 on g.genre_id = t.genre_id
 where g.name = 'Rock'
 order by email asc;
 
/* Q2: Let's invite the artists who have written the most rock music in
our dataset. Write a query that returns the Artist name and total
track count of the top 10 rock bands */

select a.artist_id,a.name,count(a.artist_id) as number_of_songs from artist as a
join album as ab
on a.artist_id = ab.artist_id
join track as t
on t.album_id = ab.album_id
join genre as g
on t.genre_id = g.genre_id
where g.name = 'Rock'
group by a.artist_id
order by number_of_songs desc 

/* Q3: Return all the track names that have a song le the average song length. Return the Name and each track.
  Order by the song length with the long first.*/

select name,milliseconds from track 
where milliseconds > (
select avg(milliseconds) as avg_track_length from track)
order by milliseconds desc;













