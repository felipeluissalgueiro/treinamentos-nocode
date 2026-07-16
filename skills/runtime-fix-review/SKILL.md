---
name: runtime-fix-review
description: Strict read-only verification workflow for claimed code fixes in any repository. Use when a user provides changed files or commits and asks to confirm each fix is structurally correct, reachable at runtime, and regression-safe, with required command execution and a report file containing per-fix PASS/FAIL/WARN verdicts and RUN lines.
---

# Runtime Fix Review

## Workflow

1. Lock read-only mode.
- Never edit source files.
- Only create or update the requested report output file.
- Never install dependencies unless the user explicitly asks.
- If a command fails, record the failure and continue with remaining checks.

2. Gather review scope.
- Capture target files, claimed fixes, required runtime commands, and report path.
- If a mandatory input is missing, ask one direct question, then proceed.

3. Inspect code fully.
- Read each target file completely.
- Re-open critical blocks with line numbers for evidence.
- Verify each claim against actual code structure, ordering, and runtime reachability.

4. Execute runtime checks.
- Use commands from `references/runtime-check-matrix.md`.
- Record exact command, pass/fail state, and key error text when relevant.
- Run compiled-module imports when requested to catch runtime import errors.

5. Classify outcomes.
- `PASS`: claim is correct and runtime checks passed.
- `FAIL`: claim is incorrect, unreachable, broken at runtime, or violates required security order.
- `WARN`: non-blocking risk, dead code, or environment-limited check allowed by user rules.

6. Write report.
- Follow `references/report-template.md`.
- Include verdict, evidence, and `RUN` lines for each fix.
- Add "Additional Issues" only for correctness or safety findings.
- End with recommendations grouped by `P1`, `P2`, `P3`.

## Evidence Rules

- Use precise file paths and 1-based line numbers.
- Prefer control-flow evidence over style commentary.
- Keep snippets short and only when necessary.
- Do not suggest refactors unless the user asked for improvements.

## Command Rules

- Run only commands relevant to verification.
- If sandbox blocks a required command, request escalation and rerun.
- Do not install dependencies as part of review unless explicitly requested.
- Preserve exact error wording for failed commands in the report.

## Resources

- Runtime command playbook: `references/runtime-check-matrix.md`
- Report template: `references/report-template.md`
