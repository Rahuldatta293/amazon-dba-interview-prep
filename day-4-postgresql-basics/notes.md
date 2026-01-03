What is PostgreSQL?

PostgreSQL is an open-source, relational database management system (RDBMS) that follows a client-server architecture. It is known for reliability, strong data integrity, extensibility, and standards compliance.

PostgreSQL is commonly used for transactional systems, analytics, and mission-critical workloads.

PostgreSQL Client–Server Architecture (High Level)

Clients (psql, applications, BI tools) send SQL queries

PostgreSQL server processes requests

Data is stored on disk

Results are returned to the client

Each client connection is handled by a separate backend process.

Database Structure in PostgreSQL

Cluster → physical data directory

Database → logical container inside a cluster

Schema → namespace inside a database

Table → stores rows and columns

This structure helps with organization, isolation, and access control.

Primary Key

A Primary Key uniquely identifies each row in a table.

Characteristics:

Must be unique

Cannot be NULL

Only one primary key per table

Primary keys are critical for:

Data integrity

Identifying rows

Supporting relationships between tables

Unique Key

A Unique Key ensures uniqueness of values in a column or set of columns.

Characteristics:

Ensures uniqueness

Allows NULL values (implementation-specific)

Multiple unique keys can exist in a table

Primary Key vs Unique Key
Primary Key	Unique Key
Identifies a row	Enforces uniqueness
Cannot be NULL	NULL may be allowed
Only one per table	Multiple allowed
Used for relationships	Used for constraints
What is an Index?

An index is a data structure that improves the speed of data retrieval operations on a table.

Indexes allow PostgreSQL to locate rows quickly without scanning the entire table.

Why Indexes Improve Read Performance

Without an index, PostgreSQL performs a sequential scan, checking every row.

With an index:

PostgreSQL uses the index to find matching rows quickly

Fewer disk reads

Faster SELECT queries

Why Indexes Affect Write Performance

Indexes must be maintained during:

INSERT

UPDATE

DELETE

Each write operation may require updating multiple indexes, which adds overhead.

Read vs Write Trade-off (DBA Perspective)

More indexes → faster reads, slower writes

Fewer indexes → slower reads, faster writes

A DBA must balance:

Query performance

Data modification workload

System resources

When NOT to Use Indexes

Indexes are not always beneficial:

Very small tables

Columns with low cardinality (few distinct values)

Tables with heavy write operations

Queries that retrieve most of the table

Interview Explanation (How I Would Say It)

PostgreSQL uses a client-server architecture where each connection is handled by a backend process. Primary keys uniquely identify rows and enforce data integrity. Indexes improve read performance by avoiding full table scans but introduce overhead on write operations. As a DBA, index usage must balance read performance and write cost.

Key Takeaways

PostgreSQL emphasizes reliability and data integrity

Keys ensure correctness

Indexes are powerful but must be used carefully

DBA decisions are always about trade-offs

Areas to Improve

PostgreSQL internal processes

MVCC and concurrency handling

Index types and performance tuning

Practice Source

PostgreSQL Official Documentation

Hands-on experimentation
