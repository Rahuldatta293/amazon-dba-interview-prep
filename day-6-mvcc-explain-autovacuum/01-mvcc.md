# MVCC (Day 6) — Explain Like I’m New

## 1. Why MVCC exists
MVCC solves the problem of concurrency:
- Many users reading and writing the same data
- Without heavy blocking (locks)

Goal:
- Readers should not block writers
- Writers should not block readers (in most cases)
- Still maintain consistency

---

## 2. Simple definition
MVCC = **Multiple row versions + snapshots**
PostgreSQL can keep multiple versions of a row so each transaction sees a consistent view.

---

## 3. Bank example (real-world)
Initial: Account balance = 1000

T1 (Reader): `SELECT balance ...` sees 1000  
T2 (Writer): `UPDATE ...` makes a new version (900), but not committed

With MVCC:
- T1 still sees old committed version (1000)
- T1 is not blocked by T2
- No dirty reads

After T2 commits:
- New transactions can see 900
- Whether T1 sees 900 depends on its isolation level

---

## 4. Updates don’t overwrite (important)
In PostgreSQL, UPDATE is conceptually:
- old row version becomes outdated
- new row version is created

So MVCC creates old row versions (dead tuples).

---

## 5. Visibility / Snapshot concept
Each query uses a **snapshot**:
- Which transactions were committed before snapshot time
- Which transactions were in-progress
- Which started later

Visibility rule:
- Only committed data is visible
- Uncommitted changes from others are not visible

Connection to isolation:
- READ COMMITTED: snapshot per statement
- REPEATABLE READ: snapshot per transaction

---

## 6. Row metadata (concept only)
Rows include metadata like:
- created by which transaction
- deleted/updated by which transaction

(PostgreSQL tracks this using xmin/xmax transaction IDs.)

---

## 7. Dead tuples and why vacuum matters
Because PostgreSQL keeps old versions:
- Updates/deletes create dead tuples
- Dead tuples cause bloat and can slow queries
- VACUUM/AUTOVACUUM cleans them when safe
- Autovacuum also helps avoid transaction ID wraparound

---

## 8. MVCC + Index (interview point)
Indexes can point to row locations, but PostgreSQL must still check:
- whether that row version is visible to the snapshot

So an index hit does not guarantee the row is returned.

---

## 9. Quick hands-on demo (two sessions)
Session A:
BEGIN;
SELECT balance FROM accounts WHERE id=1;
-- keep transaction open

Session B:
BEGIN;
UPDATE accounts SET balance=900 WHERE id=1;
-- do not commit

Session A:
SELECT balance FROM accounts WHERE id=1;
-- still sees 1000 (no dirty reads)

Session B:
COMMIT;

Session A behavior now depends on isolation level:
- READ COMMITTED may see 900 on next statement
- REPEATABLE READ still sees 1000 until COMMIT

---

## 10. Interview one-liners
- PostgreSQL uses MVCC to allow readers and writers to proceed concurrently.
- Updates create new row versions; old versions remain as dead tuples.
- Snapshots decide visibility; no dirty reads.
- Vacuum/autovacuum cleans dead tuples and helps prevent transaction ID wraparound.

