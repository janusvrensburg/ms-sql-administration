# String Aggregation

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
      ,('2', 'A')
      ,('2', 'B')
      ,('2', 'C');


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
