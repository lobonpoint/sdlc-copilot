<!-- v0.2.0 · created 2026-08-05 · updated 2026-08-12 · owner TBD -->

# Skills registry

Every skill in this repo, one line each.

Every skill declares its accountable role, verifier, human gate, verification evidence,
model tier, and required context. AI leaves every gate `Pending`; the approved system of
record retains the human decision.

**This is not just documentation. It is a collision check.** Only `name` and
`description` load at startup, and the model picks a skill by matching that text. Two
skills with overlapping descriptions make selection unpredictable and painful to debug.
Before you add a skill, read this list and make sure yours does not overlap.

## Naming

`sdlc-<persona>-<verb>` — persona workflow skills, this framework.

`sf-skills-<upstream-skill-name>` — Salesforce-origin skills copied, wrapped, or adapted
from `forcedotcom/sf-skills`. The prefix shows provenance; the suffix preserves the
upstream skill name.

| Prefix | Persona | Owns |
|---|---|---|
| `po` | Product Owner / BA | Intake, stories, UAT coordination |
| `arch` | Solutions Architect | Assessment, reconciliation, signed-scope readiness |
| `dev` | Dev Lead & Developers | Build breakout, scaffold, developer evidence |
| `qe` | Quality Engineering | Test automation and execution |
| `ops` | DevOps & Release | Promotion, release, support handoff |

`ops` means DevOps and Release. Production Support has no prefix — they receive release
artifacts, they do not operate this framework.

**A prefix is ownership, not permission.** Anyone may run any skill. Ownership means who
maintains it and who answers when it is wrong.

## Registry

### Persona workflow skills

| # | Skill | Persona | Owner | Status | Hands to | What it does |
|---|---|---|---|---|---|---|
| 01 | `sdlc-po-intake` | po | TBD | active | `sdlc-arch-assess` | Qualifies a business request into an Intake Brief, or names what is missing |
| 02 | `sdlc-arch-assess` | arch | TBD | active | `sdlc-arch-reconcile` | Produces a solution assessment with design, Well-Architected check, ROM, and governance routing |
| 03 | `sdlc-arch-reconcile` | arch | TBD | foundation | `sdlc-po-stories` | Reconciles assessment feedback into signed-scope readiness |
| 04 | `sdlc-po-stories` | po | TBD | active | `sdlc-dev-breakout` | Breaks signed scope into epics and stories with acceptance criteria |
| 05 | `sdlc-dev-breakout` | dev | TBD | foundation | `sdlc-dev-scaffold` + `sdlc-qe-automate` | Turns signed stories into a developer build plan |
| 06 | `sdlc-dev-scaffold` | dev | TBD | foundation | `sdlc-ops-promote` | Routes implementation scaffolding to approved vendor-origin skills and records evidence |
| 07 | `sdlc-qe-automate` | qe | TBD | foundation | `sdlc-qe-execute` | Designs QE automation, test data, permission cases, and traceability |
| 08 | `sdlc-ops-promote` | ops | TBD | foundation | `sdlc-qe-execute` | Checks promotion readiness and lower-environment deployment evidence |
| 09 | `sdlc-qe-execute` | qe | TBD | foundation | `sdlc-po-uat` | Structures QE execution evidence, defects, blockers, and UAT readiness |
| 10 | `sdlc-po-uat` | po | TBD | foundation | `sdlc-ops-release` | Coordinates UAT evidence, business feedback, and release handoff |
| 11 | `sdlc-ops-release` | ops | TBD | foundation | Production Support receives | Produces release readiness, runbook, validation, and support handoff artifacts |

### Salesforce-origin example skills

These are local wrapper examples whose upstream names were verified at commit
`42681202d4582d7716f029a815498db12fcee26e`. They do not contain verbatim upstream
implementations or all upstream resources.

| Skill | Vendor | Upstream skill | Owner | Status | What it demonstrates |
|---|---|---|---|---|---|
| `sf-skills-platform-apex-generate` | Salesforce | `platform-apex-generate` | TBD | example | Apex implementation routing with local standards and evidence |
| `sf-skills-automation-flow-generate` | Salesforce | `automation-flow-generate` | TBD | example | Flow/declarative automation routing with guardrails |
| `sf-skills-experience-lwc-generate` | Salesforce | `experience-lwc-generate` | TBD | example | LWC/UI implementation routing with traceability |
| `sf-skills-platform-soql-query` | Salesforce | `platform-soql-query` | TBD | example | SOQL authoring/review with access and governor-limit checks |
| `sf-skills-platform-metadata-deploy` | Salesforce | `platform-metadata-deploy` | TBD | example | Metadata deployment support without replacing release controls |

## The delivery spine

```
business request
      ↓
/sdlc-po-intake
      ↓
/sdlc-arch-assess
      ↓
/sdlc-arch-reconcile      [PO coordinates, PM/business signs]
      ↓
/sdlc-po-stories
      ↓
/sdlc-dev-breakout
      ├──→ /sdlc-dev-scaffold → /sdlc-ops-promote
      └──→ /sdlc-qe-automate  ───────────────┐
                                             ↓
                                      /sdlc-qe-execute
                                             ↓
                                      /sdlc-po-uat
                                             ↓
                                      /sdlc-ops-release
                                             ↓
                              Production Support receives
```

## Vendor-origin skills

Code generation and platform-specific implementation are deliberately outside the
`sdlc-*` spine. Salesforce maintains `forcedotcom/sf-skills` with skills for Apex, Flow,
LWC, SOQL, Agentforce, mobile, metadata, and related platform work. Our process skills
decide **when** a vendor skill is appropriate and what controls apply. The vendor-origin
skill handles **how** to perform that Salesforce-specific task.

Examples in this repo use `sf-skills-*`. Vendored Salesforce skills must be pinned,
reviewed, and tracked in `sdlc-copilot/context/reference/sf-skills.md`.
