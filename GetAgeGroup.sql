CREATE FUNCTION dbo.GetAgeGroup (
    @Age INT
)
RETURNS VARCHAR(50)
AS 
BEGIN
    DECLARE @AgeGroup VARCHAR(50);

    SET @AgeGroup = 
        CASE 
            WHEN @Age BETWEEN 0 AND 10 THEN '0-10'
            WHEN @Age BETWEEN 11 AND 20 THEN '11-20'
            WHEN @Age BETWEEN 21 AND 30 THEN '21-30'
            WHEN @Age BETWEEN 31 AND 40 THEN '31-40'
            WHEN @Age BETWEEN 41 AND 50 THEN '41-50'
            WHEN @Age BETWEEN 51 AND 60 THEN '51-60'
            WHEN @Age BETWEEN 61 AND 70 THEN '61-70'
            WHEN @Age BETWEEN 71 AND 80 THEN '71-80'
            WHEN @Age BETWEEN 81 AND 90 THEN '81-90'
            WHEN @Age BETWEEN 91 AND 100 THEN '91-100'
            ELSE 'Out of range'
        END;
    RETURN @AgeGroup;
END;
GO
