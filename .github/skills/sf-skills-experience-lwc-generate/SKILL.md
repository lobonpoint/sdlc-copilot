---
name: sf-skills-experience-lwc-generate
description: >
  Example Salesforce-origin skill wrapper for Lightning Web Component work, mapped to an
  upstream forcedotcom/sf-skills LWC generation skill. Use when signed scope calls for an
  LWC or Experience Cloud UI component. Do not use for backend-only work or unsigned UI
  ideas.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  vendor: Salesforce
  upstream_repo: forcedotcom/sf-skills
  upstream_skill: experience-lwc-generate
  imported_as: sf-skills-experience-lwc-generate
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: example
  model_tier: balanced
  accountable_role: Developer
  verifier_role: Dev Lead
  human_gate: Developer validation complete
  verification_evidence: Component behavior, accessibility, tests, security, and deployment notes
  input_from: sdlc-dev-breakout, sdlc-dev-scaffold
  output_to: sdlc-dev-scaffold
  reads_context: dev-standards.md, security-and-access.md
---

# Salesforce LWC Skill Example

This example shows how to map a Salesforce UI implementation skill into the framework
while keeping SDLC traceability and local standards visible.

## Upstream

See `upstream.md` for the Salesforce source, review fields, and local mapping.

## Pre-flight

Stop unless signed stories define the user role, UI behavior, data displayed or updated,
permission expectations, and acceptance criteria. Read every file listed in
`metadata.reads_context` from `sdlc-copilot/context/`; stop if a required file is not
populated or upstream review is incomplete.

## Method

1. Confirm LWC is the approved implementation path from signed scope.
2. Identify component API name, placement, data sources, events, states, validation, and
   accessibility expectations.
3. Use or adapt the upstream Salesforce LWC skill only after review/pinning is complete.
4. Capture UI states, tests, permission checks, and deployment notes.

## Output

LWC implementation notes · UI states · Data and permission assumptions · Test scenarios ·
Deployment notes · Upstream skill version used · Open questions

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not generate UI behavior not present in signed scope.
- Do not ignore accessibility, error states, permissions, or data classification.
- Do not treat upstream Salesforce examples as local policy.
- Do not claim business approval of the UI.
