---
name: sf-skills-platform-metadata-deploy
description: >
  Example Salesforce-origin skill wrapper for metadata deployment and deployment review,
  mapped to an upstream forcedotcom/sf-skills metadata deployment skill. Use when
  implementation work needs Salesforce metadata packaging, deployment planning, or deploy
  validation. Do not use to approve production release.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  vendor: Salesforce
  upstream_repo: forcedotcom/sf-skills
  upstream_skill: platform-metadata-deploy
  imported_as: sf-skills-platform-metadata-deploy
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: example
  model_tier: balanced
  accountable_role: DevOps
  verifier_role: Release / DevOps Lead
  human_gate: Deployment evidence accepted for promotion
  verification_evidence: Manifest, validation, dependency, and rollback evidence
  input_from: sdlc-dev-scaffold, sdlc-ops-promote
  output_to: sdlc-ops-promote
  reads_context: release-standards.md, org-profile.md, security-and-access.md
---

# Salesforce Metadata Deployment Skill Example

This example shows how a Salesforce-origin deployment skill can support Ops promotion
without replacing release controls.

## Upstream

See `upstream.md` for the Salesforce source, review fields, and local mapping.

## Pre-flight

Stop unless implementation evidence, changed component inventory, target environment, and
release standards are available. Read every file listed in `metadata.reads_context` from
`sdlc-copilot/context/`; stop if a required file is not populated or upstream review is
incomplete.

## Method

1. Confirm deployment scope and target environment.
2. Identify deployable metadata, dependencies, manual steps, validation, and rollback or
   forward-fix ownership.
3. Use or adapt the upstream Salesforce metadata deploy skill only after review/pinning is
   complete.
4. Capture promotion evidence for `sdlc-ops-promote`.

## Output

Deployment notes · Component inventory · Validation plan · Dependency risks · Rollback or
forward-fix notes · Upstream skill version used · Open questions

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not approve production release.
- Do not deploy components outside signed scope.
- Do not omit manual steps, validation evidence, or rollback ownership.
- Do not treat upstream Salesforce examples as local release policy.
