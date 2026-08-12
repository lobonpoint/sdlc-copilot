<!-- v0.1.0 · created 2026-08-05 · updated 2026-08-05 · owner TBD -->

# Add a skill

Your team owns its prefix. `sdlc-qe-*` is QE's. Add, edit, and version without a ticket.

> **You may extend your own namespace. You may not change the spine.**

Full walkthrough with annotated examples: `sdlc-copilot/template/README.md`.
Best reference implementation to copy: `.github/skills/sdlc-arch-assess/SKILL.md`.

---

## Quick version

1. Create `.github/skills/sdlc-<persona>-<verb>/` and copy only
   `sdlc-copilot/template/SKILL.md` into it
2. Copy `sdlc-copilot/template/example.prompt.md` to
   `.github/prompts/sdlc-<persona>-<verb>.prompt.md`
3. Set `name` to **exactly** the folder name. Mismatch means silent non-loading
4. Write the description as a trigger: what it does, when to use it, when not to
5. Declare the accountable role, verifier, human gate, evidence, and model tier
6. Write the body — Purpose, Inputs, Method, Output, Human control record, Prohibited, Escalation
7. Point at only the required `sdlc-copilot/context/` files; copy nothing
8. Add a line to `sdlc-copilot/SKILLS.md`, check for description overlap, and run the validator

The validator catches the silent failures. Your PR runs it automatically, but running it
locally first saves a round trip.

---

## The three rules that cause silent failures

**Folder name must equal `name`.** Lowercase, hyphens, no consecutive hyphens, max 64
characters. Wrong and the skill never loads. Nothing tells you.

**`description` is a routing rule, not a summary.** Only `name` and `description` load
at startup — this text alone decides selection. Write "Use when…" and name the trigger.
Add "Do not use for…" naming the adjacent thing people will confuse it with.

**No angle brackets in frontmatter.** `<` and `>` can inject unintended instructions
into the system prompt. Use `TBD`, not `<OWNER>`.

---

## Budgets

| Thing | Limit | Why |
|---|---|---|
| `SKILL.md` body | 500 lines / ~5000 tokens | Loads entirely on activation |
| `description` | 1024 chars | Spec limit |
| Prompt body | Concise launcher only | Method goes in the skill |
| Model selection | Auto by default | Declare a stable tier in the skill; pin only after evaluation |
| `references/` depth | One level | Avoid nested reference chains |
| `copilot-instructions.md` | 40 lines | Metered every turn for every user |

Over budget? Move depth into `references/` inside your skill. Those load only when your
instructions point at them.

---

## Two editing tests

**Would the model already know this?** Cut it. Write what it lacks — our promotion path,
our guardrails, our conventions — not what it learned from the internet.

**How expensive is a mistake here?** Be prescriptive where mistakes are costly: security,
governor limits, anything regulated. Leave room where judgment is the point. Matching
specificity to fragility is the difference between a skill that helps and one people
route around.

---

## Does it deserve a skill?

All three, or it is a personal prompt:

1. Used more than once
2. Used by more than one person
3. Encodes method or judgment, not phrasing

Two hundred skills in a year means nobody can find anything and selection degrades for
everyone.

---

## Who reviews your PR

`.github/CODEOWNERS` routes review automatically. A change to `sdlc-qe-*` requires the QE
team. A change to `sdlc-copilot/context/` requires the context owner. You do not have to find the right
reviewer — GitHub does.

## What needs agreement

You own your namespace. These are shared surfaces:

- Changing a handoff contract between existing skills
- Editing `.github/copilot-instructions.md`
- Adding a new persona prefix — a new prefix means a new named owner
- Anything in `sdlc-copilot/context/`
- Pinning an exact model or changing model-routing policy

---

## If you are the first from your team

Good. Adoption grows through participation, not announcements.

Start with the thing your team already does repeatedly and does inconsistently. That is
usually where a skill pays for itself in the first week.
