
DECLARE @Search NVARCHAR(MAX) = ''

SELECT DISTINCT [OBJ].[type_desc]   AS [Object_Type]
      ,[SCH].[name]                 AS [Object_Schema]
      ,[OBJ].[name]                 AS [Object_Name]

  FROM [sys].[objects] AS [OBJ]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

       INNER JOIN [sys].[syscomments] AS [TXT]
               ON [TXT].[id] = [OBJ].[object_id]

 WHERE [TXT].[text] LIKE CONCAT('%', @Search, '%')
   AND 
       (
            [OBJ].[type_desc] LIKE '%view%'
         OR [OBJ].[type_desc] LIKE '%stored%procedure%'
       );

GO

