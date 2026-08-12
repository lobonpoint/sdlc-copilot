#!/usr/bin/env bash
# validate-skills.sh — catches the failures that are otherwise SILENT.
#
# The Agent Skills spec has rules that fail without any error message. A skill
# whose folder name does not match its `name` field simply never loads, and
# nothing tells you why. This script turns those into a failed check.
#
# Run locally:  ./sdlc-copilot/scripts/validate-skills.sh
# Runs in CI:   .github/workflows/validate.yml
#
# v0.2.0 · created 2026-08-06 · updated 2026-08-12 · owner TBD

set -uo pipefail
cd "$(dirname "$0")/../.." || exit 1

FAIL=0
pass() { printf '  \033[32mPASS\033[0m  %s\n' "$1"; }
fail() { printf '  \033[31mFAIL\033[0m  %s\n' "$1"; FAIL=1; }

echo
echo "Validating skills against the Agent Skills specification"
echo "======================================================="

# ---- 1. name must match folder exactly (SILENT failure if not) ----
echo
echo "1. Folder name matches 'name' field"
for d in .github/skills/*/; do
  [ -d "$d" ] || continue
  folder=$(basename "$d")
  if [ ! -f "$d/SKILL.md" ]; then fail "$folder — no SKILL.md"; continue; fi
  name=$(awk '/^name:/{print $2; exit}' "$d/SKILL.md")
  if [ "$folder" = "$name" ]; then pass "$folder"; else
    fail "$folder — name field says '$name'. Skill will not load."
  fi
done

# ---- 2. name format: lowercase, hyphens, <=64 chars ----
echo
echo "2. Name format (lowercase, hyphens, no consecutive/leading/trailing)"
for d in .github/skills/*/; do
  [ -f "$d/SKILL.md" ] || continue
  name=$(awk '/^name:/{print $2; exit}' "$d/SKILL.md")
  if [[ "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] && [ ${#name} -le 64 ]; then
    pass "$name"
  else
    fail "$name — must be lowercase alphanumeric with single hyphens, max 64 chars"
  fi
done

# ---- 3. description present and under 1024 chars ----
echo
echo "3. Description present, under 1024 chars"
for d in .github/skills/*/; do
  [ -f "$d/SKILL.md" ] || continue
  name=$(awk '/^name:/{print $2; exit}' "$d/SKILL.md")
  desc=$(awk '/^description:/{f=1;next} /^[a-z-]+:/{f=0} f' "$d/SKILL.md" | tr -d '\n' | xargs)
  len=${#desc}
  if [ "$len" -eq 0 ]; then fail "$name — description missing"
  elif [ "$len" -gt 1024 ]; then fail "$name — description $len chars, max 1024"
  else pass "$name ($len chars)"; fi
done

# ---- 4. body under 500 lines (token budget) ----
echo
echo "4. Body under 500 lines"
for d in .github/skills/*/; do
  [ -f "$d/SKILL.md" ] || continue
  name=$(awk '/^name:/{print $2; exit}' "$d/SKILL.md")
  body=$(awk 'BEGIN{c=0} /^---$/{c++; next} c>=2' "$d/SKILL.md" | wc -l | tr -d ' ')
  if [ "$body" -lt 500 ]; then pass "$name ($body lines)"; else
    fail "$name — $body lines. Move detail into references/."
  fi
done

# ---- 5. no angle brackets in frontmatter (prompt injection risk) ----
echo
echo "5. No angle brackets in frontmatter"
for d in .github/skills/*/; do
  [ -f "$d/SKILL.md" ] || continue
  name=$(awk '/^name:/{print $2; exit}' "$d/SKILL.md")
  if awk 'BEGIN{c=0} /^---$/{c++; next} c==1' "$d/SKILL.md" | grep -qE '<[a-zA-Z/]'; then
    fail "$name — angle brackets in frontmatter can inject into the system prompt"
  else pass "$name"; fi
done

# ---- 6. Prohibited section present ----
echo
echo "6. '## Prohibited' section present"
for d in .github/skills/*/; do
  [ -f "$d/SKILL.md" ] || continue
  name=$(awk '/^name:/{print $2; exit}' "$d/SKILL.md")
  if grep -q '^## Prohibited' "$d/SKILL.md"; then pass "$name"; else
    fail "$name — a skill that cannot say what it must not do has not been thought through"
  fi
done

# ---- 7. every skill has a prompt, every prompt has a skill ----
echo
echo "7. Prompt and skill pairing"
for d in .github/skills/*/; do
  [ -d "$d" ] || continue
  n=$(basename "$d")
  if [ -f ".github/prompts/$n.prompt.md" ]; then pass "$n has a prompt"; else
    fail "$n — no matching prompt file, so no slash command"; fi
done
for p in .github/prompts/*.prompt.md; do
  [ -f "$p" ] || continue
  n=$(basename "$p" .prompt.md)
  if [ -d ".github/skills/$n" ]; then pass "$n prompt has a skill"; else
    fail "$n.prompt.md — references a skill that does not exist"; fi
done

# ---- 8. registered in the skill registry ----
echo
echo "8. Registered in sdlc-copilot/SKILLS.md (collision check)"
for d in .github/skills/*/; do
  [ -d "$d" ] || continue
  n=$(basename "$d")
  if grep -q "$n" sdlc-copilot/SKILLS.md; then pass "$n"; else
    fail "$n — not in sdlc-copilot/SKILLS.md. Review descriptions for collision."; fi
done

# ---- 9. referenced files exist ----
echo
echo "9. Referenced files exist"
for d in .github/skills/*/; do
  [ -f "$d/SKILL.md" ] || continue
  n=$(basename "$d")
  while read -r ref; do
    [ -n "$ref" ] || continue
    if [ -f "$d/$ref" ]; then pass "$n -> $ref"; else fail "$n -> $ref MISSING"; fi
  done < <(grep -oE '`(references|assets|scripts)/[A-Za-z0-9._-]+`' "$d/SKILL.md" 2>/dev/null \
    | tr -d '`' | sort -u)

  context_list=$(awk '/^  reads_context:/{sub(/^  reads_context:[[:space:]]*/, ""); print; exit}' "$d/SKILL.md")
  IFS=',' read -ra context_files <<< "$context_list"
  for ref in "${context_files[@]}"; do
    ref=$(printf '%s' "$ref" | xargs)
    [ -z "$ref" ] && continue
    if [ -f "sdlc-copilot/context/$ref" ]; then pass "$n -> sdlc-copilot/context/$ref"; else
      fail "$n -> sdlc-copilot/context/$ref MISSING"
    fi
  done
