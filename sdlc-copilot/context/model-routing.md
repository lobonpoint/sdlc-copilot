<!-- v0.1.0 · created 2026-08-12 · updated 2026-08-12 · owner TBD -->

# Model routing

Use the least costly model tier that reliably completes the work. **Copilot Auto is the
default**, so prompt files intentionally do not pin an exact model.

| Tier | Use for | Routing guidance |
|---|---|---|
| `efficient` | Extraction, classification, formatting, and routine evidence summaries | Use Auto or an approved lightweight model. Escalate when ambiguity or risk is material. |
| `balanced` | Most workflow, planning, implementation, and review tasks | Use Auto unless a tested project need supports a pinned model. |
| `deep-reasoning` | Competing designs, cross-system ambiguity, and high-consequence tradeoffs | Use Auto or an approved reasoning model validated on representative work. |

## Rules

- Declare the tier in skill metadata; do not hardcode model names in skills.
- Pin an exact model only after a representative evaluation shows a meaningful quality
  benefit. Document the exception in the prompt and review it when models or pricing change.
- Record the tier and actual model used in the human control record.
- If a preferred model is unavailable, use Auto or an approved fallback. Never bypass
  organizational policy to reach a model.
- Compare human correction, missed requirements, latency, retries, and cost. Token count
  alone is not a quality measure.

**Owner:** TBD  
**Review cadence:** quarterly and when the approved model catalog or pricing changes  
**Next review:** TBD

## Reference

- GitHub Copilot Auto model selection:
  `https://docs.github.com/en/copilot/concepts/models/auto-model-selection`
- GitHub Copilot usage optimization:
  `https://docs.github.com/en/copilot/tutorials/optimize-ai-usage`
- VS Code prompt files:
  `https://code.visualstudio.com/docs/copilot/customization/prompt-files`
