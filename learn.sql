-- 1 - Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName || ' ' || LastName AS FullName, CustomerId, Country
FROM Customer WHERE Country != 'USA';

-- 2 - Provide a query only showing the Customers from Brazil.
SELECT FirstName || ' ' || LastName AS FullName, CustomerId, Country
FROM Customer WHERE Country = 'Brazil';

-- 3 - Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT FirstName || ' ' || LastName AS FullName, InvoiceId, InvoiceDate, BillingCountry
FROM Customer
INNER JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
WHERE Country = 'Brazil';

-- 4 - Provide a query showing only the Employees who are Sales Agents.
SELECT
    "EmployeeId",
    "FirstName" || ' ' || "LastName" AS "FullName"
FROM
    "Employee"
WHERE
    "Title" = 'Sales Support Agent';


-- 5 - Provide a query showing a unique list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice;

-- 6 - Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT
    e."FirstName" || ' ' || e."LastName" AS "SalesAgentName",
    i."InvoiceId",
    i."InvoiceDate",
    i."BillingAddress",
    i."BillingCity",
    i."BillingState",
    i."BillingCountry",
    i."Total"
FROM
    "Employee" e
JOIN
    "Customer" c ON e."EmployeeId" = c."SupportRepId"
JOIN
    "Invoice" i ON c."CustomerId" = i."CustomerId"
ORDER BY
    "SalesAgentName", i."InvoiceId";


-- 7 - Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT
    i."Total" AS "InvoiceTotal",
    c."FirstName" || ' ' || c."LastName" AS "CustomerName",
    c."Country" AS "Country",
    e."FirstName" || ' ' || e."LastName" AS "SalesAgentName"
FROM
    "Invoice" i
JOIN
    "Customer" c ON i."CustomerId" = c."CustomerId"
JOIN
    "Employee" e ON c."SupportRepId" = e."EmployeeId";


-- 8 - How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT
    strftime('%Y', "InvoiceDate") AS "Year",
    COUNT(*) AS "NumberOfInvoices",
    SUM("Total") AS "TotalSales"
FROM
    "Invoice"
WHERE
    strftime('%Y', "InvoiceDate") IN ('2009', '2011')
GROUP BY
    "Year";

-- 9 - How many Invoices were there between 2009 and 2011? What are the respective total sales for each of those years?
SELECT
    strftime('%Y', "InvoiceDate") AS "Year",
    COUNT(*) AS "NumberOfInvoices",
    SUM("Total") AS "TotalSales"
FROM
    "Invoice"
WHERE
    strftime('%Y', "InvoiceDate") BETWEEN '2009' AND '2011'
GROUP BY
    "Year";


-- 10 - Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(InvoiceLineId) AS LineItemCount
FROM InvoiceLine
WHERE InvoiceId = 37;

-- 11 - Provide a query that includes the track name with each invoice line item.
SELECT T.Name AS TrackName, IL.InvoiceLineId
FROM Track T
INNER JOIN InvoiceLine IL ON T.TrackId = IL.TrackId;

-- 12 - Provide a query that shows the # of invoices per country. HINT: GROUP BY
SELECT COUNT(InvoiceId) AS InvoiceCount, BillingCountry
FROM Invoice
GROUP BY BillingCountry;

-- 13 - Provide a query that shows total sales per country.
SELECT SUM(Total) AS TotalSales, BillingCountry
FROM Invoice
GROUP BY BillingCountry;

-- 14 - Provide a query that shows the most purchased track of 2013.
SELECT
    t."Name" AS "TrackName",
    COUNT(il."InvoiceLineId") AS "TotalPurchases"
FROM
    "InvoiceLine" il
JOIN
    "Invoice" i ON il."InvoiceId" = i."InvoiceId"
JOIN
    "Track" t ON il."TrackId" = t."TrackId"
WHERE
    strftime('%Y', i."InvoiceDate") = '2013'
GROUP BY
    "TrackName"
ORDER BY
    "TotalPurchases" DESC
LIMIT 1;

-- 15 - Provide a query that shows the top 5 most purchased tracks over all.
SELECT T.Name AS TrackName, COUNT(IL.InvoiceLineId) AS PurchaseCount
FROM Track T
INNER JOIN InvoiceLine IL ON T.TrackId = IL.TrackId
GROUP BY T.Name;

