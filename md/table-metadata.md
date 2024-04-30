

<br/>

``` SQL
SELECT [TAB].[TABLE_SCHEMA] AS [TableSchema]
      ,[TAB].[TABLE_NAME] AS [TableName]
     
      ,[COL].[ORDINAL_POSITION] AS [ColumnPosition]
      ,[COL].[COLUMN_NAME] AS [ColumnName]

      ,(CASE WHEN [COL].[DATA_TYPE] IN ('VARCHAR', 'CHAR', 'NVARCHAR', 'NCHAR', 'VARBINARY', 'BINARY', 'TEXT')
             THEN CONCAT(
                          UPPER([COL].[DATA_TYPE])
                         ,'(', IIF([COL].[CHARACTER_MAXIMUM_LENGTH] = '-1', 'MAX', CONVERT(NVARCHAR(5), [COL].[CHARACTER_MAXIMUM_LENGTH])), ')'
                         ,IIF([COL].[IS_NULLABLE] = 'NO', ' NOT NULL', ' NULL')
                        )
             WHEN [COL].[DATA_TYPE] IN ('DECIMAL', 'NUMERIC')
             THEN CONCAT(
                          UPPER([COL].[DATA_TYPE])
                         ,'(', [COL].[NUMERIC_PRECISION], ',', [COL].[NUMERIC_SCALE], ')'
                         ,IIF([COL].[IS_NULLABLE] = 'NO', ' NOT NULL', ' NULL')
                        )
             ELSE CONCAT(
                          UPPER([COL].[DATA_TYPE])
                         ,IIF([COL].[IS_NULLABLE] = 'NO', ' NOT NULL', ' NULL')
                        )
             END) AS [DataType]

  FROM [INFORMATION_SCHEMA].[TABLES] AS [TAB]

       INNER JOIN [INFORMATION_SCHEMA].[COLUMNS] AS [COL]
               ON [COL].[TABLE_SCHEMA] = [TAB].[TABLE_SCHEMA]
              AND [COL].[TABLE_NAME] = [TAB].[TABLE_NAME]

 WHERE [TAB].[TABLE_SCHEMA] = 'dbo'
   AND [TAB].[TABLE_NAME] = 'CustTable'
```

<br/>
<br/>
<br/>
