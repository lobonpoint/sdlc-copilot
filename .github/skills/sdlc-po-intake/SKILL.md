---
name: sdlc-po-intake
description: >
  Qualifies an incoming business request into an Intake Brief that a solution architect
  can assess, or returns a specific list of what is missing and who to ask. Flags
  governance triggers early: customer data, external integrations, AI usage, new system
  of record, regulatory dates. Use when a business line raises a new request or
  enhancement. Do not use to estimate effort or propose a solution.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: po
  version: "0.2.0"
  created: "2026-08-05"
  updated: "2026-08-05"
  status: active
  model_tier: balanced
  accountable_role: Product Owner / BA
  verifier_role: Business requester
  human_gate: Intake classification accepted
  verification_evidence: Coverage table, governance triggers, and named gaps
  sdlc_step: "01"
  input_from: business request
  output_to: sdlc-arch-assess
  reads_context: org-profile.md
---

# Intake Qualification

Read-only. The entry point to the chain.

**This skill exists as much to stop weak intake as to pass good intake.** A request
reaching assessment with gaps produces an assessment built on assumptions, which then
reads as authoritative. Caught here: fifteen minutes. Caught later: a cycle.

## Reference material

- **Intake form** — the coverage areas as a fillable form: `assets/intake-form.md`

## Pre-flight

Accepts any format — completed form, pasted email, conversation notes. Finding what is
missing is the job; demanding a format is not.

Read `sdlc-copilot/context/org-profile.md`. If it is not populated, continue only to
identify intake gaps; do not claim alignment to systems, delivery model, or ownership.

## Phase 1 — Separate ask from problem

1. Record **what they asked for** — verbatim intent.
2. Record **the problem it solves** — the outcome wanted.

People frequently request a solution they have already picked. If these two cannot be
separated from the material available, that is the first gap.

## Phase 2 — Check coverage

Mark each area **present · partial · missing**. These are the areas
`sdlc-arch-assess` needs. Not a fixed questionnaire — if assessment changes, this
changes.

| Area | What good looks like |
|---|---|
| Business problem and outcome | What changes for the business if this ships |
| Affected business lines and users | Who, and roughly how many |
| Current process and systems | What happens today, including the manual workaround |
| Data classification | What sensitivity of data is involved |
| Customer data | Whether customer or client data is touched, and how |
| External integrations | Any system outside Salesforce, named |
| Regulatory or audit driver | Whether an external obligation is forcing this |
| Hard dates | The date, and **what makes it hard** — a driver, not a preference |
| Known constraints | Budget, platform, vendor, or sequencing limits |
| Sign-off authority | Who signs the scope, by name or role |

## Phase 3 — Flag governance triggers

Any of these routes the request through additional review. Flag here so nobody discovers
them at the end.

- Customer or client data involved
- Any external system integration
- AI or model usage
- New system of record, or change to an existing one
- Regulatory or audit-driven date
- Data leaving the current environment or region

## Phase 4 — Classify

Exactly one:

- **Qualified** — proceed to `sdlc-arch-assess`
- **Needs clarification** — each gap with the specific question and the named person to
  ask. Not "needs more detail"
- **Not a fit** — why, and where it should go instead

## Phase 5 — Assign open questions

Every open question gets a named owner. An unowned question does not get answered.

## Output

1. Control block — request ID, date, requester, business line, version
2. What was asked for
3. The underlying problem
4. Coverage table — area, status, notes
5. Governance triggers flagged
6. Classification with reasoning
7. Open questions with named owners
8. If Qualified: one-paragraph summary the architect can start from

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- **Do not estimate.** Not hours, not t-shirt sizes, not "this looks small." An estimate
  here gets quoted as a commitment before anyone has assessed it.
- **Do not propose a solution.** Naming components is the architect's job; doing it here
  anchors the assessment before it starts.
- **Do not mark Qualified** with open questions on data classification, customer data, or
  regulatory drivers.
- **Do not fill gaps with reasonable assumptions.** Name them as gaps. A plausible
  assumption is harder to catch than a blank.

## Escalation

Stop and name a human when: the request duplicates existing capability; it conflicts with
a stated guardrail in `sdlc-copilot/context/org-guardrails.md`; the sponsor is unclear;
or the hard date is not achievable on any plausible reading of scope.

## Time budget

**Fifteen minutes for a Product Owner.** A pass/fail design constraint, not an
aspiration. Test with a real PO and a stopwatch before publishing. Over budget → cut the
coverage table, do not ask people to try harder.
