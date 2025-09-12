
# Setup (shared)

```sql
-- Dimension (SCD1 with inferred flag)
CREATE TABLE IF NOT EXISTS dim_customer (
  customer_sk  BIGINT GENERATED ALWAYS AS IDENTITY,
  customer_id  BIGINT NOT NULL,
  name         STRING,
  region       STRING,
  is_inferred  BOOLEAN DEFAULT true,
  inferred_at  TIMESTAMP,
  confirmed_at TIMESTAMP,
  updated_at   TIMESTAMP
) USING DELTA;

-- Facts with surrogate key
CREATE TABLE IF NOT EXISTS fact_transaction (
  txn_id      STRING,
  txn_date    DATE,
  amount      DECIMAL(18,2),
  customer_sk BIGINT
) USING DELTA;

-- Natural-key landing for late-binding (used in approach 3)
CREATE TABLE IF NOT EXISTS fact_transaction_nk (
  txn_id      STRING,
  txn_date    DATE,
  amount      DECIMAL(18,2),
  customer_id BIGINT
) USING DELTA;

-- Example batch inputs (replace with your ingestion sources)
CREATE OR REPLACE TEMP VIEW stg_fact_txn AS
SELECT * FROM VALUES
  ('T1', DATE'2025-09-01', 200.00, 101),
  ('T2', DATE'2025-09-01', 350.00, 102),
  ('T3', DATE'2025-09-02', 120.00, 103)
AS v(txn_id, txn_date, amount, customer_id);

CREATE OR REPLACE TEMP VIEW stg_customer AS
SELECT * FROM VALUES
  (102, 'Bob',   'US-East'),
  (103, 'Carol', 'US-West')
AS v(customer_id, name, region);
```

---

# 1) Placeholder / Inferred Members

```sql
-- 1a) Insert placeholders for any missing customers referenced by facts
INSERT INTO dim_customer (customer_id, name, region, is_inferred, inferred_at, updated_at)
SELECT DISTINCT f.customer_id,
       'Unknown', 'Unknown', true, current_timestamp(), current_timestamp()
FROM stg_fact_txn f
LEFT ANTI JOIN dim_customer d
  ON d.customer_id = f.customer_id;

-- 1b) Load facts by resolving business key -> surrogate key
INSERT INTO fact_transaction (txn_id, txn_date, amount, customer_sk)
SELECT f.txn_id, f.txn_date, f.amount, d.customer_sk
FROM stg_fact_txn f
JOIN dim_customer d
  ON d.customer_id = f.customer_id;

-- 1c) Later: backfill placeholders with real attributes (SCD1)
MERGE INTO dim_customer AS tgt
USING (
  SELECT customer_id, name, region
  FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) rn
    FROM stg_customer
  ) WHERE rn = 1
) AS src
ON tgt.customer_id = src.customer_id
WHEN MATCHED THEN UPDATE SET
  tgt.name         = src.name,
  tgt.region       = src.region,
  tgt.is_inferred  = false,
  tgt.confirmed_at = COALESCE(tgt.confirmed_at, current_timestamp()),
  tgt.updated_at   = current_timestamp()
WHEN NOT MATCHED THEN INSERT (customer_id, name, region, is_inferred, confirmed_at, updated_at)
VALUES (src.customer_id, src.name, src.region, false, current_timestamp(), current_timestamp());
```

---

# 2) Fact Staging / Retry

```sql
-- 2a) Create staging table (persisted)
CREATE TABLE IF NOT EXISTS fact_transaction_staging (
  txn_id      STRING,
  txn_date    DATE,
  amount      DECIMAL(18,2),
  customer_id BIGINT
) USING DELTA;

-- 2b) Split the batch: load resolvable now; stage unresolved
-- Load resolvable directly to fact
INSERT INTO fact_transaction (txn_id, txn_date, amount, customer_sk)
SELECT f.txn_id, f.txn_date, f.amount, d.customer_sk
FROM stg_fact_txn f
JOIN dim_customer d
  ON d.customer_id = f.customer_id;

-- Stage unresolved (no matching dim)
INSERT INTO fact_transaction_staging
SELECT f.txn_id, f.txn_date, f.amount, f.customer_id
FROM stg_fact_txn f
LEFT ANTI JOIN dim_customer d
  ON d.customer_id = f.customer_id;

-- 2c) When customer dim arrives, first upsert dim (SCD1)
MERGE INTO dim_customer AS tgt
USING (
  SELECT customer_id, name, region
  FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) rn
    FROM stg_customer
  ) WHERE rn = 1
) AS src
ON tgt.customer_id = src.customer_id
WHEN MATCHED THEN UPDATE SET
  tgt.name         = src.name,
  tgt.region       = src.region,
  tgt.is_inferred  = false,
  tgt.confirmed_at = COALESCE(tgt.confirmed_at, current_timestamp()),
  tgt.updated_at   = current_timestamp()
WHEN NOT MATCHED THEN INSERT (customer_id, name, region, is_inferred, confirmed_at, updated_at)
VALUES (src.customer_id, src.name, src.region, false, current_timestamp(), current_timestamp());

-- 2d) Move resolvable rows from staging to fact
INSERT INTO fact_transaction (txn_id, txn_date, amount, customer_sk)
SELECT s.txn_id, s.txn_date, s.amount, d.customer_sk
FROM fact_transaction_staging s
JOIN dim_customer d
  ON d.customer_id = s.customer_id;

-- 2e) Delete moved rows from staging
DELETE FROM fact_transaction_staging
WHERE customer_id IN (SELECT customer_id FROM dim_customer);
```

---

# 3) Late-Binding Views (Query-Time Join)

```sql
-- 3a) Land facts with natural key only (no FK resolution at load)
INSERT INTO fact_transaction_nk (txn_id, txn_date, amount, customer_id)
SELECT txn_id, txn_date, amount, customer_id
FROM stg_fact_txn;

-- 3b) Reporting view binds to the latest dimension at query time
CREATE OR REPLACE VIEW v_fact_transaction_enriched AS
SELECT
  f.txn_id,
  f.txn_date,
  f.amount,
  f.customer_id,
  COALESCE(d.name,   'Unknown') AS customer_name,
  COALESCE(d.region, 'Unknown') AS customer_region
FROM fact_transaction_nk f
LEFT JOIN dim_customer d
  ON d.customer_id = f.customer_id;

-- 3c) (Optional) Later, materialize SK-based facts when dims are ready
INSERT INTO fact_transaction (txn_id, txn_date, amount, customer_sk)
SELECT f.txn_id, f.txn_date, f.amount, d.customer_sk
FROM fact_transaction_nk f
JOIN dim_customer d
  ON d.customer_id = f.customer_id;
```
