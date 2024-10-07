CREATE FUNCTION fn_BookBorrowingFrequency(
	@id INT
)
Returns INT AS
BEGIN
	DECLARE @bookFreq INT
	Select @bookFreq = COUNT(*)
	FROM Loans as Loan
	WHERE Loan.BookID = @id
	RETURN @bookFreq
END