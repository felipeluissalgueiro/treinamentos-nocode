# Curso Claude Code — 60 aulas (auto-estudo)

> Material adaptado do curso "Claude Code do zero ao deploy" criado pelo Felipe. **60 aulas, 12 módulos, ~4h36min.** Pra auto-estudo paralelo às sessões S1-S4. Você não precisa terminar antes da S1 — use sob demanda conforme o currículo.

---

## Como usar

- Cada aula tem **título · tempo estimado · 🏆 troféu** (critério de aceite)
- **Status do material:**
  - ✅ **completo** — script + comandos exatos, dá pra estudar sozinho
  - 📝 **outline-only** — só título + troféu, precisa do encontro ao vivo pra expandir (Felipe escreve sob demanda)
- Ritmo sugerido: 3-5 aulas por dia. Você não precisa terminar tudo — só o que está no mapa pra sua sessão atual.

---

## Mapa do curso × Sessões S1-S4

| Sessão | Módulos cobertos | Foco |
|---|---|---|
| **Antes da S1** | 0, 1 | Bem-vindo + instalação completa do ambiente |
| **S1** | 2 | Fundamentos (CLAUDE.md, terminal, Claude Code CLI) |
| **S2** | 3, 4 (parcial) | Planejamento (PRD, framework próprio) + Backend (FastAPI + LLM) |
| **S3** | 4 (resto), 5, 8 | Frontend + Skills + MCP + integrações |
| **S4** | 6, 7, 9, 10 | Code review + Deploy + Mundo real + Ferramentas |
| **Pós-treino** | 11 | Sprint final autônoma (3 dias do zero ao deploy) |

---

## Catálogo dos 12 módulos

| # | Módulo | Aulas | Tempo | Status |
|---|---|---|---|---|
| 0 | [Bem-vindo](modulo-00-bem-vindo.md) | 3 | ~10min | ✅ |
| 1 | [Mise en Place](modulo-01-mise-en-place.md) | 7 | ~28min | ✅ |
| 2 | [Fundamentos](modulo-02-fundamentos.md) | 8 | ~35min | ✅ |
| 3 | [Planejamento](modulo-03-planejamento.md) | 5 | ~25min | 📝 |
| 4 | [Backend (FastAPI + Python + LLM)](modulo-04-backend.md) | 8 | ~40min | 📝 |
| 5 | [Frontend (Next.js)](modulo-05-frontend.md) | 4 | ~18min | 📝 |
| 6 | [Code Review](modulo-06-code-review.md) | 4 | ~18min | 📝 |
| 7 | [Deploy (Vercel + Railway)](modulo-07-deploy.md) | 5 | ~22min | 📝 |
| 8 | [Prompts, Skills, MCP](modulo-08-prompts-skills-mcp.md) | 4 | ~20min | 📝 |
| 9 | [Mundo Real (debug + produto)](modulo-09-mundo-real.md) | 3 | ~15min | 📝 |
| 10 | [Ferramentas (Sentry, PostHog, Mixpanel)](modulo-10-ferramentas.md) | 4 | ~20min | 📝 |
| 11 | [Sprint Final](modulo-11-sprint-final.md) | 5 | ~25min | 📝 |

**Total:** 60 aulas · ~4h36min · 2 módulos com script completo · 10 com outline

---

## Princípios pedagógicos do curso (vale ler antes de começar)

Esses princípios moldam todas as aulas. Entender eles ajuda a aproveitar melhor:

1. **Aulas curtas (3-5 min máx).** Recompensa imediata > maratona longa.
2. **🏆 Troféu por aula.** Cada aula tem critério explícito de "feito". Sem isso, você não sabe se aprendeu.
3. **Demonstração > slide.** 80% das aulas são tela real do terminal/VS Code. 20% slide (só pra diagrama).
4. **Erro é conteúdo.** Quando algo quebra ao vivo, isso vira aprendizado. Você vai errar igual — é parte do processo.
5. **Você não vira dev. Você vira construtor.** Pré-requisito: saber usar PC. Saída: você constrói um produto real, do zero ao deploy.

---

## Sobre o projeto-âncora

O curso original usa **gerador de carrosséis Instagram** como projeto-âncora pra ensinar Backend (FastAPI + LLM) + Frontend (Next.js) + Deploy. No treinamento Cadência 30d, **seu projeto-âncora é diferente** — definido no seu Briefing. A estrutura técnica (API → LLM → output → UI → deploy) é a mesma; só muda o que entra e sai do pipeline.

Quando o curso citar "carrossel", traduza pro seu projeto:

| Curso (genérico) | Seu projeto (exemplo) |
|---|---|
| Input do usuário (tema do carrossel) | Input do seu cliente (lead, mensagem, processo, etc) |
| LLM gera conteúdo (texto AIDA) | LLM faz a tarefa do seu agente (resumir, responder, classificar) |
| Renderer (HTML → PNG) | Seu output (mensagem WhatsApp, doc, planilha, dashboard) |
| Deploy Vercel + Railway | Mesmo padrão pro seu produto |

---

## Origem

Material adaptado do curso autoral do Felipe (Notion), validado em campo. Versão genérica sem refs internas Cadência/PD. Para a versão original com script de gravação completo (incluindo Módulos 3-11 ainda a expandir), consultar Felipe.

---

## Material complementar fora do curso

| Material | Onde | Quando estudar |
|---|---|---|
| **Como Criar um Harness Claude Code** (aula 2h49min adaptada) | `aulas/criar-harness-claude-code.md` | Depois da S1, quando vocabulário básico já entrou. Aprofunda Módulo 2 + dá fundamento conceitual pra Módulo 8 (skills, MCP) |
| **System Design pra Vibe Coder e Dev** | `biblioteca/estudos/system-design-vibe-coder.md` (a portar) | Antes do Módulo 3 — desenho do sistema |
| **Padrão Claude Code + OpenCode agnóstico** | `kit-template/AGNOSTICIDADE.md` | Junto com Módulo 1 e 2 |
