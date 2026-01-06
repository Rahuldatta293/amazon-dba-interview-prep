# Autovacuum & Transaction ID Wraparound (Day 6)

## 1. Why Autovacuum exists
PostgreSQL uses MVCC, which creates multiple row versions.
Old row versions (dead tuples) must be cleaned to:
- free space
- improve performance
- maintain correct visibility

Autovacuum does this automatically.

---

## 2. Dead tuples and visibility
A dead tuple is a row version that:
- was created by a committed transaction
- was deleted/updated by another committed transaction
- is no longer visible to any active snapshot

Autovacuum removes dead tuples only when no transaction can see them.

---

## 3. Transaction IDs (XIDs)
Every transaction gets a transaction ID.
XIDs are 32-bit and finite.

If old XIDs are not handled correctly, wraparound can occur.

---

## 4. Why wraparound is dangerous
Visibility rules rely on comparing transaction IDs.
After wraparound, PostgreSQL may misinterpret old rows as new.

This can lead to data corruption.

---

## 5. FREEZE concept
Autovacuum freezes very old rows.
Frozen rows:
- are treated as always visible
- no longer participate in XID comparisons
- are safe from wraparound issues

---

## 6. Role of Autovacuum
Autovacuum:
- removes dead tuples
- updates planner statistics
- freezes old tuples to prevent wraparound

---

## 7. What happens if Autovacuum is disabled
- Dead tuples accumulate
- Table bloat increases
- Queries slow down
- Transaction ID wraparound risk increases
- PostgreSQL may shut down to protect data

---

## 8. Interview notes
- Autovacuum is critical for PostgreSQL stability
- Wraparound prevention is as important as performance
- DBAs must monitor vacuum and frozen XIDs

