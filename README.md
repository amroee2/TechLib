# TechLib

ERD Diagram

![image](https://github.com/user-attachments/assets/8fb7c49e-b12e-462b-b6c4-b706875a74e0)

# Task1: Retrieve all books borrowed by a specific borrower, including those currently unreturned.

Simple join query with a where clause specifying the borrower.

# Task2: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs.

Used CTE to get loans with no return date, then joined it on borrowers and filtered for count > 2

# Task3: Rank borrowers based on borrowing frequency.

Use Rank() window function to rank the rows based on the count of a borrower id.

# Task4: Identify the most popular genre for a given month.

Uses Month() function on the Date Borrowed and then groups by Genre.

# Task5: Add New Borrowers using procedures

Design a procedure that accepts all borrower information, checking through a query if the email exists and depending on the result a new borrower is inserted

# Task6: Calculate Overdue Fees

Implementation: Charge fees based on overdue days: $1/day for up to 30 days, $2/day after.

Assume this row

![image](https://github.com/user-attachments/assets/ad7a2646-bf0a-4b5c-87bb-8bc8fa49ea79)

Due Date is Oct 27 2023, Today is Oct 3 2024, 342 days difference

30 days costing 1$ Each, 312 costing 2$ Each 

(312 * 2) + 30 = 654

# Task7: Book Borrowing Frequency

Implementation: Count the number of times the book has been issued.

Counts the number of times a specified BookId was shown in the Loans table 

# Task8: List all books overdue by more than 30 days with their associated borrowers.

Finds the difference between Date Returned and Due date using DATEDIFF() Function and checks if its over 30 or not

# Task9: Rank authors by the borrowing frequency of their books.

Uses Rank() window function and groups by the book's author

# Task 10: Determine the preferred genre of different age groups of borrowers. (Groups are (0,10), (11,20), (21,30)…)

First of all, we create 2 functions, one to calculate the age (simple subtraction) and one that gets the age group (through case statements)

Then we use 2 CTES to make the query simpler.

BorrowerGenres -> Selects borrower information with their age, age group and the genre of the book they borrowed 

GenreRanked -> Groups each age group and genre together, partitions by age group (since we need rank 1 genre for each group) and finds the count 

And a simple query at the end to only display rows where the genre rank for each age group is 1

# Task 11: Borrowed Books Report

Implementation: Retrieve all books borrowed within the given range, with details like borrower name and borrowing date.

Simply a procedure that accepts the start and end dates, and uses where to check if its larger than the start date but smaller than the end one

# Task 12: Design a trigger to log an entry into a separate AuditLog table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa. The AuditLog should capture BookID, StatusChange, and ChangeDate.

Just uses case statements to check if its currently available or loaned to determine "StuatusChange", and then uses GETDATE() to get the current time 

Assume these two rows
![image](https://github.com/user-attachments/assets/6d886587-bf4b-4f5b-95d6-915443425b91)

after updating them

![image](https://github.com/user-attachments/assets/e8d4ffa5-be00-4141-8928-1586ce58e0a4)

Audit log has these two rows

![image](https://github.com/user-attachments/assets/0d01ffc8-eab4-4c69-b023-f3f70056f37e)

# Task 13: Design a stored procedure that retrieves all borrowers who have overdue books. Store these borrowers in a temporary table, then join this temp table with the Loans table to list out the specific overdue books for each borrower.

Simply checks 2 conditions

1- If date returned is bigger than due date

2- If the current date is bigger than due date AND that date returned is Null