done

# ---- 10. copilot-instructions.md line cap ----
echo
echo "10. copilot-instructions.md under 50 lines (metered every turn)"
lines=$(wc -l < .github/copilot-instructions.md | tr -d ' ')
if [ "$lines" -le 50 ]; then pass "$lines lines"; else
  fail "$lines lines — every line is a recurring cost for every user, every turn"; fi

# ---- 11. repository terminology and paths stay current ----
echo
echo "11. No deprecated names, paths, or rollout terminology"
deprecated='sdlc-po-breakout|samples/|Salesforce craft|status:[[:space:]]*pilot|@coe-|/Users/|file://'
if grep -REn --include='*.md' --include='*.html' --include='*.yml' --include='*.sh' \
  --include='CODEOWNERS' --exclude='validate-skills.sh' "$deprecated" \
  .github sdlc-copilot .gitignore >/dev/null; then
  fail "deprecated text found; search for: $deprecated"
else
  pass "terminology and paths are current"
fi

# ---- 12. intended top-level layout ----
echo
echo "12. Merge-friendly top-level layout"
for d in .github sdlc-copilot; do
  if [ -d "$d" ]; then pass "$d exists"; else fail "$d MISSING"; fi
done
if [ -d sdlc-copilot/projects ]; then pass "sdlc-copilot/projects exists"; else
  fail "sdlc-copilot/projects MISSING"
