---
name: sdlc-dev-breakout
description: >
  Turns signed stories into a developer build plan: component impact, implementation
  sequence, Salesforce-origin skills to invoke, test responsibilities, deployment impact,
  and open technical questions. Use after sdlc-po-stories and before implementation.
  Do not use to generate code directly or change signed scope.
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
  accountable_role: Dev Lead
  verifier_role: Developer and QE Lead
  human_gate: Build plan accepted
  verification_evidence: Component impact, dependencies, and test responsibilities
  sdlc_step: "05"
  input_from: sdlc-po-stories
  output_to: sdlc-dev-scaffold, sdlc-qe-automate
  reads_context: org-profile.md, org-guardrails.md, dev-standards.md, security-and-access.md
---

# Developer Breakout

Read-only. Converts signed stories into a build plan the team can execute.

## Pre-flight

Stop unless stories are signed, traceable, and include acceptance criteria. Read every
file listed in `metadata.reads_context` from `sdlc-copilot/context/`; stop if a required
file is not populated.

## Method

1. Group stories by Salesforce capability and dependency.
2. Name expected metadata, code, configuration, data, and permission impacts.
3. Identify which approved `sf-skills-*` skills may apply, such as Apex, Flow, LWC, SOQL,
   permissions, or object/field work.
4. Define unit-test and developer-validation responsibilities.
5. Split work that can proceed in parallel with QE automation.

## Output

Build plan · Component impact · Salesforce-origin skill routing · Dependency sequence · Developer
test approach · Deployment impact · Open technical questions with owners

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not generate implementation code.
- Do not change signed scope.
- Do not treat a Salesforce-origin skill as approval to bypass local guardrails.
- Do not ignore CRUD, FLS, sharing, or nCino managed-package boundaries.

## Escalation

Stop when a story is not traceable, a required component was not named in signed scope,
or the implementation appears to require an exception.