-- 16 - Provide a query that shows all invoices but includes the # of invoice line items.
SELECT
    i.*,
    COUNT(il."InvoiceLineId") AS "NumberOfLineItems"
FROM
    "Invoice" i
LEFT JOIN
    "InvoiceLine" il ON i."InvoiceId" = il."InvoiceId"
GROUP BY
    i."InvoiceId";


-- 17 - Provide a query that shows total sales per country, but this time, order first by the country name, and then by total sales desc.
SELECT SUM(Total) AS TotalSales, BillingCountry
FROM Invoice
GROUP BY BillingCountry
ORDER BY BillingCountry, TotalSales DESC;

-- 18 - Provide a query that shows the # of invoices per country, but only for countries with more than 5 invoices.
SELECT COUNT(InvoiceId) AS InvoiceCount, BillingCountry
FROM Invoice
GROUP BY BillingCountry
HAVING COUNT(InvoiceId) > 5;

-- 19 - Provide a query that shows total sales per country, but only for countries with more than 5 invoices.
SELECT SUM(Total) AS TotalSales, BillingCountry
FROM Invoice
GROUP BY BillingCountry
HAVING COUNT(InvoiceId) > 5;

-- 20 - Provide a query that shows the # of tracks in each playlist.
SELECT COUNT(TrackId) AS TrackCount, PlaylistId
FROM PlaylistTrack
GROUP BY PlaylistId;

-- 21 - Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album, Media type and Genre.
SELECT Name AS TrackName, AlbumId, MediaTypeId, GenreId
FROM Track;
SELECT
    t."Name" AS "TrackName",
    al."Title" AS "AlbumName",
    mt."Name" AS "MediaType",
    g."Name" AS "Genre"
FROM
    "Track" t
JOIN
    "Album" al ON t."AlbumId" = al."AlbumId"
JOIN
    "MediaType" mt ON t."MediaTypeId" = mt."MediaTypeId"
JOIN
    "Genre" g ON t."GenreId" = g."GenreId";


-- 22 - Provide a query showing the invoices of customers who are from Brazil.
SELECT InvoiceId, CustomerId, BillingCountry
FROM Invoice
WHERE BillingCountry = 'Brazil';

-- 23 - Provide a query showing the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT
    e."FirstName" || ' ' || e."LastName" AS "SalesAgentName",
    i."InvoiceId",
    i."InvoiceDate",
    i."BillingAddress",
    i."BillingCity",
    i."BillingState",
    i."BillingCountry",
    i."Total"
FROM
    "Employee" e
JOIN
    "Customer" c ON e."EmployeeId" = c."SupportRepId"
JOIN
    "Invoice" i ON c."CustomerId" = i."CustomerId"
ORDER BY
    "SalesAgentName", "InvoiceId";


-- 24 - Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT COUNT(InvoiceLineId) AS LineItemCount, InvoiceId
FROM InvoiceLine
GROUP BY InvoiceId;
SELECT
    "InvoiceId",
    COUNT("InvoiceLineId") AS "NumberOfLineItems"
FROM
    "InvoiceLine"
GROUP BY
    "InvoiceId";

-- 25 - Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT
    il."InvoiceLineId",
    t."Name" AS "TrackName",
    a."Name" AS "ArtistName",
    il."UnitPrice",
    il."Quantity",
    il."UnitPrice" * il."Quantity" AS "Total"
FROM
    "InvoiceLine" il
JOIN
    "Track" t ON il."TrackId" = t."TrackId"
JOIN
    "Album" al ON t."AlbumId" = al."AlbumId"
JOIN
    "Artist" a ON al."ArtistId" = a."ArtistId";


-- 26 - Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
SELECT
    p."Name" AS "PlaylistName",
    COUNT(pt."TrackId") AS "TotalTracks"
FROM
    "Playlist" p
JOIN
    "PlaylistTrack" pt ON p."PlaylistId" = pt."PlaylistId"
GROUP BY
    "PlaylistName"
ORDER BY
    "TotalTracks" DESC;


-- 27 - Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
SELECT
    t."Name" AS "TrackName",
    al."Title" AS "AlbumName",
    mt."Name" AS "MediaType",
    g."Name" AS "Genre"
FROM
    "Track" t
JOIN
    "Album" al ON t."AlbumId" = al."AlbumId"
JOIN
    "MediaType" mt ON t."MediaTypeId" = mt."MediaTypeId"
JOIN
    "Genre" g ON t."GenreId" = g."GenreId";