fi

# ---- 13. delivery-spine handoff contracts ----
echo
echo "13. Delivery-spine step and handoff contracts"
while IFS='|' read -r skill step input output; do
  file=".github/skills/$skill/SKILL.md"
  actual_step=$(awk '/^  sdlc_step:/{gsub(/"/, ""); print $2; exit}' "$file")
  actual_input=$(awk '/^  input_from:/{sub(/^  input_from:[[:space:]]*/, ""); print; exit}' "$file")
  actual_output=$(awk '/^  output_to:/{sub(/^  output_to:[[:space:]]*/, ""); print; exit}' "$file")
  if [ "$actual_step" = "$step" ] && [ "$actual_input" = "$input" ] && \
     [ "$actual_output" = "$output" ]; then
    pass "$step $skill"
  else
    fail "$skill — expected step '$step', input '$input', output '$output'; got '$actual_step', '$actual_input', '$actual_output'"
  fi
done <<'SPINE'
sdlc-po-intake|01|business request|sdlc-arch-assess
sdlc-arch-assess|02|sdlc-po-intake|sdlc-arch-reconcile
sdlc-arch-reconcile|03|sdlc-arch-assess|sdlc-po-stories
sdlc-po-stories|04|sdlc-arch-reconcile|sdlc-dev-breakout
sdlc-dev-breakout|05|sdlc-po-stories|sdlc-dev-scaffold, sdlc-qe-automate
sdlc-dev-scaffold|06|sdlc-dev-breakout|sdlc-ops-promote
sdlc-qe-automate|07|sdlc-dev-breakout|sdlc-qe-execute
sdlc-ops-promote|08|sdlc-dev-scaffold|sdlc-qe-execute
sdlc-qe-execute|09|sdlc-qe-automate, sdlc-ops-promote|sdlc-po-uat
sdlc-po-uat|10|sdlc-qe-execute|sdlc-ops-release
sdlc-ops-release|11|sdlc-po-uat|Production Support receives
SPINE

# ---- 14. human-control and model-tier contracts ----
echo
echo "14. Human-control and model-tier contracts"
for d in .github/skills/*/; do
  [ -f "$d/SKILL.md" ] || continue
  n=$(basename "$d")
  missing=""
  for field in accountable_role verifier_role human_gate verification_evidence model_tier; do
    if ! grep -q "^  $field:[[:space:]]*[^[:space:]]" "$d/SKILL.md"; then
      missing="$missing $field"
    fi
  done
  tier=$(awk '/^  model_tier:/{print $2; exit}' "$d/SKILL.md")
  if [ -n "$missing" ]; then
    fail "$n — missing metadata:$missing"
  elif [[ ! "$tier" =~ ^(efficient|balanced|deep-reasoning)$ ]]; then
    fail "$n — invalid model_tier '$tier'"
  elif ! grep -q '^## Human control record' "$d/SKILL.md"; then
    fail "$n — missing Human control record section"
  elif ! grep -q 'AI must leave the gate `Pending`' "$d/SKILL.md"; then
    fail "$n — human gate must remain Pending until a verifier decides"
  else
    pass "$n"
  fi
done

# ---- 15. prompt routing stays current and model-agnostic ----
echo
echo "15. Prompt routing uses Auto and current frontmatter"
for p in .github/prompts/*.prompt.md; do
  [ -f "$p" ] || continue
  n=$(basename "$p")
  if ! grep -q '^agent: agent$' "$p"; then
    fail "$n — missing 'agent: agent'"
  elif grep -qE '^(mode|model):' "$p"; then
    fail "$n — remove legacy mode or pinned model; Auto is the default"
  else
    pass "$n"
  fi
done
if [ -f sdlc-copilot/context/model-routing.md ]; then
  pass "sdlc-copilot/context/model-routing.md exists"
else
  fail "sdlc-copilot/context/model-routing.md MISSING"
fi

echo
echo "======================================================="
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed."
else
  echo "FAILURES FOUND — see above."
fi
exit $FAIL
