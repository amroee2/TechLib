CREATE INDEX idx_Loans_BookId ON Loans(BookId);
CREATE INDEX idx_Loans_BorrowerID ON Loans(BorrowerID);
CREATE INDEX idx_Loans_DateReturned ON Loans(LoanId);
CREATE INDEX idx_Loans_DateBorrowed ON Loans([Date Borrowed]);
CREATE INDEX idx_Loans_DueDate ON Loans([DUE DATE]);