-- 28 - Provide a query that shows total sales made by each sales agent.
SELECT
    e."FirstName" || ' ' || e."LastName" AS "SalesAgent",
    SUM(i."Total") AS "TotalSales"
FROM
    "Employee" e
JOIN
    "Customer" c ON e."EmployeeId" = c."SupportRepId"
JOIN
    "Invoice" i ON c."CustomerId" = i."CustomerId"
GROUP BY
    "SalesAgent"
ORDER BY
    "TotalSales" DESC;


-- 29 - Which sales agent made the most in sales in 2009?
SELECT
    e."FirstName" || ' ' || e."LastName" AS "SalesAgent",
    SUM(i."Total") AS "TotalSales"
FROM
    "Employee" e
JOIN
    "Customer" c ON e."EmployeeId" = c."SupportRepId"
JOIN
    "Invoice" i ON c."CustomerId" = i."CustomerId"
WHERE
    strftime('%Y', i."InvoiceDate") = '2009'
GROUP BY
    "SalesAgent"
ORDER BY
    "TotalSales" DESC
LIMIT 1;


-- 30 - Which sales agent made the most in sales in 2010?
SELECT
    e."FirstName" || ' ' || e."LastName" AS "SalesAgent",
    SUM(i."Total") AS "TotalSales"
FROM
    "Employee" e
JOIN
    "Customer" c ON e."EmployeeId" = c."SupportRepId"
JOIN
    "Invoice" i ON c."CustomerId" = i."CustomerId"
WHERE
    strftime('%Y', i."InvoiceDate") = '2010'
GROUP BY
    "SalesAgent"
ORDER BY
    "TotalSales" DESC
LIMIT 1;

-- 31 - Which sales agent made the most in sales over all?
SELECT
    e."FirstName" || ' ' || e."LastName" AS "SalesAgent",
    SUM(i."Total") AS "TotalSales"
FROM
    "Employee" e
JOIN
    "Customer" c ON e."EmployeeId" = c."SupportRepId"
JOIN
    "Invoice" i ON c."CustomerId" = i."CustomerId"
GROUP BY
    "SalesAgent"
ORDER BY
    "TotalSales" DESC
LIMIT 1;


-- 32 - Provide a query that shows the # of customers assigned to each sales agent.
SELECT
    e."FirstName" || ' ' || e."LastName" AS "SalesAgent",
    COUNT(c."CustomerId") AS "NumberOfCustomers"
FROM
    "Employee" e
LEFT JOIN
    "Customer" c ON e."EmployeeId" = c."SupportRepId"
WHERE
    e."Title" = 'Sales Support Agent'
GROUP BY
    "SalesAgent"
ORDER BY
    "NumberOfCustomers" DESC;


-- 33 - Provide a query that shows the total sales per country. HINT: GROUP BY
SELECT SUM(Total) AS TotalSales, BillingCountry
FROM Invoice
GROUP BY BillingCountry;
SELECT BillingCountry AS Country, SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSales DESC;

-- 34 - Provide a query that shows the total sales per country. Which country's customers spent the most?
SELECT SUM(Total) AS TotalSales, BillingCountry
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSales DESC
LIMIT 1;
SELECT i."BillingCountry" AS "Country", SUM(i."Total") AS "TotalSales"
FROM "Invoice" i
GROUP BY "Country"
ORDER BY "TotalSales" DESC
LIMIT 1;


-- 35 - Provide a query that shows the top 3 best selling artists.
SELECT a."Name" AS "ArtistName", SUM(il."UnitPrice" * il."Quantity") AS "TotalSales"
FROM "Artist" a
JOIN "Album" al ON a."ArtistId" = al."ArtistId"
JOIN "Track" t ON al."AlbumId" = t."AlbumId"
JOIN "InvoiceLine" il ON t."TrackId" = il."TrackId"
GROUP BY a."Name"
ORDER BY "TotalSales" DESC
LIMIT 3;


-- 36 - Provide a query that shows the most purchased Media Type.
SELECT mt."Name" AS "MediaTypeName", COUNT(*) AS "TotalPurchases"
FROM "InvoiceLine" ii
JOIN "Track" t ON ii."TrackId" = t."TrackId"
JOIN "MediaType" mt ON t."MediaTypeId" = mt."MediaTypeId"
GROUP BY "MediaTypeName"
ORDER BY "TotalPurchases" DESC
LIMIT 1;
