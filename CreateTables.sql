CREATE TABLE Books
(
	BookId INT IDENTITY PRIMARY KEY,
	Author VARCHAR(50) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	ISBN VARCHAR(50) NOT NULL UNIQUE,
	[Published Date] DATE NOT NULL,
	Genre VARCHAR(50) NOT NULL,
	[Shelf Location] VARCHAR(50) NOT NULL,
	[Current Status] VARCHAR(10),
	CONSTRAINT chk_current_status CHECK ([Current Status] IN ('Available', 'Loaned'))
);

CREATE TABLE Borrowers
(
	BorrowerId INT IDENTITY PRIMARY KEY,
	[First Name] VARCHAR(50) NOT NULL,
	[Last Name] VARCHAR(50) NOT NULL,
	Email VARCHAR(50) UNIQUE NOT NULL,
	[Date Of Birth] DATE NOT NULL,
	[Membership Date] DATE NOT NULL
);

CREATE TABLE Loans
(
	LoanID INT IDENTITY PRIMARY KEY,
	BookID INT FOREIGN KEY REFERENCES Books(BookId),
	BorrowerId INT FOREIGN KEY REFERENCES Borrowers(BorrowerId),
	[Date Borrowed] DATE NOT NULL,
	[DUE DATE] DATE NOT NULL,
	[Date Returned] DATE
)