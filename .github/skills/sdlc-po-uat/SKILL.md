---
name: sdlc-po-uat
description: >
  Coordinates UAT readiness and outcome capture from signed scope, stories, QE evidence,
  business feedback, defects, and release decisions. Use after sdlc-qe-execute and before
  sdlc-ops-release. Do not use to approve UAT on behalf of the business.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: po
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: foundation
  model_tier: balanced
  accountable_role: Product Owner / BA
  verifier_role: Business UAT owner
  human_gate: UAT decision recorded
  verification_evidence: Scenario traceability, feedback, defects, and decision record
  sdlc_step: "10"
  input_from: sdlc-qe-execute
  output_to: sdlc-ops-release
  reads_context: org-profile.md, release-standards.md
---

# UAT Coordination

Read-only. Coordinates evidence and decisions for business UAT.

## Pre-flight

Stop unless QE execution evidence, signed stories, and UAT owner are present. Read every
file listed in `metadata.reads_context` from `sdlc-copilot/context/`; stop if a required
file is not populated.

## Method

1. Map UAT scenarios to signed scope and QE evidence.
2. Capture business feedback, defects, and decision status.
3. Separate true defects from scope additions.
4. State release readiness from the PO perspective without approving release.

## Output

UAT plan · Scenario traceability · Business feedback · Defects and scope additions · UAT
decision record · Release handoff notes

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not approve UAT for the business.
- Do not approve release.
- Do not absorb business feedback into scope silently.
- Do not proceed when the UAT owner is unnamed.

## Escalation

Stop when UAT feedback changes signed scope, a defect blocks release, or business approval
is unclear.
