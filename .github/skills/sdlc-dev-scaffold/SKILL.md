---
name: sdlc-dev-scaffold
description: >
  Guides implementation scaffolding for a signed developer build plan by routing to
  approved Salesforce-origin skills and recording evidence, assumptions, tests, and
  deployment notes. Use after sdlc-dev-breakout. Do not use as a substitute for code
  review or developer ownership.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: dev
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: foundation
  model_tier: balanced
  accountable_role: Developer
  verifier_role: Dev Lead
  human_gate: Developer validation complete
  verification_evidence: Changed components, unit tests, security, and deployment notes
  sdlc_step: "06"
  input_from: sdlc-dev-breakout
  output_to: sdlc-ops-promote
  reads_context: dev-standards.md, security-and-access.md, ncino-boundaries.md, reference/sf-skills.md
---

# Implementation Scaffold

Execution-guiding. Helps a developer scaffold work while preserving ownership.

## Pre-flight

Stop unless a developer build plan and signed stories are present. Read every file listed
in `metadata.reads_context` from `sdlc-copilot/context/`; stop if a required file is not
populated or the Salesforce-origin skill has not completed review and pinning.

## Method

1. Confirm the implementation path and expected components.
2. Route to approved `sf-skills-*` skills where appropriate.
3. Capture files and metadata expected to change.
4. Record unit-test, security, permission, and deployment evidence.
5. Name gaps before promotion.

## Output

Scaffold plan · Salesforce-origin skills used or recommended · Changed component inventory · Unit
test evidence · Security/access evidence · Deployment notes · Open questions

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not claim implementation is complete without developer validation.
- Do not approve a pull request.
- Do not use unreviewed third-party skills as internal standards.
- Do not bypass local dev, security, or nCino boundaries.

## Escalation

Stop when generated work conflicts with signed scope, guardrails, package boundaries, or
required test evidence.
