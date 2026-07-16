# Recursos de Referência

Materiais de apoio para usar antes, durante e depois das lives.

---

## Setup

**Pasta:** `setup/`

| Arquivo | O que é |
|---------|---------|
| `INSTALACAO.md` | Passo a passo para instalar Claude Code, OpenCode, Node, Python e Git |
| `FAQ.md` | 21 perguntas que todo aluno faz no início — leia antes de começar |
| `AGNOSTICIDADE.md` | Como o mesmo CLAUDE.md funciona no Claude Code, OpenCode e outros runtimes |
| `opencode.json` | Configuração padrão para o OpenCode |

---

## Templates de Projeto

**Pasta:** `templates/`

Arquivos prontos para copiar quando criar um projeto novo:

| Arquivo | O que é |
|---------|---------|
| `CLAUDE.md` | Template de contexto para Claude Code — adapte para o seu projeto |
| `AGENTS.md` | Stub para OpenCode — importa o CLAUDE.md automaticamente |
| `PRD.md` | Product Requirements Document — especifique o que vai construir antes de codar |
| `.gitignore` | Padrão Python + Node + secrets |
| `.env.example` | Variáveis de ambiente — nunca commite o `.env` real |
| `opencode.json` | Config OpenCode pronta |

### Como usar com IA

```
Leia o arquivo PRD.md e me entreviste para montar meu PRD.
Faça uma pergunta por vez.
```

---

## Curso Auto-Estudo (60 aulas)

**Pasta:** `curso/`

Curso completo de Claude Code organizado em 12 módulos (~4h36min).

| Módulo | Título | Status |
|--------|--------|--------|
| 00 | Bem-vindo | ✅ completo |
| 01 | Mise en Place (setup da bancada) | ✅ completo |
| 02 | Fundamentos (ler código, terminal, CLAUDE.md) | ✅ completo |
| 03 | Planejamento (PRD, stories, blueprint) | 📝 outline |
| 04 | Backend (FastAPI, Docker, LLM, Supabase) | 📝 outline |
| 05 | Frontend (formulário, proxy, preview) | 📝 outline |
| 06 | Code Review (por que IA quebra, review adversarial) | 📝 outline |
| 07 | Deploy (Git, Vercel, Railway, E2E) | 📝 outline |
| 08 | Prompts, Skills e MCP | 📝 outline |
| 09 | O Mundo Real (debugging, quando não construir) | 📝 outline |
| 10 | Ferramentas (Sentry, PostHog, Cron) | 📝 outline |
| 11 | Sprint Final (reconstruir do zero) | 📝 outline |

Também inclui: `criar-harness-claude-code.md` — aula consolidada de 2h49min sobre harness.

### Como usar com IA

```
Leia o módulo [N] do curso em curso/modulo-0N-*.md.
Me explique cada aula em 3 linhas e me diga qual devo fazer primeiro
dado que estou neste estágio: [descreva onde você está].
```

---

## Guias Técnicos

**Pasta:** `guias/`

| Guia | O que explica |
|------|--------------|
| `system-design-vibe-coder.md` | Por que system design importa — Client, DNS, CDN, Cache, DB, Queue |
| (ver README.md dos guias) | Harness vs modelo, MCP Desktop vs Code, branches, n8n→código, agnosticidade |

---

## Glossário Dev & Design

**Arquivo:** `glossario-dev-design.md`

~930 termos técnicos em 9 domínios — de fundamentos e Python até design UI e IA/LLMs.

### Como usar com IA

```
Estou aprendendo [conceito]. Usando o glossário abaixo,
me explique em 2-3 linhas com um exemplo prático de quem
está construindo produto com IA.

[cole a seção relevante]
```
