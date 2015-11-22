##Database Systems - Overview

#####1.What database models do you know?
There are 4 database models:
- Hierarchical (tree)
- Network / graph
- Relational (table)
- Object-oriented

#####2. Which are the main functions performed by a Relational Database Management System (RDBMS)?
- Relational Database Management Systems (RDBMS) manage data stored in tables
- RDBMS systems typically implement
-- Creating / altering / deleting tables and relationships between them (database schema)
-- Adding, changing, deleting, searching and retrieving of data stored in the tables
-- Support for the SQL language
-- Transaction management (optional)

#####3. Define what is "table" in database terms.
- Database tables consist of data, arranged in rows and columns
- All rows have the same structure
- Columns have name and type (number, string, date, image, or other)

#####4. Explain the difference between a primary and a foreign key.
- Primary key is a column of the table that uniquely identifies its rows (usually it is a number)
-- Two records (rows) are different if and only if their primary keys are different
-- The primary key can be composed by several columns (composite primary key)
- The foreign key is an identifier of a record located in another table (usually its primary key)

#####5. Explain the different kinds of relationships between tables in relational databases.
- By using relationships we avoid repeating data in the database
- Relationships are three types:
-- One-to-many – A single record in the first table has many corresponding records in the second table(e.g. country / towns)
-- Many-to-many – Records in the first table have many correspon-ding records in the second one and vice versa(e.g. student / course)
-- One-to-one – A single record in a table corresponds to a single record in the other table(e.g. example human / student)

#####6. When is a certain database schema normalized?
	Database normalisation is the process of organizing the columns (attributes) and tables (relations) of a relational database to minimize data redundancy. Normalisation involves decomposing a table into less redundant tables without losing information.

#####7. What are database integrity constraints and when are they used?
- Integrity constraints
-- Ensure data integrity in the database tables
-- Enforce data rules which cannot be violated
- Primary key constraint
-- Ensures that the primary key of a table has unique value for each table row
- Unique key constraint
-- Ensures that all values in a certain column (or a group of columns) are unique
- Foreign key constraint
-- Ensures that the value in given column is a key from another table
- Check constraint
-- Ensures that values in a certain column meet some predefined condition

#####8. Point out the pros and cons of using indexes in a database.
- Indices speed up searching of values in a certain column or group of columns
- Usually implemented as B-trees
- Indices can be built-in the table (clustered) or stored externally (non-clustered)
- Adding and deleting records in indexed tables is slower!
- Indices should be used for big tables only (e.g. 50 000 rows)

#####9. What's the main purpose of the SQL language?
- Standardized declarative language for manipulation of relational databases
- Creating, altering, deleting tables and other objects in the database
- Searching, retrieving, inserting, modifying and deleting table data (rows)
- Consist of SQL-like code stored in the database
- Code executed inside the database server
- Much faster than an external code
- Data is locally accessible
- Can accept parameters
- Can return results

#####10. What are transactions used for?
- Transactions are a sequence of database operations which are executed as a single unit:
-- Either all of them execute successfully
-- Or none of them is executed at all
- Exemple:
-- All the members of a family are moving to a new town they live in.
-- If one member cannot move all the operations are canceled.

#####11. What is a NoSQL database?
NoSQL database is a non-relational databases.
- Use document-based model (non-relational)
- Schema-free document storage
-- Still support CRUD operations
-- Create, Read, Update, Delete
-- Still support indexing and querying
- Still supports concurrency and transactions
- Highly optimized for append / retrieve
- Great performance and scalability

#####12. Explain the classical non-relational data models.
- Data stored as documents
- Single entity (document) is a single record
- Documents do not have a fixed structure

#####13. Give few examples of NoSQL databases and their pros and cons.
- "Redis" - Ultra-fast in-memory data structures server
- "MongoDB" - Mature and powerful JSON-document database
- "CoucheDB" - JSON-based document database with REST API
- "Cassandra" - Distributed wide-column database