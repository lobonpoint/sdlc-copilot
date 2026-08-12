<!-- v0.1.0 · created 2026-08-05 · updated 2026-08-05 · owner TBD -->

# Context library

Facts about **this organization**. Skills read these by path and never copy from them.

## What belongs here

- What we do and do not do (`org-guardrails.md`)
- How we are structured and how we deliver (`org-profile.md`)
- What things cost us (`estimation-rubric.md`)
- Developer implementation standards (`dev-standards.md`)
- QE test design and execution standards (`qe-standards.md`)
- Release, promotion, and support handoff standards (`release-standards.md`)
- nCino managed-package boundaries (`ncino-boundaries.md`)
- Security, access, and data-handling standards (`security-and-access.md`)
- Model tier definitions and routing rules (`model-routing.md`)

## What does not belong here

- **Method** — how to run an assessment. That lives in a skill.
- **Technique** — how to write good Apex, Flow, LWC, SOQL, or metadata. That is the
  upstream Salesforce-origin layer tracked in `sdlc-copilot/context/reference/sf-skills.md`.
- **Industry guidance** — Well-Architected, integration patterns. Those go in
  `sdlc-copilot/context/reference/` and rank *below* everything in this folder.
- **Copied policy text.** Never paste enterprise policy into this repo. Reference the
  system of record. Copied policy goes stale and becomes a compliance liability.

## Authority hierarchy

When sources conflict, this is the order. Skills must surface the conflict and name a
decision owner rather than resolving it.

1. Law and regulation
2. Enterprise policy
3. Approved enterprise architecture pattern
4. Org guardrail (this folder)
5. Project ADR
6. Team convention
7. Generic industry best practice (`sdlc-copilot/context/reference/`)

## Ownership

This folder needs **one named owner**, not a team.

Stale guardrails do not fail loudly. They produce confident assessments built on last
year's standard — which is worse than no framework, because the output still looks
authoritative.

- **Owner:** TBD
- **Review cadence:** quarterly
- **Next review:** TBD

This date is not decorative.

## Right-sized context loading

Load the smallest authoritative package that is sufficient for the current task:

1. `.github/copilot-instructions.md` supplies the short, always-on rules.
2. The matched `SKILL.md` supplies the method and control contract.
3. `metadata.reads_context` names only the organizational context required by that skill.
4. The user names the current project artifacts required as inputs.

Do not load the whole context library or project folder "just in case." Too little context
creates assumptions and missed controls. Too much context adds stale or conflicting facts,
increases disclosure risk, and spends tokens without improving the decision. The target is
not simply fewer tokens; it is **relevant, current, authoritative, and sufficient context**.
