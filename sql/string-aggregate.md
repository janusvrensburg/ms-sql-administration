# String Aggregation

<br/>

## Compatibility

 - SQL Server 2017 (14.x) & later
 - Azure SQL Database
 - Azure SQL Managed Instance
 - Azure Synapse Analytics

<br/>

## Sample Script

``` SQL
-- Fabricate Sample Dataset
DECLARE @@Data AS TABLE
       (
         [ID]  VARCHAR(10)
        ,[TXT] VARCHAR(10)
       );

INSERT INTO @@Data
VALUES ('1', 'A')
      ,('1', 'B')
      ,('2', 'C')
      ,('2', 'D')
      ,('2', 'E');


-- Standard Output
SELECT [ID]
      ,[TXT]
  FROM @@Data
 ORDER BY [ID] ASC
      ,[TXT] ASC;


-- Aggregated Output
SELECT [ID]
      ,STRING_AGG([TXT], ', ') WITHIN GROUP (ORDER BY [TXT] ASC) AS [TXT]
  FROM @@Data
 GROUP BY [ID]
 ORDER BY [ID] ASC;
```

<br/>

## Sample Script Output:

```
(5 rows affected)


ID         TXT
---------- ----------
1          A
1          B
2          C
2          D
2          E


ID         TXT
---------- ----------
1          A, B
2          C, D, E
```

<br/>

## External Resources

- [Microsoft Docs: STRING_AGG](https://docs.microsoft.com/en-us/sql/t-sql/functions/string-agg-transact-sql?view=sql-server-ver15)
