---
# ---------------------------------------------------------------------------
# REQUIRED — these two are the only fields the Agent Skills spec requires.
# ---------------------------------------------------------------------------

# Max 64 chars. Lowercase letters, numbers, hyphens only. No leading, trailing,
# or consecutive hyphens. MUST MATCH THE FOLDER NAME EXACTLY.
# If it does not match, the skill silently does not load and nothing tells you why.
#
# Convention: sdlc-<persona>-<verb>. VERB LAST, matching forcedotcom/sf-skills
# (platform-apex-generate, automation-flow-generate).
name: sdlc-persona-verb

# Max 1024 chars. THE HIGHEST-LEVERAGE TEXT IN THIS FILE.
# Only name + description load at startup — this alone decides whether your skill
# gets picked. Say WHAT it does and WHEN to use it. Add when NOT to use it.
# Avoid angle brackets < > anywhere in frontmatter.
description: >
  Does X from input Y, producing Z. Use when [name the specific trigger condition].
  Do not use for [the adjacent thing people will confuse this with].

# ---------------------------------------------------------------------------
# OPTIONAL — spec fields
# ---------------------------------------------------------------------------

license: Apache-2.0

# Restricts what the agent may do while this skill is active.
# Set read-only tools for any skill that produces a document rather than code.
# Experimental in the spec; support varies. Harmless where unsupported.
allowed-tools: Read Grep Glob

# ---------------------------------------------------------------------------
# OPTIONAL — our conventions. The spec allows arbitrary keys under `metadata`.
# Keeping them here rather than at top level keeps us spec-compliant.
# ---------------------------------------------------------------------------
metadata:
  owner: TBD              # a PERSON, not a team. Teams do not maintain files.
  persona: po             # po | arch | dev | qe | ops
  version: "0.1.0"
  created: "2026-08-05"
  updated: "2026-08-05"   # bump in the same commit as any content change
  status: draft           # draft | foundation | active | retired
  model_tier: balanced    # efficient | balanced | deep-reasoning
  accountable_role: TBD  # human who owns the outcome
  verifier_role: TBD     # human who checks the evidence
  human_gate: TBD        # decision required before handoff
  verification_evidence: TBD
  input_from: TBD         # which skill or source feeds this
  output_to: TBD          # which skill consumes the output
  reads_context: TBD      # comma-separated files from sdlc-copilot/context/
---

# <Skill Name>

<!-- BODY BUDGET: under 500 lines / ~5000 tokens. The whole body loads when the
     skill activates. Push depth into references/ — the agent loads those only when
     the instructions point at them. Keep references one level deep.

     SKILL FOLDER STRUCTURE (Agent Skills spec, same as forcedotcom/sf-skills):
       SKILL.md      required
       references/   optional — detail the skill points at when needed
       assets/       optional — templates, schemas, lookup data
       scripts/      optional — executable scripts

     HOUSE STYLE: terse and imperative. Number the phases. Put stop conditions in a
     pre-flight section. Point at references rather than inlining detail. -->

## Reference material

<!-- List what this skill points at, so a reader knows what exists. -->

- **<name>** — what it covers: `references/<name>-reference.md`
- **<template>** — output shape: `assets/<name>-template.md`

## Pre-flight — stop conditions

<!-- What must be true before starting. If any fails, stop and say which one. -->

## Purpose

One paragraph. What this produces and why it exists. If you cannot say why it exists
in one paragraph, it may not need to.

## Inputs required

What must be present. **And what to do when it is not** — usually stop and say which
input is missing, rather than proceeding on assumption.

## Method

Numbered steps.

Two rules from the Agent Skills best-practice guidance:

- **Write what the model lacks, omit what it knows.** It knows Apex syntax. It does not
  know our promotion path. Cut anything general.
- **Match specificity to fragility.** Be prescriptive where mistakes are expensive
  (security, governor limits, anything regulated). Leave room where judgment is the
  point.

## Output structure

The exact sections, in order. Consistency here is what makes the next skill able to
consume this one.

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

**Not optional.** A skill that cannot say what it must not do has not been thought
through — and this section is what stops the model from being helpful in the wrong
direction.

Always include, where relevant:
- Never produce approval, sign-off, or risk acceptance
- Never invent organizational policy
- Never resolve a source conflict silently

## Escalation

When to stop and name a human.
