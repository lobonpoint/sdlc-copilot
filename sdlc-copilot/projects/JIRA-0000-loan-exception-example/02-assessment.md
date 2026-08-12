<!-- SAMPLE — SYNTHETIC. Invented scenario, entities, and figures. -->
<!-- Produced by /sdlc-arch-assess · v0.1.0 · 2026-08-05 -->

# Solution Assessment — Loan Policy Exception Requests

| | |
|---|---|
| Request ID | INT-2026-0114 |
| Version | v1.0 |
| Date | 2026-08-05 |
| Architect | R. Salvatierra |
| Intake brief version | v1.0 |
| Context versions read | org-guardrails v0.4 · org-profile v0.2 · estimation-rubric v0.3 |
| **Status** | **Draft — not approved** |

## 1. Problem restatement

Commercial Lending grants policy exceptions through an email process that produces no
durable record. Internal Audit requires a tracked, attributable, reportable process by
Q1 2027. The need is a system of record for exception requests and their approvals, not a
form.

## 2. Current state and gap

RMs email a shared credit mailbox. A credit analyst maintains a spreadsheet from those
emails. Nothing links an exception to the facility it relates to. Approval is evidenced
only by a reply-all.

Missing: a structured request object, an approval path with attribution, a link to the
facility record, and reporting.

## 3. Proposed approach

Custom object `Policy_Exception__c` as a child of the existing facility record, with an
approval process routing on exception type and amount.

| Component | Purpose |
|---|---|
| `Policy_Exception__c` | The request record, child of Facility |
| Approval process | Two-step: credit officer, then Head of Credit above threshold |
| Record-triggered Flow | Routing and status transitions |
| LWC | Mobile-friendly submission form |
| Permission sets | RM submit; Credit Officer approve; Auditor read-all |
| Report and dashboard | Volume, approval rate, cycle time by exception type |

Justification text carries borrower financials, so field-level encryption applies per
`org-guardrails.md` rule 7 and the field is excluded from list views.

## 4. Alternative considered and why not

**Extend the existing `Credit_Memo__c` object with exception fields.** Faster to build —
roughly 40% less effort — and reuses an approval process already in place.

Rejected. `Credit_Memo__c` carries disposition `Contain` in the guardrail register: no
new functionality. Extending it would also couple exception reporting to memo lifecycle,
and exceptions outlive the memo that prompted them.

## 5. Well-Architected evaluation

| Pillar | Does well | Risks | Anti-pattern exposure |
|---|---|---|---|
| **Trusted** | Sharing model derives from the parent facility; encrypted justification field; approval attribution is native | Auditor read-all permission set is broad and needs review | None identified |
| **Easy** | One automation tool (Flow) on the object; follows the existing child-of-facility pattern | Mobile LWC is a new pattern for this team | Avoided *automation bonanza* by using Flow only — no trigger |
| **Adaptable** | Exception types are a picklist, not hardcoded branches; approval thresholds in Custom Metadata | Threshold changes require a deploy unless Custom Metadata is used as designed | Would risk *hardcoded identifiers* if thresholds went in the Flow |

**Conflict resolution applied:** Trusted over Easy on the encrypted justification field.
Encryption removes it from list views and report filters, which is worse for users, but
`org-guardrails.md` rule 7 governs.

## 6. Integration pattern

**Conditional — depends on open question 1.**

If approved exceptions must reach the servicing platform: **Fire and Forget** via Platform
Event. No response needed, and the exception record remains authoritative in origination.

Idempotency: the event carries `Policy_Exception__c.Id` as the key; the servicing platform
must upsert on it. A retried publish must not create a second downstream record.

If the origination record is sufficient for audit, no integration is in scope and the ROM
drops to the low end of the range.

## 7. Guardrail dispositions

| Capability | Disposition | Source | Notes |
|---|---|---|---|
| `Credit_Memo__c` | `Contain` | org-guardrails v0.4 | No new functionality — drove the alternative rejection |
| Facility record | `Retain` | org-guardrails v0.4 | Healthy, safe to build against |
| Approval processes | `Retain` | org-guardrails v0.4 | |
| Servicing platform interface | **GAP** | not in register | **No disposition exists. Flagged for decision — see open questions.** |

> Existing implementation does not automatically establish an approved precedent for new
> implementation.

## 8. Component scope

| Component type | Count | Counted / assumed |
|---|---|---|
| Custom object | 1 | Counted |
| Custom fields | 14 | Counted from the current spreadsheet columns |
| Record-triggered Flow | 2 | Counted |
| Approval process | 1 | Counted |
| LWC | 1 | Counted |
| Permission sets | 3 | Counted |
| Reports / dashboard | 4 / 1 | Assumed — reporting requirements not detailed |
| Platform Event + subscriber | 1 | **Conditional** on open question 1 |

## 9. ROM estimate

**Range: 240–360 hours** · **Confidence: Medium**

Assumptions this range depends on:

1. The servicing integration is **out** of scope. If in, add 60–90 hours.
2. Field count stays at ~14; the spreadsheet is representative of real requirements.
3. Existing facility sharing model is reused without modification.
4. Reporting is four standard reports and one dashboard, not a custom analytics build.
5. No migration of the historical spreadsheet — see open question 2.

Reason for Medium: component types are all covered by `estimation-rubric.md` v0.3 and the
team has built comparable child-object-with-approval patterns twice. Confidence is not
High because reporting scope is assumed rather than confirmed, and the mobile LWC is a new
pattern for this team with no local actuals to draw on.

## 10. Governance routing

| Review | Triggered by |
|---|---|
| Data Governance | Borrower financials in a new object; encryption decision |
| Security Architecture | New permission sets including a read-all auditor role |
| Integration Review | **Conditional** — only if the servicing interface is in scope |
| Audit liaison sign-off | AUD-2026-31 remediation traceability |

## 11. Risks and dependencies

| Item | Type | Owner |
|---|---|---|
| Servicing integration scope unresolved; swings ROM by ~25% | Risk | D. Okafor |
| No guardrail disposition exists for the servicing interface | Risk | R. Salvatierra → EA |
| Encrypted justification field removes it from list views; user pushback likely | Risk | A. Mercer |
| Q1 2027 audit date is externally committed and not movable | Dependency | D. Okafor |
| Mobile LWC pattern is new to this team | Risk | Dev Lead |

## 12. Epic candidates

1. Exception request capture and submission
2. Approval routing and attribution
3. Reporting and audit evidence
4. Servicing notification *(conditional)*

## 13. Open questions

| Question | Owner | Needed by |
|---|---|---|
| Servicing platform integration in scope? Swings ROM by 60–90 hours | D. Okafor | Sign-off |
| Historical spreadsheet migration in scope? | A. Mercer | Story breakout |
| Servicing interface has no disposition in the guardrail register — needs one | EA | Before integration work begins |
| Is auditor read-all acceptable, or should it be scoped to closed exceptions only? | Security Architecture | Sign-off |
