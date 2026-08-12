<!--
  integration-patterns-reference.md
  Source: Salesforce Integration Patterns and Practices — developer.salesforce.com
  Status: INDUSTRY GUIDANCE. Ranks below org guardrails in the authority hierarchy.
  Version: 0.1.0  Created: 2026-08-05  Updated: 2026-08-05  Owner: TBD
-->

# Salesforce integration patterns — selection reference

Use when the assessment involves an external system. Name the pattern and the reason.
Choosing the wrong one introduces latency, data inconsistency, or scale problems that
are expensive to unwind later.

## The five canonical patterns

### Request and Reply — synchronous
Salesforce calls a remote system, waits for completion, and updates state based on the
response.

**Use when** the caller needs the result to proceed: real-time validation, credit check,
availability check, price calculation.

**Requires** a stable, low-latency connection. The user is waiting.

**Watch for** callout timeouts, governor limits on synchronous callouts, and what the
user sees when the remote system is down.

---

### Fire and Forget — asynchronous
Salesforce invokes a remote process and does not wait. Control returns immediately or
after acknowledgment of hand-off.

**Use when** no response is needed to continue: notifications, downstream sync, event
publication.

**Increasingly implemented through Platform Events or Pub/Sub** rather than `@future`
callouts, for better decoupling and scale.

**Watch for** silent failure. Nobody notices a fire-and-forget that stopped firing
unless something is monitoring it. Name the monitoring.

---

### Batch Data Synchronization
Large volumes exchanged on a schedule, typically via Bulk API or ETL tooling.

**Use when** volume is high and latency tolerance is hours, not seconds.

**This should be a deliberate architectural choice, not a default.** "We'll batch it
overnight" is often a decision nobody actually made.

**Watch for** the reconciliation story. What happens when a batch partially fails?

---

### Remote Call-In
An external system initiates against Salesforce via REST, SOAP, or Bulk API.

**Use when** the external system owns the trigger.

**Watch for** authentication and authorization, API limits, and what downstream
automation fires as a side effect of the inbound write.

---

### Data Virtualization
Read external data without copying it into Salesforce.

**Use when** the data is authoritative elsewhere, changes often, and duplication would
create a reconciliation burden.

**Watch for** performance and the behavior when the external source is unavailable.

---

## Idempotency — required for anything retryable

If a call can be retried — and most can, through error handling, timeouts, or manual
reprocessing — **the design must state how duplicate invocations are handled.**

Without idempotency, repeated invocations of the same message produce different
results: duplicate records, duplicate transactions, and duplicate downstream trigger
and automation firing.

State in the assessment:
- What makes a request uniquely identifiable
- Which side enforces uniqueness — Salesforce or the remote system
- What happens on the second identical call

## Security

Every remote call must maintain confidentiality, integrity, and availability of the
request. Name where credentials live. Named Credentials are the platform mechanism;
credentials in code or custom settings are a finding, not a design.

## Selection summary

| Need | Pattern |
|---|---|
| Caller needs the answer now | Request and Reply |
| Notify, don't wait | Fire and Forget (Platform Events) |
| High volume, scheduled | Batch Data Synchronization |
| External system initiates | Remote Call-In |
| Read without copying | Data Virtualization |
