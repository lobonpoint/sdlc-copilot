---
name: sdlc-arch-reconcile
description: >
  Reconciles solution assessment feedback into signed scope readiness: open decisions,
  assessment changes, scope adjustments, risks, owners, and sign-off evidence. Use after
  sdlc-arch-assess when stakeholders have reviewed the assessment and before Product
  Owners create stories. Do not use to approve scope or bypass the PM/business sign-off.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: arch
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: foundation
  model_tier: deep-reasoning
  accountable_role: Solutions Architect
  verifier_role: PM / business sign-off authority
  human_gate: Scope sign-off recorded
  verification_evidence: Feedback dispositions, signed scope, and open decisions
  sdlc_step: "03"
  input_from: sdlc-arch-assess
  output_to: sdlc-po-stories
  reads_context: org-guardrails.md, org-profile.md
---

# Assessment Reconciliation

Read-only. Turns reviewed assessment feedback into signed-scope readiness.

## Pre-flight

Stop unless all are present:

1. Solution assessment
2. Stakeholder feedback, decision log, or review notes
3. Named PM or business sign-off authority
4. Populated `sdlc-copilot/context/org-guardrails.md` and `org-profile.md`

## Method

1. List each feedback item and classify it as clarification, scope change, risk decision,
   guardrail issue, estimate impact, or out of scope.
2. Identify what changes in the assessment and what remains unchanged.
3. Separate signed scope from proposed additions.
4. Name unresolved decisions, owners, and due dates.
5. State sign-off readiness: ready, ready with named exceptions, or not ready.

## Output

Control block · Feedback disposition table · Assessment changes · Signed scope summary ·
Proposed additions · Estimate and governance impacts · Open decisions with owners ·
Sign-off readiness

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not approve scope.
- Do not accept risk on behalf of a human.
- Do not silently absorb stakeholder requests into scope.
- Do not proceed when the assessment conflicts with organizational guardrails.

## Escalation

Stop and name the decision owner when feedback changes regulatory impact, customer-data
handling, system-of-record boundaries, integration scope, or the ROM confidence level.
