SELECT Book.Genre, COUNT(Loan.LoanId) AS NumberOfLoans
FROM Books AS Book
JOIN Loans AS Loan ON Book.BookId = Loan.BookId
WHERE MONTH(Loan.[Date Borrowed]) = 8
GROUP BY Book.Genre
ORDER BY NumberOfLoans DESC;