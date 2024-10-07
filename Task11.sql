
CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport (

	@Start_Date DATE,
	@End_Date DATE
)
AS
BEGIN
	SELECT Borrowers.[First Name], Borrowers.[Last Name], Books.Title, Loans.[Date Borrowed]
	FROM Borrowers
	JOIN Loans ON Loans.BorrowerId = Borrowers.BorrowerId
	JOIN Books ON Loans.BookID = Books.BookId
	WHERE Loans.[Date Borrowed] > @Start_Date and Loans.[Date Borrowed] < @End_Date
END;

EXEC sp_BorrowedBooksReport '2023-05-1', '2024-08-4';