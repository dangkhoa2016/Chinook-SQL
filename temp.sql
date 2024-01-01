-- display all tables in sqlite database
SELECT * FROM sqlite_master WHERE type='table';
SELECT name FROM sqlite_master WHERE type='table';

-- show table in console
.tables

-- show table schema
.schema

-- show table data
.dump

-- display version
.version

-- count rows in table Album
SELECT COUNT(*) as count_album FROM Album;

-- count rows in table Artist
SELECT COUNT(*) as count_artist FROM Artist;

-- count rows in table Genre
SELECT COUNT(*) as count_genre FROM Genre;

-- count rows in table Track
SELECT COUNT(*) as count_track FROM Track;

-- count rows in table Playlist
SELECT COUNT(*) as count_playlist FROM Playlist;

-- count rows in table PlaylistTrack
SELECT COUNT(*) as count_playlist_track FROM PlaylistTrack;

-- count rows in table MediaType
SELECT COUNT(*) as count_media_type FROM MediaType;

-- count rows in table Customer
SELECT COUNT(*) as count_customer FROM Customer;

-- count rows in table Invoice
SELECT COUNT(*) as count_invoice FROM Invoice;

-- count rows in table InvoiceLine
SELECT COUNT(*) as count_invoice_line FROM InvoiceLine;

/*
+-------------+
| count_album |
+-------------+
| 347         |
+-------------+
+--------------+
| count_artist |
+--------------+
| 275          |
+--------------+
+-------------+
| count_genre |
+-------------+
| 25          |
+-------------+
+-------------+
| count_track |
+-------------+
| 3503        |
+-------------+
+----------------+
| count_playlist |
+----------------+
| 18             |
+----------------+
+----------------------+
| count_playlist_track |
+----------------------+
| 8715                 |
+----------------------+
+------------------+
| count_media_type |
+------------------+
| 5                |
+------------------+
+----------------+
| count_customer |
+----------------+
| 59             |
+----------------+
+---------------+
| count_invoice |
+---------------+
| 412           |
+---------------+
+--------------------+
| count_invoice_line |
+--------------------+
| 2240               |
+--------------------+
*/