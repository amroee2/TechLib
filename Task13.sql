DROP PROCEDURE IF EXISTS OverDueBorrowers;
GO
CREATE PROCEDURE OverDueBorrowers
AS
BEGIN

	WITH OverDue AS
	(
		SELECT Borrowers.[First Name], Borrowers.[Last Name], Loans.[DUE DATE], Loans.[Date Returned], Loans.BookID
		FROM Borrowers
		JOIN Loans ON Borrowers.BorrowerId = Loans.BorrowerId
		WHERE Loans.[Date Returned] > Loans.[DUE DATE] OR (GETDATE() > Loans.[DUE DATE] AND Loans.[Date Returned] IS NULL)
	)
	SELECT OverDue.[First Name], OverDue.[Last Name], Books.Title, OverDue.[DUE DATE], OverDue.[Date Returned]
	FROM OverDue
	JOIN Books ON OverDue.BookID = Books.BookId

END;
GO
EXEC OverDueBorrowers;