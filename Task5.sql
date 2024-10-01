DROP PROCEDURE IF EXISTS insertBorrower;
GO
CREATE PROCEDURE insertBorrower (
    @First_Name    VARCHAR(50),
    @Last_Name     VARCHAR(50),
    @Email         VARCHAR(50),
    @DateOfBirth   DATE,
    @MembershipDate DATE
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
        RETURN;
    END
    INSERT INTO Borrowers([First Name], [Last Name], Email, [Date Of Birth], [Membership Date])
    VALUES (@First_Name, @Last_Name, @Email, @DateOfBirth, @MembershipDate);

    PRINT 'Borrower successfully inserted';
END;

EXEC insertBorrower "Test", "Test", "amroqadadha4@gmail.com", '2002-05-18', '2024-08-4';