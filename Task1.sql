SELECT *
FROM Books as books
JOIN Loans as loans on books.BookId = loans.LoanId
WHERE loans.BorrowerId = 133;