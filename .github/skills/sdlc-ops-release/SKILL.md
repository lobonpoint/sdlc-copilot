---
name: sdlc-ops-release
description: >
  Creates release readiness and production handoff artifacts from UAT outcome, QE
  evidence, promotion notes, release standards, deployment sequence, validation steps, and
  support handoff. Use after sdlc-po-uat. Do not use to approve release or replace the
  release manager.
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
  accountable_role: Release / DevOps
  verifier_role: Release manager
  human_gate: Human go/no-go and support handoff recorded
  verification_evidence: Runbook, validation, rollback, release notes, and support acceptance
  sdlc_step: "11"
  input_from: sdlc-po-uat
  output_to: Production Support receives
  reads_context: release-standards.md, org-profile.md
---

# Release Readiness

Read-only. Produces release and production-support handoff artifacts.

## Pre-flight

Stop unless UAT outcome, QE evidence, deployment plan, and release owner are present.
Read every file listed in `metadata.reads_context` from `sdlc-copilot/context/`; stop if a
required file is not populated.

## Method

1. Confirm release scope, deployment sequence, validation steps, and communication plan.
2. Name manual steps, rollback or forward-fix plan, and owners.
3. Prepare release notes and support handoff.
4. State missing evidence and go/no-go decision owner.

## Output

Release readiness summary · Deployment runbook · Validation checklist · Rollback or
forward-fix plan · Communication checkpoints · Release notes · Production Support handoff

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not approve production release.
- Do not replace release management controls.
- Do not omit rollback or forward-fix ownership.
- Do not claim support readiness without handoff evidence.

## Escalation

Stop when release evidence is missing, production validation is unclear, or support
handoff ownership is absent.
