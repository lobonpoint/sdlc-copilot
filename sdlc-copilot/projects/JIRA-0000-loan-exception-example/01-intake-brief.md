<!-- SAMPLE — SYNTHETIC. Invented scenario, entities, and figures. -->
<!-- Produced by /sdlc-po-intake · v0.1.0 · 2026-08-05 -->

# Intake Brief — Loan Policy Exception Requests

| | |
|---|---|
| Request ID | INT-2026-0114 |
| Date | 2026-08-05 |
| Requester | A. Mercer, Commercial Lending Ops |
| Business line | Commercial Lending |
| Version | v1.0 |
| **Classification** | **Qualified** |

## What was asked for

> "We need a way for RMs to submit policy exception requests in the system instead of
> emailing the credit team. Right now nobody can tell me how many exceptions we granted
> last quarter."

## The underlying problem

Policy exceptions are requested and approved over email. There is no record of how many
were requested, how many approved, by whom, or on what basis. Internal Audit raised this
in their Q2 review with a remediation date.

The outcome wanted is a tracked, routed, reportable exception process — not specifically
a form.

## Coverage

| Area | Status | Notes |
|---|---|---|
| Business problem and outcome | Present | Audit finding AUD-2026-31, remediation due Q1 2027 |
| Affected business lines and users | Present | Commercial Lending; ~85 RMs, ~12 credit officers |
| Current process and systems | Present | Email to a shared credit mailbox; tracked in a spreadsheet by one analyst |
| Data classification | Present | Confidential — borrower financials referenced in justification text |
| Customer data | Present | Borrower name, facility, and financials appear in the request |
| External integrations | **Partial** | Approved exceptions may need to reach the servicing platform. Not confirmed. |
| Regulatory or audit driver | Present | Internal Audit AUD-2026-31 |
| Hard dates | Present | Q1 2027 — audit remediation, externally committed |
| Known constraints | Present | Must work for RMs on mobile in the field |
| Sign-off authority | Present | D. Okafor, Head of Commercial Credit |

## Governance triggers flagged

- ☑ Customer/client data — borrower financials in free-text justification
- ☑ Regulatory or audit-driven date — AUD-2026-31, Q1 2027
- ☐ External integration — **unconfirmed, see open questions**
- ☐ AI or model usage
- ☐ New or changed system of record
- ☐ Data leaving current environment or region

## Classification: Qualified

Sufficient for assessment. Data classification, customer-data scope, and the regulatory
driver are all confirmed — the three that block qualification.

The servicing platform integration is unconfirmed but does not block: the assessment can
scope it as conditional and the architect can size both cases.

## Open questions

| Question | Owner | Needed by |
|---|---|---|
| Do approved exceptions need to flow to the servicing platform, or is the record in the origination system sufficient for audit? | D. Okafor | Before assessment sign-off |
| Is the existing exception spreadsheet in scope for migration, or does tracking start fresh? | A. Mercer | Before story breakout |

## Summary for the architect

Commercial Lending needs policy exception requests captured, routed for approval, and
reportable, replacing an email-and-spreadsheet process. Driven by Internal Audit finding
AUD-2026-31 with a Q1 2027 remediation date. Roughly 85 RMs submitting, 12 credit officers
approving, mobile use required. Borrower financials appear in free-text justification, so
data classification is Confidential. One conditional integration to the servicing platform
is unresolved and should be scoped both ways.
