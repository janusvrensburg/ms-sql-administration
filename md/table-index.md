# Table Indexing


<!--- Spacing --->
<br />
<br />
<br />
<!--- Spacing --->


<!--- Page Break --->
<div style="page-break-after: always"> 
<!--- Page Break --->


## Tables with Indexes

<br />

``` SQL
SELECT [SCH].[name]             AS [Table_Schema]
      ,[OBJ].[name]             AS [Table_Name]

      ,[IDX].[name]             AS [Index_Name]
      ,[IDX].[type_desc]        AS [Index_Type]
      ,[IDX].[is_primary_key]   AS [Is_Primary_Key]
      ,[IDX].[is_unique]        AS [Is_Unique]

  FROM [sys].[objects] AS [OBJ]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

       INNER JOIN [sys].[indexes] AS [IDX]
               ON [IDX].[object_id] = [OBJ].[object_id]

 WHERE [OBJ].[type] = 'U'
   AND [SCH].[name] LIKE '%dbo%'
   AND [OBJ].[name] LIKE '%%'

 ORDER BY [SCH].[name] ASC
      ,[OBJ].[name] ASC;
```


<!--- Spacing --->
<br />
<br />
<br />
<!--- Spacing --->
    
      
<!--- Page Break --->
<div style="page-break-after: always"> 
<!--- Page Break --->      
  

## Tables with no Indexes

<br />
      
``` SQL    
SELECT [SCH].[name]             AS [Table_Schema]
      ,[OBJ].[name]             AS [Table_Name]
  FROM [sys].[objects] AS [OBJ]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

       LEFT JOIN [sys].[indexes] AS [IDX]
              ON [IDX].[object_id] = [OBJ].[object_id]

 WHERE [OBJ].[type] = 'U'
   AND [SCH].[name] LIKE '%%'
   AND [OBJ].[name] LIKE '%%'

   AND [IDX].[name] IS NULL

 ORDER BY [SCH].[name] ASC
      ,[OBJ].[name] ASC;
```
      

