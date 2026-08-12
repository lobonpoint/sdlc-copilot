<!-- v0.2.0 · created 2026-08-05 · updated 2026-08-12 · owner TBD -->

# Start here

Find your role. Read that section. Then look at `sdlc-copilot/SKILLS.md` for the full delivery spine.

Every output names an accountable role, verifier, evidence requirement, and human gate.
Copilot may prepare the record, but only the named human verifier may accept or reject it.
Prompts use Copilot Auto by default; skills declare a stable model tier.

---

## Product Owner / Business Analyst

You own intake, story creation, and UAT coordination.

### `/sdlc-po-intake`

**When:** a business line raises a request.
**You provide:** the request — an email, form, notes, or conversation summary.
**You get back:** a qualified Intake Brief, or a specific list of what is missing and who
to ask.

It will not estimate and will not propose a solution.

### `/sdlc-po-stories`

**When:** assessment feedback is reconciled and scope is signed.
**You provide:** signed scope or signed assessment.
**You get back:** epics and stories with Given/When/Then acceptance criteria, named
components, dependency sequencing, and traceability.

Anything that does not trace back to signed scope is flagged as a proposed addition.

### `/sdlc-po-uat`

**When:** QE execution evidence is ready for business validation.
**You provide:** QE evidence, signed stories, business feedback, and UAT owner.
**You get back:** UAT evidence, decision record, defects or scope additions, and release
handoff notes.

It does not approve UAT for the business.

---

## Solutions Architect

You own assessment and reconciliation.

### `/sdlc-arch-assess`

**When:** an Intake Brief is marked `Qualified`.
**You provide:** the qualified brief and populated context files.
**You get back:** problem restatement, current-state gap, proposed approach, rejected
alternative, Well-Architected evaluation, integration pattern, guardrail dispositions,
component scope, ROM range, assumptions, confidence, governance routing, risks, and epic
candidates.

It will stop if required `sdlc-copilot/context/` files are empty.

### `/sdlc-arch-reconcile`

**When:** stakeholders have reviewed the assessment.
**You provide:** assessment, feedback, decision notes, and sign-off authority.
**You get back:** feedback dispositions, assessment changes, signed-scope readiness,
proposed additions, open decisions, and sign-off readiness.

It does not approve scope.

---

## Developer / Dev Lead

You own build planning and implementation evidence.

### `/sdlc-dev-breakout`

**When:** signed stories are ready for development planning.
**You provide:** signed stories, acceptance criteria, named components, and traceability.
**You get back:** build plan, component impact, implementation sequence, test
responsibilities, deployment impact, and Salesforce-origin skill routing.

It does not generate code.

### `/sdlc-dev-scaffold`

**When:** a developer build plan is ready to implement.
**You provide:** build plan, signed stories, and local Salesforce project context.
**You get back:** scaffold plan, Salesforce-origin skills used or recommended, changed component
inventory, unit-test evidence, security/access evidence, and deployment notes.

The committing developer still owns the work.

---

## Quality Engineering

You own test automation design and execution evidence.

### `/sdlc-qe-automate`

**When:** developer breakout is ready and QE can work in parallel with implementation.
**You provide:** signed stories, acceptance criteria, and developer breakout.
**You get back:** traceability matrix, automation candidates, manual test cases, test data
needs, permission/security cases, integration checks, and blockers.

It does not mark testing complete.

### `/sdlc-qe-execute`

**When:** changes are promoted and QE execution begins.
**You provide:** test plan, promotion notes, executed results, defects, and blockers.
**You get back:** execution summary, scenario results, defect classification, blockers,
regression impact, and UAT readiness recommendation.

It does not approve UAT or release.

---

## DevOps & Release

You own promotion and release readiness.

### `/sdlc-ops-promote`

**When:** implementation evidence is ready for promotion.
**You provide:** changed component inventory, developer evidence, QE automation plan, and
deployment notes.
**You get back:** promotion summary, deployment sequence, missing evidence, environment
dependencies, rollback or forward-fix notes, and QE execution handoff.

It does not approve production release.

### `/sdlc-ops-release`

**When:** UAT evidence is ready for release decisioning.
**You provide:** UAT outcome, QE evidence, promotion notes, deployment sequence, and
release owner.
**You get back:** release readiness summary, runbook, validation checklist,
rollback/forward-fix plan, communication checkpoints, release notes, and Production
Support handoff.

It does not replace release management controls.

---

## Production Support

Production Support receives release artifacts. They do not own a prefix in this
framework.

---

## Everyone

Run the validator before opening a PR:

```bash
bash sdlc-copilot/scripts/validate-skills.sh
```

Framework rollout succeeds when teams extend their own namespace and the handoffs remain
visible in the repo.
