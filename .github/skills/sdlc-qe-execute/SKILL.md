---
name: sdlc-qe-execute
description: >
  Structures QE execution evidence from test plans, promoted changes, defects, blockers,
  pass/fail results, and release risk. Use after sdlc-qe-automate and sdlc-ops-promote.
  Do not use to approve UAT or production release.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: qe
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: foundation
  model_tier: balanced
  accountable_role: Quality Engineering
  verifier_role: QE Lead
  human_gate: QE results accepted for UAT
  verification_evidence: Results, defects, blockers, and regression impact
  sdlc_step: "09"
  input_from: sdlc-qe-automate, sdlc-ops-promote
  output_to: sdlc-po-uat
  reads_context: qe-standards.md, release-standards.md
---

# QE Execution Evidence

Read-only. Organizes test execution evidence and release risk.

## Pre-flight

Stop unless the QE automation plan, promotion notes, and test environment are identified.
Read every file listed in `metadata.reads_context` from `sdlc-copilot/context/`; stop if a
required file is not populated.

## Method

1. Record executed scenarios, pass/fail results, and evidence links or descriptions.
2. Classify defects as true defect, missing requirement, scope addition, environment/data
   issue, or test issue.
3. Name blockers, owners, and release impact.
4. Summarize readiness for UAT.

## Output

Execution summary · Scenario results · Defect classification · Blockers and owners ·
Regression impact · UAT readiness recommendation

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not approve UAT.
- Do not approve production release.
- Do not reclassify scope without a human decision.
- Do not hide failed or blocked scenarios.

## Escalation

Stop when a release blocker lacks an owner, expected behavior is disputed, or testing
evidence is incomplete.
