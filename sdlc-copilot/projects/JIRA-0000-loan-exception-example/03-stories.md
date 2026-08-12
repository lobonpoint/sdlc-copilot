<!-- SAMPLE — SYNTHETIC. Invented scenario, entities, and figures. -->
<!-- Produced by /sdlc-po-stories · v0.1.0 · 2026-08-05 -->

# Story Breakout — Loan Policy Exception Requests

| | |
|---|---|
| Assessment version | v1.2 (signed 2026-08-19 by D. Okafor) |
| Date | 2026-08-20 |
| Author | A. Mercer |

*Servicing integration was confirmed **out of scope** at sign-off. Epic 4 from the
assessment is dropped.*

## Epics

| # | Epic | Traces to |
|---|---|---|
| E1 | Exception request capture and submission | Assessment §3, §12.1 |
| E2 | Approval routing and attribution | Assessment §3, §12.2 |
| E3 | Reporting and audit evidence | Assessment §3, §12.3 |

---

## E1 — Exception request capture and submission

### E1-S1 · Submit an exception request from a facility

As a **relationship manager**, I want to raise a policy exception from the facility
record, so that the exception is linked to the facility it concerns.

**Acceptance criteria**

```
Given  I am an RM with read access to a facility
When   I open the facility and select New Policy Exception
Then   a request form opens with facility, borrower, and product pre-filled read-only

Given  I have completed all required fields
When   I submit
Then   a Policy_Exception__c record is created as a child of that facility
And    its status is Submitted
And    I am recorded as the submitter

Given  a required field is empty
When   I submit
Then   submission is blocked and each missing field is named

Given  I have read-only access to the facility
When   I open it
Then   the New Policy Exception action is not available
```

**Components:** `Policy_Exception__c`, LWC submission form, RM permission set
**Depends on:** none — first buildable story
**Traces to:** Assessment §3, §12.1

---

### E1-S2 · Submit from a mobile device

As a **relationship manager in the field**, I want to submit an exception on my phone, so
that I do not wait until I am back at a desk.

**Acceptance criteria**

```
Given  I am on a supported mobile device
When   I open the submission form
Then   all fields are reachable and usable without horizontal scrolling

Given  I am on mobile with an intermittent connection
When   submission fails
Then   my entered values are retained and I am told the submission did not complete
And    no partial record is created
```

**Components:** LWC submission form
**Depends on:** E1-S1
**Traces to:** Assessment §3 (mobile constraint from Intake Brief)

---

### E1-S3 · Protect borrower financials in justification text

As a **data governance officer**, I want the justification field encrypted and excluded
from list views, so that borrower financials are not exposed in bulk.

**Acceptance criteria**

```
Given  a Policy_Exception__c record with justification text
When   any user views a list view or report containing that object
Then   the justification field is not available as a column

Given  I am a user with access to the record
When   I open it
Then   I can read the justification on the record detail page

Given  I attempt to filter or search on the justification field
Then   the field is not available as a filter criterion
```

**Components:** `Policy_Exception__c` justification field, field-level encryption
**Depends on:** E1-S1
**Traces to:** Assessment §3, §5 (Trusted-over-Easy conflict resolution)

---

## E2 — Approval routing and attribution

### E2-S1 · Route for credit officer approval

As a **credit officer**, I want submitted exceptions routed to my queue, so that I can
action them without watching a mailbox.

**Acceptance criteria**

```
Given  an exception is submitted below the escalation threshold
When   submission completes
Then   it enters the credit officer approval step
And    the assigned approver is notified

Given  I am the assigned credit officer
When   I approve
Then   status becomes Approved
And    my identity and the timestamp are recorded on the record

Given  I reject
Then   status becomes Rejected
And    a rejection reason is required before the rejection is accepted
```

**Components:** Approval process, record-triggered Flow, Credit Officer permission set
**Depends on:** E1-S1
**Traces to:** Assessment §3, §12.2

---

### E2-S2 · Escalate above threshold

As a **Head of Credit**, I want exceptions above the amount threshold escalated to me, so
that large exceptions carry senior attribution.

**Acceptance criteria**

```
Given  an exception at or above the configured threshold
When   the credit officer approves
Then   it routes to the Head of Credit as a second step
And    status remains Pending Approval until that step completes

Given  the threshold value needs to change
When   an admin updates the Custom Metadata record
Then   routing uses the new value with no code deployment
```

**Components:** Approval process, Custom Metadata threshold record
**Depends on:** E2-S1
**Traces to:** Assessment §3, §5 (Adaptable — thresholds in Custom Metadata)

---

## E3 — Reporting and audit evidence

### E3-S1 · Exception volume and cycle time reporting

As a **Head of Commercial Credit**, I want reporting on exception volume, approval rate,
and cycle time by type, so that I can answer the audit finding.

**Acceptance criteria**

```
Given  exception records exist across multiple types and statuses
When   I open the Policy Exceptions dashboard
Then   I see volume by type, approval rate, and median cycle time for a selected period

Given  I am an auditor with the read-all permission set
When   I run the exception report
Then   I see all exceptions regardless of facility ownership
And    the justification field is not included as a column
```

**Components:** 4 reports, 1 dashboard, Auditor permission set
**Depends on:** E1-S1, E2-S1
**Traces to:** Assessment §3, §12.3

---

## Sequencing

```
E1-S1  ──┬── E1-S2
         ├── E1-S3
         └── E2-S1 ──── E2-S2
                  └──── E3-S1
```

E1-S1 is the critical path — nothing else starts until the object and submission exist.
E1-S2 and E1-S3 can run in parallel with E2-S1.

---

## Proposed scope additions — NOT in signed scope

> **Flagged, not included.** These need a decision before entering the backlog.

| Item | Raised by | Why it is not in scope | Decision owner |
|---|---|---|---|
| Migrate ~400 historical exceptions from the tracking spreadsheet | A. Mercer, during breakout | Open question 2 in the assessment was never resolved before sign-off. Assessment §9 assumption 5 explicitly excludes migration from the ROM | D. Okafor |
| Email notification to the submitting RM on approval or rejection | Credit team, during review | Not in the signed assessment. Small, but it is an addition and the estimate did not carry it | D. Okafor |

*Absorbing either of these silently would make the signed ROM wrong without anyone
noticing. That is the flag doing its job.*

## Open questions

| Question | Owner | Needed by |
|---|---|---|
| Historical migration in or out? Affects whether E1 needs a data load story | D. Okafor | Sprint 1 planning |
| Is "supported mobile device" the standard organization-managed device list, or any browser? | A. Mercer | Before E1-S2 |
