CREATE FUNCTION dbo.CalculateAge
(
    @BirthDate DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;

    -- Calculate the age
    SET @Age = DATEDIFF(YEAR, @BirthDate, GETDATE()) - 
               CASE 
                   WHEN MONTH(@BirthDate) > MONTH(GETDATE()) OR 
                        (MONTH(@BirthDate) = MONTH(GETDATE()) AND DAY(@BirthDate) > DAY(GETDATE())) 
                   THEN 1 
                   ELSE 0 
               END;

    RETURN @Age;
END;
GO
