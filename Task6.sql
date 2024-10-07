CREATE OR ALTER FUNCTION fn_CalculateOverdueFees(

	@id INT
)
RETURNS INT AS
BEGIN
    DECLARE @total_fee INT
	DECLARE @DueDate DATE
	DECLARE @ReturnDate DATE
	Declare @total_days INT
	SET @total_fee = 0
	SELECT @DueDate = Loan.[DUE DATE], @ReturnDate = Loan.[Date Returned]
	FROM Loans as Loan
	WHERE Loan.LoanID = @id
	IF @ReturnDate is NULL
	BEGIN
		SET @ReturnDate = CAST(GETDATE() AS DATE)
	END
	SET @total_days = DATEDIFF(DAY, @DueDate, @ReturnDate);
	IF @total_days <= 30
	BEGIN
		RETURN @total_DAYS;
	END
	RETURN 30 + 2 * (@total_days - 30);
END;
