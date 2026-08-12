<!-- v0.1.0 · created 2026-08-12 · updated 2026-08-12 · owner TBD -->

# Salesforce sf-skills reference register

> **Everything in this file is external vendor-origin guidance, not organizational policy.**
> It ranks below `sdlc-copilot/context/org-guardrails.md`, `sdlc-copilot/context/dev-standards.md`, and approved
> enterprise architecture patterns.

## Upstream

- **Repository:** `https://github.com/forcedotcom/sf-skills`
- **Purpose:** Salesforce skills for platform implementation tasks such as Apex,
  Flow, LWC, SOQL, Agentforce, mobile, metadata, permissions, and analysis.
- **Local role:** Vendor-origin skills. Our `sdlc-*` skills decide when an
  `sf-skills-*` skill is appropriate and what controls apply. Salesforce skills handle how
  to perform a specific Salesforce task.
- **Source verified at:** `42681202d4582d7716f029a815498db12fcee26e`

The five local entries are **integration wrappers**, not verbatim copies of Salesforce's
skills. They demonstrate naming, routing, local controls, evidence, and provenance. Do
not represent them as installed vendor implementations until the upstream folders and
their required resources are imported, licensed, reviewed, and pinned.

## Vendoring policy

Do not rename upstream Salesforce skills into the `sdlc-*` namespace. Use
`sf-skills-<upstream-skill-name>` so future sync and review are possible.

Vendored or referenced skills require:

1. Pinned commit or release
2. License review
3. Security review, if scripts or executable assets are included
4. Local wrapper or routing note from an `sdlc-*` skill
5. Named owner and review date

## Approved skills

| Upstream skill | Imported as | Covers | Verified source | Status | Owner | Review date |
|---|---|---|---|---|---|---|
| `platform-apex-generate` | `sf-skills-platform-apex-generate` | Apex implementation and tests | `4268120` | wrapper example | TBD | TBD |
| `automation-flow-generate` | `sf-skills-automation-flow-generate` | Flow/declarative automation | `4268120` | wrapper example | TBD | TBD |
| `experience-lwc-generate` | `sf-skills-experience-lwc-generate` | LWC/UI implementation | `4268120` | wrapper example | TBD | TBD |
| `platform-soql-query` | `sf-skills-platform-soql-query` | SOQL authoring and review | `4268120` | wrapper example | TBD | TBD |
| `platform-metadata-deploy` | `sf-skills-platform-metadata-deploy` | Metadata deployment support | `4268120` | wrapper example | TBD | TBD |

## Candidate starting set

| Candidate | Why it may matter |
|---|---|
| Agentforce skills | Agent design, analysis, and implementation |
| OmniStudio skills | Integration Procedures, OmniScripts, Data Mappers, and FlexCards |
| permission/object/field skills | Security and metadata modeling |

## Constraint

Salesforce's public skill library evolves quickly. Treat upstream names, behavior, and
folder structure as versioned dependencies. Review and pin before use.
