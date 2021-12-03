# String Aggregation

<br/>

## Sample Dataset

``` SQL
DECLARE @@Data AS TABLE
       (
         [ID]  VARCHAR(10)
        ,[TXT] VARCHAR(10)
       );

INSERT INTO @@Data
VALUES ('1', 'A')
      ,('1', 'B')
      ,('2', 'A')
      ,('2', 'B')
      ,('2', 'C');
```

<br/>

## Sample Output

``` SQL
SELECT [ID]
      ,[TXT]
  FROM @@Data
 ORDER BY [ID] ASC
      ,[TXT] ASC;
```

<br/>

## Aggregated Output

``` SQL
SELECT [ID]
      ,STRING_AGG([TXT], ', ') WITHIN GROUP (ORDER BY [TXT] ASC) AS [TXT]
  FROM @@Data
 GROUP BY [ID]
 ORDER BY [ID] ASC;
```

<br/>
<br/>
<br/>