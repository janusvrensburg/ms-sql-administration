
SELECT [OBJ].[type_desc]   AS [Object_Type]

      ,[SCH].[name]        AS [Object_Schema]
      ,[OBJ].[name]        AS [Object_Name]

  FROM [sys].[objects] AS [OBJ]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

 WHERE [SCH].[name] LIKE '%%'
   AND [OBJ].[name] LIKE '%%'
   AND 
       (
            [OBJ].[type_desc] LIKE '%user%table%'
         OR [OBJ].[type_desc] LIKE '%view%'
         OR [OBJ].[type_desc] LIKE '%stored%procedure%'
       )

 ORDER BY [OBJ].[type_desc] ASC
      ,[SCH].[name] ASC
      ,[OBJ].[name] ASC;

GO

