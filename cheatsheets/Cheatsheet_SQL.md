Cheatsheet_SQL

---

Basics
SQL files have the extension .sql
Data is stored in databases, comprised of tables, with associated views, procedures, triggers and functions.
Objects in SQL are referenced as [database_name].[object_name]

-- handling data
When run SQL returns an output dataset, or depending on the structure multiple datasets / exports / updates.

The following actions define and structure a dataset / export.

SELECT
FROM
JOIN
WHERE
GROUP BY
ORDER BY
HAVING

SELECT - Restricting columns
List all required columns / formulae between the SELECT and FROM commands

FROM - define data sources
List the data sources to be used in the query in the form database.table.  multiple tables can be defined, separated by commas - this will generate a Cartesian 


-- date and time 
-- joins
Joins are fundamental to sql and involve linking two datasets together using specified fields that are the same in both datasets to link them together.  Queries can then operate on all joined datasets as if they were one dataset.

1 to 1 join
  From table1 alias1
  Join table2 alias2 ON alias2.field1 =
    alias2.field1 and alias2.field2 = 
    alias1.field2

Joins can be
Join table2 ... 
Return ONLY the matching records
Left join table2 ...

Right join table2 ...
Full join table2 ...

-- select
-- group by
-- order by
-- having
-- limit
-- aggregate operations
-- partitions
-- procedures
-- functions
-- subqueries
-- structural flow
-- create
-- alter
-- indexes
-- drop and truncate
-- logging
-- exporting
-- filtering where
-- triggers
-- views


-- de-duplication
-- query speed

