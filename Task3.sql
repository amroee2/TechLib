SELECT 
    Borrowers.BorrowerId, 
    Borrowers.[First Name], 
    Borrowers.[Last Name], 
    COUNT(Borrowers.BorrowerId) AS NumberOfLoans, 
    RANK() OVER(ORDER BY COUNT(Borrowers.BorrowerId) DESC) AS FreqRank
FROM 
    Borrowers
JOIN 
    Loans
    ON Borrowers.BorrowerId = Loans.BorrowerId
GROUP BY 
    Borrowers.BorrowerId, Borrowers.[First Name], Borrowers.[Last Name]
