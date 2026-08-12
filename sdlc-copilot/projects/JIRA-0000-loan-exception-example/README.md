<!-- v0.1.0 · 2026-08-05 · owner TBD · SYNTHETIC — invented scenario and data -->

# Example project — commercial loan exception request

**Everything here is invented.** No real customer, no real figures, no real policy.

| Field | Value |
|---|---|
| Intake ticket | `JIRA-0000` (synthetic placeholder) |
| Project code | `TBD` |
| Current SDLC step | `04` — story creation |
| Business owner | Synthetic Product Owner |
| Delivery owner | Synthetic Dev Lead |
| Data classification | Synthetic data only |

## The scenario

A commercial lending business line wants relationship managers to submit policy exception
requests in the loan origination system rather than by email, so exceptions are tracked,
routed for approval, and auditable.

Chosen because it exercises the parts of the chain that matter: customer data, an approval
workflow, a regulatory audit driver, and an integration.

## Read in order

| File | Produced by | Shows |
|---|---|---|
| `01-intake-brief.md` | `/sdlc-po-intake` | What a qualified brief looks like, including a gap that was named rather than assumed |
| `02-assessment.md` | `/sdlc-arch-assess` | A ROM as a range with confidence, a rejected alternative, and a guardrail gap flagged |
| `03-stories.md` | `/sdlc-po-stories` | Testable acceptance criteria and scope additions flagged rather than absorbed |

This example focuses on the early chain. It is not a full eleven-step production delivery.

## What to notice

Each artifact **names what it does not know.** The intake brief carries an open question
with an owner. The assessment flags a capability with no disposition in the register. The
story breakout separates one item as a proposed addition rather than folding it in.

That is the framework working. An artifact with no open questions is usually an artifact
that guessed.
