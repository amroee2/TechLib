CREATE OR ALTER PROCEDURE insertBorrower (
    @First_Name    VARCHAR(50),
    @Last_Name     VARCHAR(50),
    @Email         VARCHAR(50),
    @DateOfBirth   DATE,
    @MembershipDate DATE,
    @NewBorrowerID INT OUTPUT
)
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Borrowers
        WHERE Email = @Email
    )
    BEGIN
        PRINT 'Error: Email already exists in the database.';
        SET @NewBorrowerID = NULL;
        RETURN -1;
    END

    INSERT INTO Borrowers([First Name], [Last Name], Email, [Date Of Birth], [Membership Date])
    VALUES (@First_Name, @Last_Name, @Email, @DateOfBirth, @MembershipDate);

    SET @NewBorrowerID = SCOPE_IDENTITY();
    PRINT 'Borrower successfully inserted';
    RETURN 0;
END;

DECLARE @NewID INT;

EXEC insertBorrower 'Test', 'Test', 'amroqadadha700@gmail.com', '2002-05-18', '2024-08-04', @NewBorrowerID = @NewID OUTPUT;

IF @NewID IS NOT NULL
BEGIN
    SELECT *
    FROM Borrowers
    WHERE BorrowerId = @NewID;
END
