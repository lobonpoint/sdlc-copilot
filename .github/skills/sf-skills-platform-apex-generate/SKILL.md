---
name: sf-skills-platform-apex-generate
description: >
  Example Salesforce-origin skill wrapper for Apex implementation work, mapped to the
  upstream forcedotcom/sf-skills platform-apex-generate skill. Use when a signed developer
  breakout calls for Apex classes, triggers, services, or tests. Do not use without signed
  scope, local development standards, and security/access context.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  vendor: Salesforce
  upstream_repo: forcedotcom/sf-skills
  upstream_skill: platform-apex-generate
  imported_as: sf-skills-platform-apex-generate
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: example
  model_tier: balanced
  accountable_role: Developer
  verifier_role: Dev Lead
  human_gate: Developer validation complete
  verification_evidence: Code review, unit tests, security review, and deployment notes
  input_from: sdlc-dev-breakout, sdlc-dev-scaffold
  output_to: sdlc-dev-scaffold
  reads_context: dev-standards.md, security-and-access.md, ncino-boundaries.md
---

# Salesforce Apex Skill Example

This is a local example of how to bring an official Salesforce skill into the framework.
It keeps the upstream name visible while adding our SDLC controls.

## Upstream

See `upstream.md` for the Salesforce source, review fields, and local mapping.

## Pre-flight

Stop unless signed stories, developer breakout, and local development/security context are
available. Read every file listed in `metadata.reads_context` from
`sdlc-copilot/context/`; stop if a required file is not populated or upstream review is
incomplete.

## Method

1. Confirm Apex is the right implementation path from signed scope.
2. Check local standards for bulkification, sharing, CRUD/FLS, tests, and nCino boundaries.
3. Use or adapt the upstream Salesforce Apex skill only after review/pinning is complete.
4. Capture generated or modified components, tests, assumptions, and evidence for
   `sdlc-dev-scaffold`.

## Output

Apex implementation notes · Components changed · Tests required · Security/access
evidence · Upstream skill version used · Open questions

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not generate Apex from unsigned stories.
- Do not treat upstream Salesforce examples as local policy.
- Do not bypass local security, test, review, or package-boundary standards.
- Do not claim code is production-ready without developer validation.
