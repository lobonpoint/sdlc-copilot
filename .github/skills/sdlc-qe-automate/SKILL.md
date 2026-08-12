---
name: sdlc-qe-automate
description: >
  Designs QE automation from signed stories and developer breakout: test scenarios,
  automation candidates, data needs, permission cases, integration checks, and traceability.
  Use concurrently with sdlc-dev-scaffold. Do not use to mark testing complete.
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
  human_gate: Test design accepted for execution
  verification_evidence: Traceability matrix, automation cases, data, and permission coverage
  sdlc_step: "07"
  input_from: sdlc-dev-breakout
  output_to: sdlc-qe-execute
  reads_context: qe-standards.md, security-and-access.md, org-profile.md
---

# QE Automation Design

Read-only. Designs automation and traceability before test execution.

## Pre-flight

Stop unless signed stories, acceptance criteria, and developer breakout are present. Read
every file listed in `metadata.reads_context` from `sdlc-copilot/context/`; stop if a
required file is not populated.

## Method

1. Map each acceptance criterion to test scenarios.
2. Identify automation candidates and manual-only checks.
3. Include negative, permission, sharing, integration, and regression cases.
4. Name test data and environment needs.
5. Separate blockers from assumptions.

## Output

Traceability matrix · Automation candidates · Manual test cases · Test data needs ·
Permission/security cases · Integration checks · Blockers and owners

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not mark tests executed.
- Do not invent acceptance criteria.
- Do not silently expand signed scope.
- Do not ignore permission or data-classification cases.

## Escalation

Stop when a story cannot be tested, test data is unavailable, or expected behavior is not
decidable from signed scope.
