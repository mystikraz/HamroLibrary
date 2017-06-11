CREATE TABLE [dbo].[Loan]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [book_id] INT NULL, 
    [m_id] INT NULL, 
    [date_out] DATE NULL, 
    [date_return] DATE NULL, 
    [due_date] DATE NULL, 
    [charge] INT NULL, 
    [panalty] INT NULL, 
    [created_at] DATE NULL, 
    [updated_at] DATE NULL, 
    )