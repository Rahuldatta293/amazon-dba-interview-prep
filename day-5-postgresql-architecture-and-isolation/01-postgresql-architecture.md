# PostgreSQL Architecture (Day 5)

## 1. Overview

PostgreSQL follows a **client–server architecture**.  
Clients send SQL queries, and the PostgreSQL server processes them through multiple internal stages before accessing data stored on disk.

High-level goals of PostgreSQL architecture:
- High concurrency
- Crash safety
- Strong consistency
- Extensibility

---

## 2. High-Level Architecture Flow

Client → PostgreSQL Server → Storage

Inside the PostgreSQL Server, a query passes through:
1. Parser
2. Planner / Optimizer
3. Executor
4. Storage & WAL

---

## 3. Client Layer

Clients can be:
- psql
- Applications (Java, Python, Node.js)
- ORMs (Hibernate, SQLAlchemy)

The client:
- Sends SQL queries
- Receives results
- Does NOT decide execution strategy

Example:
```sql
SELECT * FROM accounts WHERE account_id = 101;

## 4. PostgreSQL Server Internals
# 4.1 Parser

Responsibilities:

- Validates SQL syntax

- Verifies tables, columns, data types

- Converts SQL into a parse tree

Example:
~~~sql
SELEC * FROM accounts;

Result:

ERROR: syntax error at or near "SELEC"


If the parser fails, the query never reaches execution.

# 4.2 Planner / Optimizer

- This is the decision-making engine.

Responsibilities:

- Determines how to execute the query

Chooses between:

- Sequential Scan vs Index Scan

- Join methods (Nested Loop, Hash Join, Merge Join)

- Uses table statistics (ANALYZE)

Key concept:

PostgreSQL planner chooses the plan with the lowest estimated cost, not the lowest execution time guarantee.

Example:

SELECT * FROM orders WHERE order_id = 10;


Planner evaluates:

Table size

Index availability

Estimated rows returned

4.3 Executor

Responsibilities:

Executes the plan chosen by the planner

Fetches rows

Applies filters

Returns results to client

Important:

Executor does NOT optimize

Executor blindly follows the plan

5. Storage Layer

PostgreSQL stores data in:

Table files

Index files

WAL (Write Ahead Log)

Key components:

Data directory (base/)

WAL directory (pg_wal/)

Control files

6. Write Ahead Logging (WAL)

Rule:

Changes are first written to WAL, then to data files.

Benefits:

Crash recovery

Replication

Point-in-time recovery (PITR)

Example:

UPDATE accounts SET balance = balance - 100 WHERE id = 1;


Steps:

Change recorded in WAL

Data file updated later

Ensures durability

7. PostgreSQL Process Model

One Postgres backend process per client

Background processes:

Checkpointer

WAL writer

Autovacuum launcher

Autovacuum worker

This design improves isolation and stability.

8. Why Architecture Matters for a DBA

Slow queries → Planner & statistics

Locking issues → MVCC & isolation

Disk issues → WAL & checkpoints

Bloat → Autovacuum

9. Interview Notes (Amazon)

Be able to explain:

Difference between planner and executor

Why PostgreSQL scales well for concurrency

Role of WAL in durability

One-liner:

PostgreSQL separates query planning from execution and relies on MVCC instead of read locks to achieve high concurrency.
