---
name: sdlc-arch-assess
description: >
  Produces a solution assessment from a qualified intake brief: current-state gap,
  high-level design with one rejected alternative, Well-Architected evaluation,
  integration pattern selection, component scope, ROM range with stated assumptions and
  a confidence level, and governance routing. Use when an intake brief is marked
  Qualified and needs architectural evaluation before scope sign-off. Do not use for
  detailed design, story breakout, or code generation.
license: Apache-2.0
allowed-tools: Read Grep Glob
metadata:
  owner: TBD
  persona: arch
  version: "0.2.0"
  created: "2026-08-05"
  updated: "2026-08-05"
  status: active
  model_tier: deep-reasoning
  accountable_role: Solutions Architect
  verifier_role: Architecture reviewer
  human_gate: Assessment accepted for stakeholder review
  verification_evidence: Design, rejected alternative, ROM assumptions, and governance routing
  sdlc_step: "02"
  input_from: sdlc-po-intake
  output_to: sdlc-arch-reconcile
  reads_context: org-guardrails.md, org-profile.md, estimation-rubric.md
---

# Solution Assessment

Read-only. Produces a document. Does not write code, modify metadata, or touch an org.

## Reference material

- **Well-Architected** — pillars, sub-qualities, anti-pattern table, priority order:
  `references/well-architected-reference.md`
- **Integration patterns** — the five patterns, selection table, idempotency requirement:
  `references/integration-patterns-reference.md`
- **Output template** — section order and control block: `assets/assessment-template.md`

## Pre-flight — stop conditions

Verify all four before starting. If any fails, **stop and state which one.**

1. Intake brief present and classified `Qualified`
2. `sdlc-copilot/context/org-guardrails.md` populated
3. `sdlc-copilot/context/org-profile.md` populated
4. `sdlc-copilot/context/estimation-rubric.md` populated

Do not proceed on assumption. An assessment grounded in nothing still reads as
authoritative — that is the failure being prevented.

## Phase 1 — Frame

1. **Restate the problem** in one paragraph, business terms. Cannot restate clearly →
   intake is not qualified. Return it and name what is unclear.
2. **Current state** — what exists, what is missing, what must change. Name the systems.

## Phase 2 — Design

3. **Proposed approach** — named components, integration points, data model impact,
   security and sharing impact. Be concrete: "a Flow on Opportunity," not "automation."
4. **Rejected alternative** — name a second approach considered and why not chosen.
   **Mandatory.** No rejected alternative means a first instinct was documented, not an
   evaluation performed.

## Phase 3 — Evaluate

5. **Well-Architected** — for each pillar record: what the design does well, what it
   risks, anti-pattern exposure (named, or "none identified"). See reference.
   Conflict order is **Trusted → Easy → Adaptable.** State it when applied.
6. **Integration pattern** — only if an external system is involved. Name the pattern
   and why. State idempotency handling for anything retryable. See reference.
7. **Guardrail dispositions** — per capability touched, name its disposition from
   `sdlc-copilot/context/org-guardrails.md`: `Retain` · `Contain` ·
   `Remediate-when-touched` · `Migrate` ·
   `Retire` · `Exception`.

   Quote verbatim: *Existing implementation does not automatically establish an approved
   precedent for new implementation.*

   No disposition in the register → **mark it a gap.** Do not infer.

## Phase 4 — Size

8. **Component scope** — count by type. State what is counted and what is assumed.
9. **ROM estimate** — a range, never a number. Each carries stated assumptions, a
   confidence level (High / Medium / Low), and the reason for that level. Use
   `sdlc-copilot/context/estimation-rubric.md`. Rubric does not cover a type → say so,
   do not guess.

## Phase 5 — Route

10. **Governance routing** — which reviews, and why each triggers.
11. **Risks and dependencies** — each with a named owner. A risk with no owner is a
    sentence.
12. **Epic candidates** — coarse only. Story creation happens in `sdlc-po-stories`
    after `sdlc-arch-reconcile` confirms sign-off readiness.

## Output

Sections in this order. See `assets/assessment-template.md`.

Control block · Problem restatement · Current state and gap · Proposed approach ·
Alternative considered · Well-Architected evaluation · Integration pattern *(if
applicable)* · Guardrail dispositions · Component scope · ROM with assumptions and
confidence · Governance routing · Risks and dependencies · Epic candidates · Open
questions with named owners

## Human control record

Include the accountable role, verifier, human gate status (`Pending`, `Accepted`, or
`Rejected`), source artifact versions, context files consulted, model tier used,
assumptions, and unresolved gaps. AI must leave the gate `Pending`; only the named
verifier may change it.

## Prohibited

- **No estimate without assumptions and a confidence level.** A bare number gets quoted
  back as a commitment.
- **Never resolve a source conflict silently.** Surface both positions, name who decides.
- **Never state a guardrail disposition absent from the register.** Absent means gap.
- **Never produce approval, sign-off, or risk acceptance.** Name the human who must.
- **Never invent organizational policy.** Context does not cover it → say so.
- Do not write code. Do not modify metadata. Do not deploy.

## Escalation

Stop and name a human when:

- Intake is not `Qualified`
- A required context file is missing, empty, or stale
- The request conflicts with a stated guardrail
- Regulatory implications exceed what the context library covers
- Scope appears materially larger than the intake described

## Note on estimate quality

Early ROM accuracy will be mediocre. What is bought immediately is consistency — same
method, same context, same structure. Accuracy accrues only when actuals feed back into
`estimation-rubric.md`. State this when presenting; the credibility is worth more than
the claim.
