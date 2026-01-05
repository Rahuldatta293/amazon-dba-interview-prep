
---

# 📁 File 2  
## `day-5-postgresql-architecture-and-isolation/02-isolation-levels.md`

```md
# PostgreSQL Isolation Levels & Read Phenomena

## 1. What is Transaction Isolation?

Transaction isolation defines **how visible changes made by one transaction are to others**.

PostgreSQL uses **MVCC (Multi-Version Concurrency Control)** to implement isolation.

---

## 2. Isolation Levels in PostgreSQL

PostgreSQL supports:
1. Read Uncommitted
2. Read Committed (default)
3. Repeatable Read
4. Serializable (not covered deeply here)

Important:
> PostgreSQL internally treats READ UNCOMMITTED as READ COMMITTED.

---

## 3. Read Phenomena (Problems Isolation Tries to Prevent)

### 3.1 Dirty Read

Definition:
- Reading uncommitted data from another transaction

Example:
- Transaction A updates balance but does not commit
- Transaction B reads that value

PostgreSQL:
❌ Dirty reads are **not allowed**

---

### 3.2 Non-Repeatable Read

Definition:
- Same query returns different results within the same transaction

Cause:
- Another transaction commits changes between reads

---

### 3.3 Phantom Read

Definition:
- New rows appear in repeated query results

Cause:
- Another transaction inserts matching rows

---

## 4. Isolation Level: Read Committed (Default)

### Behavior:
- Each SQL statement sees a **fresh snapshot**
- Only committed data is visible

### Example (Bank Transfer)

Transaction A:
```sql
BEGIN;
SELECT balance FROM accounts WHERE id = 1;

Transaction B:

UPDATE accounts SET balance = 5000 WHERE id = 1;
COMMIT;


Transaction A (again):

SELECT balance FROM accounts WHERE id = 1;


Result:

Different values possible

Non-repeatable reads allowed

Characteristics:

No dirty reads

Non-repeatable reads possible

Phantom reads possible

5. Isolation Level: Repeatable Read
Behavior:

Entire transaction sees one consistent snapshot

Same query always returns same result

Example:

Transaction A:

BEGIN ISOLATION LEVEL REPEATABLE READ;
SELECT balance FROM accounts WHERE id = 1;


Transaction B:

UPDATE accounts SET balance = 8000 WHERE id = 1;
COMMIT;


Transaction A:

SELECT balance FROM accounts WHERE id = 1;


Result:

Same balance as first read

No non-repeatable reads

Characteristics:

No dirty reads

No non-repeatable reads

Phantom reads prevented (in PostgreSQL)

6. Read Uncommitted (PostgreSQL behavior)

PostgreSQL treats this as:

Same as READ COMMITTED

Dirty reads are never allowed, regardless of isolation level.

7. Snapshot Concept

Each transaction works with a snapshot:

Visible transaction IDs

Invisible transaction IDs

Snapshots are core to MVCC and isolation.

8. Comparison Table
Isolation Level	Dirty Read	Non-Repeatable Read	Phantom Read
Read Uncommitted	❌	✅	✅
Read Committed	❌	✅	✅
Repeatable Read	❌	❌	❌
9. Why Isolation Levels Matter for DBAs

Banking systems → consistency

Reporting queries → repeatable reads

OLTP systems → read committed

10. Interview Notes (Amazon)

Common questions:

Does PostgreSQL allow dirty reads? → No

Default isolation level? → Read Committed

How is isolation implemented? → MVCC snapshots

One-liner:

PostgreSQL uses MVCC snapshots rather than locking to implement transaction isolation.
