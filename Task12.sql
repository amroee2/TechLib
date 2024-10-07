CREATE TRIGGER LogBookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
    SELECT 
        i.BookID, 
        CASE 
            WHEN d.[Current Status] = 'Available' AND i.[Current Status] = 'Loaned' THEN 'Available -> Loaned'
            WHEN d.[Current Status] = 'Loaned' AND i.[Current Status] = 'Available' THEN 'Loaned -> Available'
        END AS StatusChange,
        GETDATE()
    FROM 
        inserted i
    JOIN 
        deleted d ON i.BookID = d.BookID
    WHERE 
        (d.[Current Status] = 'Available' AND i.[Current Status] = 'Loaned') 
        OR (d.[Current Status] = 'Loaned' AND i.[Current Status] = 'Available');
END;
