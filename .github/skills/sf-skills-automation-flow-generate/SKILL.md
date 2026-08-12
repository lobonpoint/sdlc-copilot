---
name: sf-skills-automation-flow-generate
description: >
  Example Salesforce-origin skill wrapper for Flow and declarative automation work, mapped
  to the upstream forcedotcom/sf-skills automation-flow-generate skill. Use when signed
  scope calls for Salesforce Flow. Do not use when Apex, OmniStudio, or another mechanism
  is the approved implementation path.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  vendor: Salesforce
  upstream_repo: forcedotcom/sf-skills
  upstream_skill: automation-flow-generate
  imported_as: sf-skills-automation-flow-generate
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: example
  model_tier: balanced
  accountable_role: Developer
  verifier_role: Dev Lead
  human_gate: Developer validation complete
  verification_evidence: Flow design, tests, security review, and deployment notes
  input_from: sdlc-dev-breakout, sdlc-dev-scaffold
  output_to: sdlc-dev-scaffold
  reads_context: dev-standards.md, security-and-access.md, org-guardrails.md
---

# Salesforce Flow Skill Example

This example shows how an official Salesforce Flow skill can sit beside the persona-based
SDLC skills without becoming part of the delivery spine.

## Upstream

See `upstream.md` for the Salesforce source, review fields, and local mapping.

## Pre-flight

Stop unless signed stories identify a Flow or declarative automation need. Read every
file listed in `metadata.reads_context` from `sdlc-copilot/context/`; stop if a required
file is not populated or upstream review is incomplete.

## Method

1. Confirm Flow is allowed by guardrails and local development standards.
2. Identify triggering object, flow type, entry criteria, data updates, permissions, and
   fault handling expectations.
3. Use or adapt the upstream Salesforce Flow skill only after review/pinning is complete.
4. Capture automation design, test scenarios, deployment notes, and owner decisions.

## Output

Flow design notes · Objects and triggers · Fault handling · Test scenarios · Deployment
notes · Upstream skill version used · Open questions

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not create automation outside signed scope.
- Do not use Flow when guardrails require Apex or another pattern.
- Do not ignore recursion, bulk behavior, fault paths, permissions, or data classification.
- Do not treat upstream Salesforce examples as local policy.
