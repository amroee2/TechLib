WITH BorrowerGenres AS
(
    SELECT 
        Borrowers.BorrowerId,
        Borrowers.[First Name],
        Borrowers.[Last Name],
        dbo.CalculateAge(Borrowers.[Date of Birth]) AS Age,
        dbo.GetAgeGroup(dbo.CalculateAge(Borrowers.[Date of Birth])) AS AgeGroup,
        Books.Genre
    FROM 
        Borrowers
    JOIN 
        Loans ON Borrowers.BorrowerId = Loans.BorrowerId
    JOIN 
        Books ON Loans.BookID = Books.BookId
),
GenreRanked AS
(
    SELECT 
        AgeGroup,
        Genre,
        COUNT(*) AS GenreCount,
        ROW_NUMBER() OVER (PARTITION BY AgeGroup ORDER BY COUNT(*) DESC) AS GenreRank
    FROM 
        BorrowerGenres
    GROUP BY 
        AgeGroup, Genre
)
SELECT 
    AgeGroup,
    Genre,
    GenreCount
FROM 
    GenreRanked
WHERE 
    GenreRank = 1
ORDER BY 
    AgeGroup;