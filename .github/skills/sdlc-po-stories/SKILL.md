---
name: sdlc-po-stories
description: >
  Breaks a signed solution assessment into epics and user stories with Given/When/Then
  acceptance criteria, named Salesforce components, dependency sequencing, and
  traceability back to the assessment. Flags any story that does not trace to signed
  scope. Use when an assessment has been reviewed and signed off and work needs to reach
  a backlog. Do not use before sign-off, and do not use to estimate story points.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: po
  version: "0.2.0"
  created: "2026-08-05"
  updated: "2026-08-05"
  status: active
  model_tier: balanced
  accountable_role: Product Owner / BA
  verifier_role: Dev Lead and QE representative
  human_gate: Stories accepted for developer breakout
  verification_evidence: Acceptance criteria, component traceability, and scope additions
  sdlc_step: "04"
  input_from: sdlc-arch-reconcile
  output_to: sdlc-dev-breakout
  reads_context: org-profile.md
---

# Story Creation

Read-only. Turns a signed assessment into stories good enough that a developer does not
reconstruct intent from a title and a hallway conversation.

**Acceptance criteria written here are consumed twice** — once by whoever builds it, once
by whoever tests it. Vague criteria degrade two downstream activities, not one. This is
the highest-leverage writing in the chain.

## Pre-flight — stop conditions

1. Reconciled assessment present
2. Assessment **signed off**
3. `sdlc-copilot/context/org-profile.md` populated

Not signed off → **stop.** Breaking out against unsigned scope means doing it twice, and
the second version is the one people argue about.

Note the signed scope version. Every story traces back to it.

## Phase 1 — Derive epics

Start from the assessment's epic candidates. An epic is a slice of business capability,
not a technical layer.

- Good: "Loan officer can submit an exception request"
- Not an epic: "Build the Apex layer"

## Phase 2 — Break into stories

Format: `As a <role>, I want <capability>, so that <outcome>.`

The `so that` clause is not decoration. Cannot be written → the story may not be worth
building.

Each story must be:

| | Test |
|---|---|
| **Independent** | Buildable without waiting on another, where possible |
| **Negotiable** | Describes the need, not the implementation |
| **Valuable** | A person or system is better off when it ships |
| **Estimable** | The team can size it. Cannot → too vague |
| **Small** | Completable within a sprint |
| **Testable** | You can state how you would know it works |

Fails **Testable** → not a story yet. Send it back to the assessment.

## Phase 3 — Write acceptance criteria

```
Given   <starting state or precondition>
When    <action or trigger>
Then    <observable, checkable outcome>
```

- **Observable outcomes only.** "Then the record is updated" is checkable. "Then the
  process works correctly" is not.
- **Cover negative paths** — invalid input, missing permission, failed integration.
  Happy-path-only criteria produce happy-path-only tests.
- **Include permission and sharing scenarios** where profiles differ.
- **One behavior per criterion.** Needs an "and" → probably two.

## Phase 4 — Name components and sequence

1. Name the components each story touches, **from the assessment**, not from
   imagination. Touches something the assessment did not name → scope flag, Phase 5.
2. Sequence by dependency. Flag anything on the critical path and say why.

## Phase 5 — Trace, and flag what does not

Every story cites the assessment section it comes from.

**A story tracing to nothing is scope creep.** Do not quietly include it. Do not silently
drop it. List it separately as a proposed addition with a note that it was not in signed
scope and needs a decision.

This is the single most valuable thing this skill does. Scope arriving after sign-off is
how estimates become wrong without anyone noticing.

## Output

1. Control block — assessment version, date, author
2. Epic list with one-line descriptions
3. Stories grouped by epic, each with: story statement · acceptance criteria · named
   components · dependencies · assessment traceability reference
4. Sequencing view — what must come first, and why
5. **Proposed scope additions** — anything untraced, flagged for decision
6. Open questions with named owners

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- **Never invent requirements not in the assessment.** Needed and not there → flag as a
  scope addition.
- **Never write acceptance criteria that cannot be tested.**
- **Never estimate story points.** That belongs to the team, in planning, with the people
  doing the work. An estimate here anchors them.
- **Never silently absorb scope.**

## Escalation

Stop and name a human when: the assessment is not signed off; a story cannot be made
testable without a decision nobody has made; or traced scope is materially larger than
the assessment described.

## Definition of good

A developer picks up a story and knows what to build, which components to touch, what
"done" means, and where the decision came from — without asking anyone.

Still has to ask → the story is not finished.
