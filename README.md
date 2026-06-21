<div align="center">

<h1>Sharath Rama</h1>

<h3>Data Engineer &nbsp;|&nbsp; Platform Architecture &nbsp;|&nbsp; Lakehouse &nbsp;|&nbsp; Streaming &nbsp;|&nbsp; GenAI for Data</h3>

<p><em>I build data platforms that operate themselves — not just pipelines that run on schedules.</em></p>

<p>
  <img src="https://img.shields.io/badge/Experience-11%2B%20Years-0A66C2?style=flat-square" alt="Experience"/>
  <img src="https://img.shields.io/badge/Spark%20Pipelines-150%2B%20Production-E25A1C?style=flat-square&logo=apachespark&logoColor=white" alt="Spark"/>
  <img src="https://img.shields.io/badge/Pipeline%20Runtime%20Improvement-40%25-22C55E?style=flat-square" alt="ETL"/>
  <img src="https://img.shields.io/badge/Cloud%20Cost%20Savings-%2450K%2B%2Fyear-F59E0B?style=flat-square" alt="Cost"/>
  <img src="https://img.shields.io/badge/Incident%20Resolution-70%25%20Faster-8B5CF6?style=flat-square" alt="Incident"/>
</p>

</div>

---

## Professional Summary

Data Engineer with 11+ years architecting 60+ terabyte lakehouse platforms on AWS and Apache Spark — across financial services, insurance, telecoms, and financial-software SaaS. I set technical direction, define org-wide engineering standards, and drive adoption across data engineering teams. Track record of 30%+ cost takeouts and 30–40% performance gains from architecture-level intervention — not just code tuning.

---

## Stack

Engineers who claim everything as production experience aren't being honest. Here's where I draw the line.

