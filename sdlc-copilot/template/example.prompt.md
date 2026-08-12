---
agent: agent
# Model intentionally omitted: use Auto; the matching skill declares the model tier.
description: One line. This shows in the slash menu — make it scannable.
---

<!-- KEEP THIS UNDER 10 LINES.

     The prompt is a thin launcher. All method lives in the skill.
     If you are writing paragraphs here, you are in the wrong file.

     Why the split: the prompt layer is Copilot-specific and disposable. The skill
     layer is an open standard and portable. When the tool changes, only this file
     gets rewritten. -->

Do <the thing> using the `sdlc-persona-verb` skill.

Provide <the required input>. If it is missing or not in the expected state, stop and
say so rather than proceeding.
