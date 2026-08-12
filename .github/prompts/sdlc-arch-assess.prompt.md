---
# v0.1.0 · created 2026-08-05 · updated 2026-08-06 · owner TBD
agent: agent
# Model intentionally omitted: use Auto; the matching skill declares the model tier.
description: Produce a solution assessment from a qualified Intake Brief.
---

Produce a solution assessment using the `sdlc-arch-assess` skill.

Provide the qualified Intake Brief. If its classification is not `Qualified`, stop and
say so rather than assessing it.

Read the context library before starting. If a required file is missing or empty, name
it and stop.
