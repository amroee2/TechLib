WITH NonReturnedBooks AS
(
    SELECT * 
    FROM Loans 
    WHERE [Date Returned] IS NULL
)
SELECT Borrowers.BorrowerId, Borrowers.[First Name], Borrowers.[Last Name], COUNT(Non.BookId) AS NumberOfNonReturnedLoans
FROM Borrowers
JOIN NonReturnedBooks Non 
    ON Borrowers.BorrowerId = Non.BorrowerId
GROUP BY Borrowers.BorrowerId, Borrowers.[First Name], Borrowers.[Last Name]
HAVING COUNT(Non.BookId) >= 2;
