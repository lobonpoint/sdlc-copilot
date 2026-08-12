<!-- v0.1.0 · created 2026-08-05 · updated 2026-08-05 · owner TBD -->
<!-- HARD CAP: 40 lines. This file loads on EVERY interaction for EVERY user and is
     metered every time. Every line here is a recurring org-wide cost. Add depth to a
     skill, not to this file. -->

# AI-Assisted SDLC

This repository holds the delivery method for our Salesforce/nCino work: what we do,
in what order, with our own standards. Type `/` in Copilot Chat to see the commands.

## Foundation skills

| Command | Who runs it | Produces |
|---|---|---|
| `/sdlc-po-intake` | Product Owner | Qualified Intake Brief |
| `/sdlc-arch-assess` | Solutions Architect | Solution Assessment with ROM |
| `/sdlc-arch-reconcile` | Solutions Architect | Signed-scope readiness |
| `/sdlc-po-stories` | Product Owner | Epics and stories with acceptance criteria |

Naming is `sdlc-<persona>-<skill>`. Personas: `po`, `arch`, `dev`, `qe`, `ops`.
A prefix is ownership, not permission — anyone may run any skill.

## Non-negotiables

- **Never invent policy.** If `sdlc-copilot/context/` does not cover it, say so and stop.
- **Never state an estimate without assumptions and a confidence level.**
- **Never produce approval, sign-off, or risk acceptance.** Name the human who must.
- **Surface conflicts between sources; never resolve them silently.** Name who decides.
- **Never copy context into a skill.** Reference `sdlc-copilot/context/` by path.
- **The committing developer owns AI-assisted code.** Nothing here transfers accountability.
- **AI gates stay Pending.** Only the named human verifier may accept or reject.
- **Load only declared context.** Use the skill's `reads_context` and named project inputs.

## Facts vs. method

`sdlc-copilot/context/` holds organizational facts. Skills hold method. Reference
guidance ranks below approved guardrails.

See `sdlc-copilot/docs/start-here.md` to begin; use `sdlc-copilot/docs/add-a-skill.md` to contribute.
