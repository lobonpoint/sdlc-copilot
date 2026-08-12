<!--
  well-architected-reference.md
  Source: Salesforce Well-Architected Framework — architect.salesforce.com/well-architected
  Status: INDUSTRY GUIDANCE. Ranks below org guardrails in the authority hierarchy.
  Version: 0.1.0  Created: 2026-08-05  Updated: 2026-08-05  Owner: TBD
-->

# Salesforce Well-Architected — assessment reference

Salesforce's Well-Architected Framework is a **decision-making framework**, not a
checklist. Its purpose is to surface the right questions early, before complexity and
technical debt accumulate.

Three pillars, three sub-qualities each.

**Priority order when they conflict: Trusted → Easy → Adaptable.**
A solution that is elegant and adaptable but not secure is not well-architected.

---

## Trusted — protects the business, its users, and its data

### Secure
Only the right users and systems have access; data is protected from exposure and
misuse.

Ask: Who can see this data, and who decided that? Is sharing declared explicitly? Are
CRUD and FLS enforced in code paths, not just in the UI? Where do credentials live?

### Compliant
Meets legal, regulatory, ethical, and accessibility standards.

Ask: What data classification applies? What retention rule? Is there an audit trail of
who changed what? Compliance is a shared responsibility — name the legal, security, or
compliance partner rather than asserting compliance unilaterally.

### Reliable
Available, performant, and resilient as demand and conditions change.

Ask: What happens at 10x volume? What are the governor limit implications? What is the
failure mode, and who finds out when it fails? Reliability matters most where Salesforce
is a system of record for a core business process.

---

## Easy — delivers value fast and stays understandable

### Intentional
Planned and delivered strategically; maintainable; readable by humans.

Ask: Can a new team member figure out what this does, where to change it, and whether
it is healthy — without asking three people? Does it follow existing patterns in this
org, or invent a new one? If it invents one, why?

### Automated
Reduces manual effort and enforces consistency.

Ask: Is this the *appropriate* amount of automation, or the maximum? Where does error
handling live — is it built once and reused, or rebuilt in every automation? Does a
failed automation leave data in a consistent state?

**The goal is appropriate automation, not maximum automation.**

### Engaging
Respects users' time and attention; drives adoption.

Ask: How many clicks? Does this add a field to a page nobody reads? Will users route
around it?

---

## Adaptable — evolves without breaking

### Composable
Assembled from small, independent, interchangeable parts.

Ask: Can this be changed without touching three other things? Are the parts separately
testable? Could a piece be swapped without a rewrite?

### Resilient
Withstands disruption (toughness) and returns to normal afterward (elasticity).

Ask: What is monitored, and who is alerted? How is an incident triaged? Resilience is
as much about process and ownership as technology — name the owner.

### Evolving
Can absorb change in the business without accumulating debt.

Ask: What happens when this requirement changes in a year? What did we hardcode that
we will regret?

---

## Anti-patterns to check against

Anti-patterns are practices that add complexity, reduce automation, harm the user
experience, reduce resilience, limit composability, or make change harder. Check the
proposed design against these common ones:

| Anti-pattern | What it looks like | Why it hurts |
|---|---|---|
| **Automation bonanza** | Multiple automation tools on the same object — Flow, trigger, and process all firing | Unpredictable order of execution; nobody can trace behavior |
| **Hero dependency** | Only one person understands how it works | Knowledge leaves when they do |
| **Reinvented error handling** | Every automation builds its own error path | Inconsistent recovery; an optimization anti-pattern |
| **Hardcoded identifiers** | Record Type IDs, User IDs, profile names embedded in logic | Breaks on deploy across environments |
| **Precedent by existence** | "We already do it this way here" used as approval | Existing implementation is not an approved pattern |
| **Undeclared sharing** | Security assumed from UI rather than enforced in code | Data exposure that no one wrote as a bug |
| **Scope by accretion** | Requirements arriving after sign-off, absorbed silently | Estimate is now wrong and nobody knows |

Salesforce maintains a Pattern and Anti-Pattern Explorer with more. When the reuse
register clears review, link it here.

---

## How to record this in an assessment

For each pillar, one short paragraph:

- **What the design does well** — be specific, not congratulatory
- **What it risks** — the honest version
- **Anti-pattern exposure** — named, or "none identified"

Then, if two pillars conflict, say which one you prioritized and why. Applying
Trusted → Easy → Adaptable silently is not the same as applying it visibly.
