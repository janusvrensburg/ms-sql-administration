
```SQL

SELECT [SCH].[name]                                 AS [Table_Schema]
      ,[OBJ].[name]                                 AS [Table_Name]

      ,CONVERT(DATETIME2(0), [OBJ].[create_date])   AS [Created_Date]
      ,CONVERT(DATETIME2(0), [OBJ].[modify_date])   AS [Last_Modified_Date]

      ,ISNULL([IDX].[rowcnt], 0)                    AS [Row_Count]

  FROM [sys].[objects] AS [OBJ]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

       LEFT JOIN [sys].[sysindexes] AS [IDX]
              ON [IDX].[id] = [OBJ].[object_id]
             AND [IDX].[indid] < 2

 WHERE 1 = 1

   -- AND [OBJ].[type] = 'U'
   -- AND [SCH].[name] LIKE '%%'
   -- AND [OBJ].[name] LIKE '%%'

 ORDER BY [SCH].[name] ASC
      ,[OBJ].[name] ASC

GO

```
