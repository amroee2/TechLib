SELECT
    DATENAME(WEEKDAY, Loans.[Date Borrowed]) AS DayOfWeek, 
    COUNT(*) AS Count, 
    (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Loans)) * 100 AS Percentage
FROM Loans
GROUP BY DATENAME(WEEKDAY, Loans.[Date Borrowed])
ORDER BY Percentage DESC

SELECT COUNT(*) From Loans