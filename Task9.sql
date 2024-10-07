SELECT Books.Author, COUNT(Loans.BookID) AS NumberOfBooks, RANK() OVER(ORDER BY COUNT(Loans.BookID) DESC) AS Rank
FROM Books
JOIN Loans ON Books.BookId = Loans.BookID
GROUP BY Books.Author
ORDER BY NumberOfBooks DESC