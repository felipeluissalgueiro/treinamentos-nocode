# Templates reutilizáveis

Esqueletos pra começar projeto / issue / doc sem partir do zero. ✅ **Todos criados.**

## Arquivos

| Arquivo | Status | Pra quê |
|---|---|---|
| `CLAUDE.md` | ✅ | Esqueleto de contexto pra projeto novo (Claude Code) |
| `AGENTS.md` | ✅ | Stub que importa CLAUDE.md (OpenCode) |
| `PRD.md` | ✅ | Product Requirements Document (preencher na S2) |
| `.gitignore` | ✅ | Padrão Python + Node + secrets + IDEs + Claude/OpenCode |
| `.env.example` | ✅ | Modelo de env vars (LLMs, DB, deploy, integrações) |
| `opencode.json` | ✅ | Config OpenCode apontando pra CLAUDE.md + AGENTS.md |
| `issues/s1.md` | ✅ | Body da issue GitHub da S1 |
| `issues/s2.md` | ✅ | Body da issue GitHub da S2 |
| `issues/s3.md` | ✅ | Body da issue GitHub da S3 |
| `issues/s4.md` | ✅ | Body da issue GitHub da S4 |

## Como o aluno usa

No primeiro dia (S1), copia pro projeto-âncora:

```bash
cd <seu-projeto>
cp <kit>/templates/CLAUDE.md .
cp <kit>/templates/AGENTS.md .
cp <kit>/templates/.gitignore .
cp <kit>/templates/.env.example .
cp <kit>/templates/opencode.json .

# preenche os <...> em CLAUDE.md
# duplica .env.example -> .env e preenche com chaves reais
```

PRD entra mais tarde (S2):
```bash
cp <kit>/templates/PRD.md .
# preenche durante o bloco de Planejamento
```

## Issues do projeto âncora

Felipe cria as 4 issues GitHub do aluno via `gh issue create --body-file` no Provisionamento. Ver `PROVISIONAMENTO.md` §6.
