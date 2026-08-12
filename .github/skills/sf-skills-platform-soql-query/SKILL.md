---
name: sf-skills-platform-soql-query
description: >
  Example Salesforce-origin skill wrapper for SOQL query authoring and review, mapped to
  the upstream forcedotcom/sf-skills platform-soql-query skill. Use when signed implementation
  work requires SOQL, relationship queries, aggregates, selectivity review, or query
  optimization. Do not use for unmanaged data extraction.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  vendor: Salesforce
  upstream_repo: forcedotcom/sf-skills
  upstream_skill: platform-soql-query
  imported_as: sf-skills-platform-soql-query
  version: "0.1.0"
  created: "2026-08-12"
  updated: "2026-08-12"
  status: example
  model_tier: balanced
  accountable_role: Developer
  verifier_role: Dev Lead
  human_gate: Developer validation complete
  verification_evidence: Query purpose, access review, selectivity, and test evidence
  input_from: sdlc-dev-breakout, sdlc-dev-scaffold
  output_to: sdlc-dev-scaffold
  reads_context: dev-standards.md, security-and-access.md
---

# Salesforce SOQL Skill Example

This example shows how to route query authoring to an official Salesforce-origin skill
while preserving local standards and SDLC evidence.

## Upstream

See `upstream.md` for the Salesforce source, review fields, and local mapping.

## Pre-flight

Stop unless signed scope identifies the data need, objects, filters, and where the query
will run. Read every file listed in `metadata.reads_context` from
`sdlc-copilot/context/`; stop if a required file is not populated or upstream review is
incomplete.

## Method

1. Confirm the query supports signed implementation work.
2. Identify objects, relationships, filters, volumes, indexes, and security constraints.
3. Use or adapt the upstream Salesforce SOQL skill only after review/pinning is complete.
4. Capture selectivity, governor-limit considerations, and test evidence.

## Output

SOQL notes · Query purpose · Object and relationship assumptions · Selectivity and limit
risks · Security/access checks · Upstream skill version used · Open questions

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- Do not query data outside signed scope.
- Do not ignore CRUD/FLS, sharing, selectivity, or governor-limit risk.
- Do not treat query output as approved data movement.
- Do not treat upstream Salesforce examples as local policy.
