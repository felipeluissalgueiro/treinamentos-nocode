# Report Template

Use this structure for final review files.

## Header
- Project name
- Date
- Review mode: read-only
- Files reviewed

## Per-fix sections
For each requested fix:

- `FIX <n> - <short title>`
- `VERDICT: PASS | FAIL | WARN`
- `Evidence:`
- `RUN:`
  - `RUN: [command executed] - [PASS | FAIL | WARN: reason]`

## Additional Issues
- Only include correctness, security, runtime, or reachability findings not in requested fixes.

## Recommendations
Group strictly by severity:

- `P1`
- `P2`
- `P3`

Rules:
- Keep recommendations actionable and specific.
- Do not include style-only suggestions in this section.
