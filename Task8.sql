SELECT Borrowers.[First Name], Borrowers.[Last Name], Books.*, Loans.*
FROM Borrowers
JOIN Loans ON Borrowers.BorrowerId = Loans.BorrowerId
JOIN Books ON Books.BookId = Loans.BookID
WHERE Loans.[Date Returned] IS NOT NULL AND DATEDIFF(DAY, Loans.[DUE DATE], Loans.[Date Returned]) > 30

SELECT * FROM LOANS