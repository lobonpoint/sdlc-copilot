<!-- v0.1.0 · created 2026-08-05 · updated 2026-08-05 · owner TBD -->

# How this template works

Copy this folder. Two files, six steps, one checklist.

People copy examples far more than they read instructions, so the best thing to read
before writing your own is `.github/skills/sdlc-arch-assess/SKILL.md`. It is the
reference implementation.

---

## The six steps

**1. Copy the folder**

```
cp sdlc-copilot/template/SKILL.md .github/skills/sdlc-qe-testplan/SKILL.md
cp sdlc-copilot/template/example.prompt.md .github/prompts/sdlc-qe-testplan.prompt.md
```

Name it `sdlc-<persona>-<verb>` — **verb last.** This matches
`forcedotcom/sf-skills` (`platform-apex-generate`, `automation-flow-generate`), so our
library and Salesforce's read the same shape.

**2. Set `name` to exactly match the folder name**

`sdlc-qe-testplan` in the folder, `sdlc-qe-testplan` in the frontmatter. Lowercase,
hyphens, no consecutive hyphens.

Get this wrong and the skill silently does not load. Nothing warns you. This is the
single most common failure.

**3. Write the description last, and write it carefully**

Only `name` and `description` load at startup. The description alone decides whether
your skill is selected. A perfect body is invisible if the description never matches.

Bad — describes itself:
> This skill helps with test planning.

Good — describes the trigger:
> Produces a test plan and candidate test cases from a story's acceptance criteria,
> with traceability from each case back to a criterion. Use when a story is ready for
> development and QE needs to prepare validation. Do not use for test execution or
> defect triage.

Then check `sdlc-copilot/SKILLS.md` — if an existing description overlaps yours, routing becomes
unpredictable and it is genuinely painful to debug.

**4. Write the body**

Purpose, Inputs required, Method, Output structure, Human control record, Prohibited,
Escalation.

Keep it under 500 lines. Push depth into `references/` — those load only when your
instructions point at them.

Follow the house style: terse and imperative, numbered phases, a pre-flight section
listing stop conditions, and pointers to references rather than inlined detail. Read
`.github/skills/sdlc-arch-assess/SKILL.md` for the pattern.

Your skill folder may contain, per the Agent Skills spec:

| Directory | Holds |
|---|---|
| `SKILL.md` | **Required.** The method |
| `references/` | Detail the skill points at when needed |
| `assets/` | Templates, schemas, lookup data |
| `scripts/` | Executable scripts |

Two editing tests:
- **Would the model already know this?** Cut it. Write what it lacks — our conventions,
  our constraints — not what it learned from the internet.
- **How expensive is a mistake here?** Be prescriptive where it is expensive. Leave room
  where judgment is the point.

**5. Point at context, never copy from it**

```markdown
Read `sdlc-copilot/context/org-guardrails.md` before starting.
```

Never paste guardrail content into your skill. When the same fact lives in two files
and one gets edited, the framework starts producing confidently contradictory output —
which is worse than no framework, because it still looks authoritative.

**6. Register it and open a PR**

Add one line to `sdlc-copilot/SKILLS.md`. Then the checklist below.

---

## Before you open the PR

- [ ] Folder name and `name` field match exactly
- [ ] `description` says what it does **and** when to use it, and when not to
- [ ] No description collision with anything in `sdlc-copilot/SKILLS.md`
- [ ] `metadata.owner` is a person, not a team
- [ ] `created`, `updated`, `version` set
- [ ] Accountable role, verifier, human gate, and verification evidence are named
- [ ] `model_tier` is `efficient`, `balanced`, or `deep-reasoning`; prompt uses Auto by default
- [ ] `allowed-tools` set to read-only if the skill produces a document
- [ ] Body under 500 lines; depth in `references/`
- [ ] Points at `sdlc-copilot/context/` by path; nothing copied
- [ ] `## Prohibited` section present and specific
- [ ] `## Human control record` leaves the gate `Pending` for a named verifier
- [ ] Prompt body is a concise launcher; all method stays in the skill
- [ ] No angle brackets `<` `>` in frontmatter — they can inject into the system prompt
- [ ] Added to `sdlc-copilot/SKILLS.md`

---

## Does this deserve a skill?

Three tests. It needs all three.

1. **Used more than once.** One-off work is a chat message.
2. **Used by more than one person.** Otherwise it is your personal prompt.
3. **Encodes method or judgment**, not phrasing. If it is a nicely-worded request, it
   is a prompt, not a skill.

Without this bar you reach two hundred skills in a year, nobody can find anything, and
selection degrades for everyone — because the model is choosing from a longer list of
overlapping descriptions.

---

## What you own, and what needs agreement

**Your team owns its prefix.** Add, edit, and version `sdlc-qe-*` without asking anyone.
That is the point — it is how five teams move at their own pace.

**Needs framework-owner agreement:** changing a handoff contract between existing skills, editing
`.github/copilot-instructions.md` (every line is metered for every user on every turn),
adding a new persona prefix, or changing anything in `sdlc-copilot/context/`.

---

## A note on security

An audit of 3,984 public skills in February 2026 found 36% carried at least one security
flaw. That is why this repo has a review checklist and why vendored external skills need
license and content review rather than a bulk copy.

Your skill will be read by people and executed by an agent with access to an organization's
delivery process. The checklist is short on purpose. Please actually run it.
