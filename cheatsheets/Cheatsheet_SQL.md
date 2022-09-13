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
List all required columns / formulae to create columns between the SELECT and FROM commands

FROM - define data sources
List the data sources to be used in the query in the form database.table.  multiple tables can be defined, separated by commas - this will generate a Cartesian 


-- date and time 
-- JOINS --
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

-- WHERE --
The where section filters the data returned in the query.  Each line is a clause that restricts in the format
FIELD operator condition / subquery

-- GROUP BY --
Group by will aggregate data using the columns indicated.  Under normal circumstances group by will feature the same fields as the select section.

-- ORDER BY --
Order by will sort data using only the columns indicated from left to right, use asc / desc to change sort direction.

-- HAVING --
Having uses 'where' clauses to filter the dataset, however these are applied AFTER the data is compiled & grouped from the clauses above, Similar to using a subquery.

-- limit
Use a limit after a group by to restrict the number of rows returned to a fixed number.
Limit 100

-- aggregate operations
-- partitions
Partitions allow subgrouping of a dataset to apply aggregate / rank functions without a subquery, while having the output available to the current select query.

-- procedures
Procedures allow for separating large sections of code into smaller freestanding modules.  They are called with optional arguments, and can return optional output available to the parent query, or adjust datasets shared between queries.
The variables of the procedure / parent query are out of scope of the parent query.

-- FUNCTIONS --
Functions are similar to procedures but always return a single output value which can be used inline in a formula / expression.

-- SUBQUERIES --
A subquery is a new nested query that replaces a dataset in the parent query, eg a whole FROM, or part of a select / where as the argument of an 'in'.

-- structural flow

-- create
Create is an alternative to a select query and is used to define a permanent or temporary dataset.  Its structure is different to a normal select query.

-- alter --
Alter is an alternative to a select query that makes changes to end existing permanent or temporary table.

-- truncate
Truncate is a short select alternative that empties all the data in a table.
Truncate [table_name];

-- drop
Drop is a short select alternative that deletes a table structure and all its data.

-- indexes
Indexes organise the fields of the index to optimise searching of field contents on demand.  The speed increase is exponential with number of rows, but requires some more storage, and has an overhead for recalculation when the underlying table data changes.  
All fields used in joins and major where clauses should be indexed.
Indexes only apply to the tables fields directly, not once the table is involved in a subquery / aggregation, and are ignored when not using the whole of a field eg substring.

-- logging
When doing complex multi step procedures it is a good idea to create a log table and write a user / date / time / operation log to it between (after) each step to aid with debugging and reporting.

-- exporting
Data can be exported by encapsulating the select query, however column names are not automatically exported so these will need to be unioned into the main query as part of the export.

-- triggers
Triggers are procedures that activate upon specified events eg changes to a table.

-- views


-- de-duplication
-- query speed

