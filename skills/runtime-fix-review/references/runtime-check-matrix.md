# Runtime Check Matrix

Use this matrix when the user asks for runtime verification during review.

## Next.js / React / TypeScript

1. Production build
- Command: `npm run build`
- PASS: build exits 0 and completes.
- FAIL: TypeScript/build errors.
- WARN: lint or framework warnings without build failure.

2. Compiled module import checks
- Find compiled paths in `.next/server`.
- Example command:
  - `node -e "require('./.next/server/app/path/to/page.js'); console.log('ok')"`
- PASS: import command exits 0.
- FAIL: runtime import crash.

## Python modules

1. Syntax compile
- Command: `python -m py_compile <module.py>`
- PASS: exit 0.
- FAIL: syntax or compile error.

2. AST parse
- Command: `python -c "import ast; ast.parse(open('<module.py>', encoding='utf-8').read()); print('AST OK')"`
- PASS: prints `AST OK`.
- FAIL: parse error.

3. Import smoke test
- Command: `python -c "from <package.module> import <symbol>; print('import OK')"`
- PASS: prints `import OK`.
- WARN: missing third-party package only when user says this is acceptable.
- FAIL: project import error, SyntaxError, NameError, or unexpected ImportError.

## Generic guidance

- Always capture the exact command string in report `RUN` lines.
- Include key error text for each FAIL or WARN.
- Continue with other checks even if one command fails.
- Never auto-fix failing checks in read-only review mode.