| Operated in Production — real incidents, real metrics, real opinions | Architectural Depth — can design, evaluate, and defend in a review |
|---|---|
| Apache Spark (EMR Serverless + EC2), PySpark, Spark Structured Streaming | Apache Flink — stateful streaming, exactly-once checkpointing, watermark semantics |
| Apache Kafka — peak-load ingestion, partition sizing, exactly-once upsert | Databricks — Delta Live Tables, Unity Catalog, Runtime optimizations, cluster policies |
| Apache Airflow — production orchestration, SLA management, complex DAGs | Kubernetes-native Spark — Spark Operator, pod templating, node selectors |
| Parquet + Hive-partitioned S3 (primary production table format) | Apache Iceberg — compaction economics, manifest bloat, snapshot lifecycle *(deep operational knowledge via [`iceberg-health-monitor`](https://github.com/sharath-dataengineer/iceberg-health-monitor))* |
| Delta Lake — schema evolution, ACID writes, transaction log, Z-ordering | dbt — marts, lineage, testing patterns; would reach for it on a greenfield today |
| AWS EMR, Glue, Redshift, S3, Lambda, Kinesis | Monte Carlo — freshness/volume monitors, field-level lineage, circuit breakers |
| LLM tooling — Claude API, RAG pipelines, LLM-based RCA and DQ observability | Terraform, Kubernetes — infrastructure and platform engineering patterns |
| Python, SQL, Bash | Data Mesh, ML Platform / Feature Store — design-level depth, documented in playbooks |

---

## Architecture Expertise

### Built and Operated in Production

| Architecture | What I Have Actually Owned |
|---|---|
| **Medallion Lakehouse (CDC/SCD2)** | Bronze/Silver/Gold on S3 + EMR Serverless; SCD2 star-schema marts; advanced partitioning and merge strategies |
| **Declarative Config-Driven Pipelines** | 74 logical Spark pipelines as HOCON config; zero bespoke Spark code per table; multi-region/multi-environment parameterization — see [enterprise-data-foundation](https://github.com/sharath-dataengineer/enterprise-data-foundation) |
| **Real-Time Kafka Ingestion** | Streaming pipelines at peak load; sub-5-minute latency; 50+ stakeholders across product, analytics, and leadership |
| **Multi-System Funnel Attribution** | 7-day first-touch attribution across 5 source systems with no shared key — contact center → CRM → sales booking |
| **Data Quality as a Gate** | Golden-check DQ gates blocking publish (not just alerting); test coverage lifted from ~30% to >90% of active pipelines |
| **LLM-Augmented Observability** | Event-driven failure classification with LLM-generated root cause advisory — eliminates manual log triage |
| **LLM-Augmented DQ** | Auto-calibrated statistical thresholds (mean ± 2σ from 30-day partition history); LLM-generated anomaly explanations with upstream context — documented in [pipeline-health-monitor](https://github.com/sharath-dataengineer/pipeline-health-monitor) |
| **FinOps & Cost Attribution** | EMR FinOps dashboards with per-job and per-partition cost attribution |

### Design & Advisory Depth

| Architecture | Depth |
|---|---|
| **Data Mesh** | Domain ownership model, federated governance, data product contracts, self-serve infrastructure — documented in playbook |
| **ML Platform / Feature Store** | Feature store design, training/serving skew prevention, feature freshness SLAs |
| **Customer 360** | Identity graph design, behavioral + CRM + transactional unification |
| **Security** | Column-level encryption, row-level access policies, audit logging, VPC-isolated compute |

---

## Impact Metrics

| Metric | Result | Context |
|---|---|---|
| Production Spark pipelines owned | **150+** | Across financial, CRM, clickstream, contact center, and billing domains |
| Pipeline failure reduction | **−40%** | Defined and drove org-wide adoption of partitioning, merge, and SCD2 standards |
| Pipeline runtime improvement | **40%** | CDC-aware medallion lakehouse + Spark execution tuning + partition strategy on EMR Serverless |
| Compute cost reduction | **30%** | EMR Serverless right-sizing, shuffle reduction, partition strategy |
| Annual cloud savings | **$50K+** | FinOps dashboards with per-job cost attribution enabling targeted spend reduction |
| Incident resolution speed | **70% faster** | LLM-powered observability tool eliminating manual log triage |
| Data incident reduction | **−50%** | SLA-driven DQ gates across batch and streaming layers |
| DQ triage time | **−60%** | LLM-generated anomaly explanations + auto-calibrated statistical thresholds |
| Pipeline test coverage | **30% → 90%+** | Test-driven pipeline design rolled out org-wide |
| Stakeholders served | **50+** | Near-real-time Kafka dashboards across product, analytics, and leadership |

---

## Production Work

Three repositories documenting systems I built and operated at Intuit. Real incidents, real metrics, real architectural decisions.

<table>
<tr>
<td width="50%" valign="top">

### [enterprise-data-foundation](https://github.com/sharath-dataengineer/enterprise-data-foundation)

![Spark](https://img.shields.io/badge/Spark%20on%20EMR-Config--Driven-E25A1C?style=flat-square&logo=apachespark&logoColor=white)
![Attribution](https://img.shields.io/badge/7--Day%20Attribution-Funnel%20Analytics-0A66C2?style=flat-square)
![DQ](https://img.shields.io/badge/DQ%20Gate%20Pattern-50%25%20Incident%20Reduction-22C55E?style=flat-square)

A config-driven Spark-on-EMR analytics foundation stitching contact-center, CRM, clickstream, and sales-booking data into a governed recommendation→revenue funnel. 74 logical pipelines as HOCON config (zero bespoke Spark code per table), 7-day first-touch attribution across 5 source systems with no shared key, DQ gates that block publishing to executive dashboards. Forked across 5–6 environments × 11 regional variants.

</td>
<td width="50%" valign="top">

### [pipeline-health-monitor](https://github.com/sharath-dataengineer/pipeline-health-monitor)

![SparkListener](https://img.shields.io/badge/SparkListener-Event--Driven-E25A1C?style=flat-square)
![LightGBM](https://img.shields.io/badge/LightGBM-Risk%20Prediction-F59E0B?style=flat-square)
![LLM](https://img.shields.io/badge/Claude%20via%20Bedrock-LLM%20Advisory-8B5CF6?style=flat-square)

An event-driven pipeline health monitor with two paths: immediate failure alerting, and an AI path extracting 8 features from completed stages to predict failure risk before it happens. LightGBM risk predictor → policy tier engine → Claude-powered root cause advisory for P1/P2 alerts. Adaptive EMA baseline prevents false positives on anomalous runs. Result: **70% faster incident resolution**, manual log triage eliminated.

</td>
</tr>
<tr>
<td colspan="2" valign="top">

### [kafka-streaming-case-study](https://github.com/sharath-dataengineer/kafka-streaming-case-study)

![Kafka](https://img.shields.io/badge/Apache%20Kafka-Peak%20Load-231F20?style=flat-square&logo=apachekafka&logoColor=white)
![Streaming](https://img.shields.io/badge/Spark%20Structured%20Streaming-Sub--5min%20Latency-E25A1C?style=flat-square)
![DQ](https://img.shields.io/badge/Inline%20DQ-50%25%20Incident%20Reduction-22C55E?style=flat-square)

Real-time Kafka streaming pipelines processing millions of transactions per day at peak-season load — with sub-5-minute end-to-end latency serving 50+ stakeholders. The defining challenge: peak volume spikes 5–8× daily average, and the 5-minute SLA cannot slip when leadership is watching live dashboards during the highest-stakes window of the year. Covers partition sizing for peak, micro-batch tuning, exactly-once semantics via idempotent upsert, and inline DQ that routes bad rows to quarantine rather than crashing the stream.

</td>
</tr>
</table>

---

## Reference Architecture & Knowledge Base

Design thinking, architecture patterns, and depth knowledge — demonstrating how I approach problems I haven't yet been handed.

<table>
<tr>
<td width="50%" valign="top">

### [spark-performance-playbook](https://github.com/sharath-dataengineer/spark-performance-playbook)

![Spark](https://img.shields.io/badge/Apache%20Spark-Performance-E25A1C?style=flat-square&logo=apachespark&logoColor=white)
![Benchmarks](https://img.shields.io/badge/Production%20Benchmarks-Included-F59E0B?style=flat-square)

A production-grounded Spark performance playbook covering shuffle tuning, join strategy selection, AQE configuration, memory management, partition sizing, and EMR cluster configuration. Every technique applied on real workloads: 40% faster pipelines and 30% compute cost reduction at peak Intuit scale; comparable gains at earlier roles across insurance, finance data, and legal/financial data platforms.

</td>
<td width="50%" valign="top">

### [autonomous-data-platform](https://github.com/sharath-dataengineer/autonomous-data-platform)

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Kafka](https://img.shields.io/badge/Kafka-231F20?style=flat-square&logo=apachekafka&logoColor=white)
![Iceberg](https://img.shields.io/badge/Iceberg-0A66C2?style=flat-square)

Reference architecture for a self-operating data platform — extending the production monitoring patterns from `pipeline-health-monitor` into a fuller vision: schema drift detection, AI-powered RCA, cost attribution, and an LLM copilot. The monitoring core is derived from the production system at Intuit; the broader integrated platform is the architecture I would design given the mandate and a greenfield.

</td>
</tr>
<tr>
<td width="50%" valign="top">

### [data-engineering-playbook](https://github.com/sharath-dataengineer/data-engineering-playbook)

![Knowledge](https://img.shields.io/badge/Book--Chapter%20Depth-Deep%20Dives-E25A1C?style=flat-square)
![Topics](https://img.shields.io/badge/Spark%20%7C%20Kafka%20%7C%20Lakehouse-Topics%20Covered-F59E0B?style=flat-square)

Book-chapter-depth knowledge base: data modeling theory, Spark internals (shuffle, catalyst, memory), Kafka architecture, lakehouse design, distributed systems fundamentals, and FinOps. Written as the onboarding resource I wish existed — used for mentoring engineers on Spark internals, lakehouse design, and cloud-native patterns.

</td>
<td width="50%" valign="top">

### [iceberg-health-monitor](https://github.com/sharath-dataengineer/iceberg-health-monitor)

![Iceberg](https://img.shields.io/badge/Apache%20Iceberg-Open%20Source-22C55E?style=flat-square)
![Health](https://img.shields.io/badge/Table%20Health%20Scoring-Optimization-E25A1C?style=flat-square)

Open-source Iceberg table health tooling: composite health score per table based on snapshot age, small file ratio, manifest bloat, compaction lag, and partition skew. Built because Iceberg tables degrade silently in production — the operational gap the documentation does not cover.

</td>
</tr>
<tr>
<td width="50%" valign="top">

### [data-platform-reference-architecture](https://github.com/sharath-dataengineer/data-platform-reference-architecture)

![Architecture](https://img.shields.io/badge/12%20Architecture%20Patterns-Documented-8B5CF6?style=flat-square)
![Patterns](https://img.shields.io/badge/Trade--off%20Analysis-ADR%20Format-0A66C2?style=flat-square)

Architecture decision guides for 12 platform patterns: Customer 360, Lakehouse, Streaming, CDC, Data Mesh, ML Platform, Feature Store, Real-Time Analytics, Governance, Observability, FinOps, and Security. Each pattern covers failure modes and implementation constraints — written as the reference I'd want before an architecture review, not a tutorial.

</td>
<td width="50%" valign="top">

### [metadata-copilot](https://github.com/sharath-dataengineer/metadata-copilot)

![LLM](https://img.shields.io/badge/LLM%20Powered-Metadata%20Assistant-8B5CF6?style=flat-square)
![NL2SQL](https://img.shields.io/badge/NL--to--SQL-Lineage%20Discovery-0A66C2?style=flat-square)

An LLM-powered metadata assistant: automated lineage discovery from code and query history, natural language to SQL with schema awareness, ownership resolution, freshness analysis, and impact analysis for schema changes. Represents the applied GenAI direction where I see the most real leverage for data platform operators.

</td>
</tr>
</table>

---

## Engineering Leadership

The work that had the highest organizational leverage was not the pipelines I built — it was the standards I defined that other teams adopted, and the engineers I worked with who became more capable because of shared patterns.

### Org-Wide Standards — 40% Pipeline Failure Reduction

At Intuit, each data engineering team was solving the same problems independently: how to partition a table, how to handle SCD2 merges, how to structure incremental loads, how to write DQ checks. The result was fragmentation — teams with different merge strategies, different partitioning patterns, and pipelines that failed in unique, tribal-knowledge-dependent ways.

I defined and drove org-wide adoption of:

- **Partitioning strategy** — partition key selection guidelines for batch and streaming layers, with documented tradeoffs between query performance and write efficiency
- **Merge and SCD2 patterns** — a reference implementation for CDC-style merge/upsert (idempotent, business-key-keyed, dynamic partition overwrite) that became the default for new pipelines
- **Incremental load design** — the self-watermarking pattern on `updated_ts` documented as a reusable standard, not a one-off
- **DQ gate standards** — the golden-check pattern (dup/null/reconciliation, blocking on failure) as the minimum bar for any pipeline feeding a downstream consumer

The [`enterprise-data-foundation`](https://github.com/sharath-dataengineer/enterprise-data-foundation) is the reference implementation. A new domain table is a new config file — no bespoke Spark code, no platform team involvement for every deployment.

### Mentorship and Technical Enablement

I wrote the [`data-engineering-playbook`](https://github.com/sharath-dataengineer/data-engineering-playbook) as the onboarding resource I wish had existed — covering Spark internals, lakehouse design, Kafka architecture, and data modeling theory at book-chapter depth.

- Three engineers with no prior Spark experience deployed production pipelines within their first month using the config-driven framework and documentation
- Engineers mentored on Spark internals (shuffle, catalyst, memory management) and lakehouse design — topics that typically take 12–18 months of production experience to develop intuition for
- The LightGBM risk predictor in the pipeline health monitor was designed by me and implemented by a junior engineer working from the feature spec alone — no daily check-ins required

### Platform Principles I Build Against

**Golden Paths** — self-service templates that let domain teams onboard data products without platform team involvement for every deployment. Friction in the platform is a bug, not a feature request.

**Observability by Default** — every pipeline emits freshness, volume, schema, and lineage metadata from day one. Observability is the scaffolding the pipeline is built on, not a layer added afterward.

**Cost Attribution** — every compute dollar attributed to a domain, a team, and a business outcome. Cost is visible at the point of architectural decision — not discovered in a monthly invoice.

**Architecture Reviews** — produce ADRs, not verbal sign-offs. Decisions are documented with context, rationale, and consequences so engineers two years later understand *why*, not just *what*.

---

## Engineering Principles

These are not aspirational values. They are constraints I design systems against and positions I defend in architecture reviews.

**1. Observability is not a feature — it is the load-bearing wall.**
A pipeline without freshness and volume signals is not a pipeline. It is a batch job with no on-call. Every system I design emits operational metadata before it emits business data. If you cannot answer "is this data correct, complete, and fresh?" without querying the data itself, the platform is not done.

**2. Schema evolution is a first-class problem, not a migration script.**
Schema changes break downstream consumers in ways that don't surface until 3 AM. I design for schema evolution from the start: format-level schema evolution (Iceberg, Avro), contract-based interfaces between producers and consumers, and automated drift detection. The platform should catch schema drift before the business does.

**3. Cost is an engineering responsibility, not a finance report.**
Cloud costs that cannot be attributed to a team, a pipeline, and a business outcome are unmanaged risk. I build FinOps instrumentation into platforms so cost is visible at the point of architectural decision — not discovered in a monthly invoice. Every join strategy, compaction schedule, and cluster configuration has an economic consequence.

**4. High-leverage engineers are force multipliers, not just strong individual contributors.**
The highest-leverage work I do is not writing the most performant Spark job — it is designing the system that makes the next 10 engineers more productive. That means golden paths, documented decisions, reusable patterns, and mentorship that transfers architectural thinking, not just syntax.

**5. Data quality failures are architecture failures.**
Bad data downstream is almost always caused by a missing constraint upstream. I treat data quality as an architectural concern: schema enforcement at ingestion, data contracts between producers and consumers, automated quality gates in CI/CD, and quality SLAs with the same rigor as latency SLAs. Retrofitting quality into an existing system costs 10x what designing it in from the start.

---

## Career Arc

11+ years across five industries and four platform generations. Each role tackled a harder problem than the last.

| Period | Industry | Stack | Key Outcome |
|---|---|---|---|
| 2014–2019 | Telecoms | Informatica + SSIS + S3 | 30% dev effort reduction; on-prem → AWS S3 migration |
| 2019–2021 | Insurance | SQL + EDW + AWS | 40% incident turnaround reduction; regulatory EDW |
| 2021–2022 | Finance data | AWS Glue + EMR + Spark | 30% faster execution; 40% pipeline reusability gain |
| 2022–2023 | Legal & financial data | Redshift + EMR + Spark | 35% faster pipelines; near-real-time financial datasets |
| 2023–present | Financial-software SaaS | Medallion lakehouse + Kafka + LLM tooling | 40% runtime reduction; 70% faster incident resolution |

---

## Contact

For architecture discussions, technical collaboration, or Data Engineering opportunities:

- **Email:** sharathrama.de@gmail.com
- **LinkedIn:** [linkedin.com/in/sharathde](https://www.linkedin.com/in/sharathde)
- **GitHub:** Open an issue or start a discussion on any repository above.

---

<div align="center">

<sub>Data Engineer &nbsp;|&nbsp; 11+ years &nbsp;|&nbsp; Platform Architecture &nbsp;|&nbsp; Lakehouse &nbsp;|&nbsp; Streaming &nbsp;|&nbsp; GenAI for Data</sub>

</div>
