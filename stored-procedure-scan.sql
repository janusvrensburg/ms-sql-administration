SELECT DISTINCT [OBJ].[name]
  FROM sys.sysobjects AS [OBJ]

       INNER JOIN sys.syscomments AS [TXT]
               ON [TXT].[id] = [OBJ].[id]

WHERE [text] LIKE '%%'
