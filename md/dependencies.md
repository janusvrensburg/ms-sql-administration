
``` SQL
SELECT [OBJ].[type_desc] AS [ObjectType]
      ,[SCH].[name] AS [ObjectSchema]
      ,[OBJ].[name] AS [ObjectName]

      ,[referenced_database_name] AS [ReferencedDatabase]
      ,[referenced_schema_name] AS [ReferencedSchema]
      ,[referenced_entity_name] AS [ReferencedObject]

  FROM [sys].[sql_expression_dependencies] AS [DEP]

       INNER JOIN [sys].[objects] AS [OBJ]
               ON [OBJ].[object_id] = [DEP].[referencing_id]

       INNER JOIN [sys].[schemas] AS [SCH]
               ON [SCH].[schema_id] = [OBJ].[schema_id]

 WHERE 1 = 1
   AND [SCH].[name] = 'dbo' -- Schema Name
   AND [OBJ].[name] = 'DimCustomer' -- Object Name
```
