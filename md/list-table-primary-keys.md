
<br/>

```SQL
SELECT [TBL_CON].[TABLE_SCHEMA] AS [SchemaName]
      ,[TBL_CON].[TABLE_NAME] AS [TableName]
      ,[TBL_CON_COL].Column_Name AS [PrimaryKey]
  FROM [INFORMATION_SCHEMA].[TABLE_CONSTRAINTS] AS [TBL_CON]

       INNER JOIN [INFORMATION_SCHEMA].[CONSTRAINT_COLUMN_USAGE] AS [TBL_CON_COL]
               ON [TBL_CON_COL].[CONSTRAINT_NAME] = [TBL_CON].[CONSTRAINT_NAME]
              AND [TBL_CON_COL].[TABLE_SCHEMA] = [TBL_CON].[TABLE_SCHEMA]
              AND [TBL_CON_COL].[TABLE_NAME] = [TBL_CON].[TABLE_NAME]


 WHERE [TBL_CON].[CONSTRAINT_TYPE] = 'PRIMARY KEY'
   AND [TBL_CON_COL].[TABLE_NAME] = 'CustTable'

```

<br/>
<br/>
<br/>