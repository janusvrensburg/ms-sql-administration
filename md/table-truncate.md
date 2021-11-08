# Truncate Tables
This script can be used to script truncate table statements for a set of tables

<br>

```sql
SELECT [SCH].[name]                                                                            AS [Table_Schema]
      ,[OBJ].[name]                                                                            AS [Table_Name]

      ,ISNULL([IDX].[rowcnt], 0)                                                               AS [Row_Count]

      ,CONCAT('TRUNCATE TABLE ', QUOTENAME([SCH].[name]), '.', QUOTENAME([OBJ].[name]), ';')   AS [SQL_Truncate]

  FROM [sys].[objects] AS [OBJ]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

       LEFT JOIN [sys].[sysindexes] AS [IDX]
              ON [IDX].[id]    = [OBJ].[object_id]
             AND [IDX].[indid] < 2

 WHERE [OBJ].[type] = 'U' -- Tables Only
   AND [SCH].[name] LIKE '%%'
   AND [OBJ].[name] LIKE '%%'

 ORDER BY [SCH].[name] ASC
      ,[OBJ].[name] ASC;
```
