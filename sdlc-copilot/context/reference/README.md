<!-- v0.1.0 · created 2026-08-05 · updated 2026-08-05 · owner TBD -->

# Reference — industry guidance

> **Everything in this folder is industry guidance, not organizational policy.**
> It ranks *below* `sdlc-copilot/context/org-guardrails.md` in the authority hierarchy.
> Never cite anything here as an internal standard.

This separation exists for one reason. If external best practice sits in the same
folder as our own guardrails, an assessment six months from now will cite a blog post
with the same weight as our data classification standard, and nobody will be able to
tell the difference from the output.

## What goes here

Vendored copies of external guidance after OSS license review. Candidates:

| Source | Covers | License | Status |
|---|---|---|---|
| `forcedotcom/sf-skills` | Apex, Flow, LWC, SOQL, Agentforce generation skills | Apache-2.0 | not reviewed |
| `github/spec-kit` | Spec-driven workflow conventions | MIT | not reviewed |
| `Clientell-Ai/salesforce-skills` | Apex, security, deployment skills | check | not reviewed |
| `SalesforceDiariesBySanket/Copilot-Skills-Salesforce` | Apex/LWC rulesets, references structure | check | not reviewed |
| `github/awesome-copilot` | Prompt and instruction catalog patterns | check | not reviewed |

## Two constraints

**No internet access at runtime.** Copilot here cannot fetch anything. Everything must
be physically copied into the repo — a deliberate vendoring decision, not a dependency.

**Copying third-party content into this repo requires OSS license review.** Nothing
moves to `approved` without it.

## Where the Salesforce-origin layer lands

When Salesforce skills are vendored, preserve their upstream names such as
`platform-apex-generate` or `automation-flow-generate`. Do **not** rename them into the
`sdlc-*` namespace. Different namespace because it is a different kind of thing:

- `sdlc-*` is **process** — what we do, in what order, who signs
- upstream Salesforce-origin skills are **technique** — how to write Apex, Flow, LWC,
  SOQL, metadata, and related platform artifacts

Note that `forcedotcom/sf-skills` warns its skills change frequently and may be renamed
or removed between releases. Vendor a pinned snapshot; do not track main.

Track candidate, approved, and pinned Salesforce skills in `sf-skills.md`.
