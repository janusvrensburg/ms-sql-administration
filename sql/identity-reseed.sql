
SET QUOTED_IDENTIFIER OFF
GO

DECLARE @Table_Schema VARCHAR(MAX) = ''
DECLARE @Table_Name   VARCHAR(MAX) = ''
DECLARE @Column_Name  VARCHAR(MAX) = ''

-- Confirm object existence before initiating reseed
DECLARE @Check INT = 
       (
         SELECT COUNT(1)
           FROM [INFORMATION_SCHEMA].[COLUMNS]
          WHERE [TABLE_SCHEMA] = @Table_Schema
            AND [TABLE_NAME]   = @Table_Name
            AND [COLUMN_NAME]  = @Column_Name
       );

IF @Check = 1

BEGIN

-- Compile Dynamic SQL
DECLARE @SQL NVARCHAR(MAX) = "
DECLARE @Seed INT = 
       (
         SELECT (ISNULL(MAX([" + @Column_Name + "]), 0) + 1)
           FROM [" + @Table_Schema + "].[" + @Table_Name + "]
       );

DBCC CHECKIDENT('[" + @Table_Schema + "].[" + @Table_Name + "]', RESEED, @Seed);
"

-- Execute Dynamic SQL
EXEC(@SQL);

END

GO
