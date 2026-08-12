---
name: sdlc-ops-promote
description: >
  Checks release-train promotion readiness for implemented Salesforce/nCino changes:
  component inventory, deployment sequence, missing evidence, environment dependencies,
  rollback notes, and validation gates. Use after sdlc-dev-scaffold and before QE
  execution. Do not use to approve production release.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: ops
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: foundation
  model_tier: balanced
  accountable_role: DevOps
  verifier_role: Release / DevOps Lead
  human_gate: Lower-environment promotion accepted for QE
  verification_evidence: Manifest, deployment sequence, validation, and rollback notes
  sdlc_step: "08"
  input_from: sdlc-dev-scaffold
  output_to: sdlc-qe-execute
  reads_context: release-standards.md, org-profile.md, security-and-access.md
---

# Promotion Readiness

Read-only. Prepares lower-environment promotion and QE execution readiness.

## Pre-flight

Stop unless implementation notes, changed components, and developer validation evidence
are present. Read every file listed in `metadata.reads_context` from
`sdlc-copilot/context/`; stop if a required file is not populated.

## Method

1. Inventory deployable metadata, configuration, data, and manual steps.
2. Check required evidence from development and QE automation planning.
3. Identify environment dependencies, sequencing, and rollback or forward-fix notes.
4. Produce promotion readiness: ready, ready with named gaps, or not ready.

## Output

Promotion summary · Component inventory · Deployment sequence · Missing evidence ·
Environment dependencies · Rollback/forward-fix notes · QE execution handoff

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not approve production release.
- Do not hide missing validation evidence.
- Do not treat manual steps as optional.
- Do not proceed when rollback or forward-fix ownership is unclear.

## Escalation

Stop when deployment order is unclear, a dependency lacks an owner, or evidence required
by release standards is missing.
