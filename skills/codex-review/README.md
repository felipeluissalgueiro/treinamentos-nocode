# /codex-review — Code Review com OpenAI Codex

Review automatizado de commits usando o Codex CLI da OpenAI como reviewer, com classificacao estruturada pelo Claude.

## O que faz

1. Coleta os commits alvo (diff + arquivos modificados)
2. Detecta a stack do projeto automaticamente
3. Envia pro Codex CLI revisar
4. Claude processa o output e classifica cada achado em:
   - **Prioridade**: P1 (critico), P2 (importante), P3 (sugestao)
   - **Categoria**: LOGICA, SINTAXE, ESTILO, SEGURANCA, PERFORMANCE, DEAD_CODE
5. Gera relatorio em `docs/codex-reviews/` do projeto
6. Oferece corrigir P1s automaticamente

## Como usar

```
/codex-review              # ultimos 3 commits
/codex-review 5            # ultimos 5 commits
/codex-review abc1234      # commit especifico
/codex-review abc..def     # range de commits
```

## Pre-requisitos

| Requisito | Comando |
|-----------|---------|
| Codex CLI | `npm install -g @openai/codex` |
| API key | `export OPENAI_API_KEY=sk-...` (ou .env) |
| Git repo | Estar dentro de um repositorio git |

Se o Codex nao estiver instalado, a skill oferece duas opcoes:
- Instalar automaticamente
- Fazer o review pelo proprio Claude (mesmo formato P1/P2/P3)

## Output

Relatorio salvo em `docs/codex-reviews/codex-review-DD-MM-YYYY.md` com:

- Resumo (branch, commits, contagem P1/P2/P3)
- P1s com arquivo, linha, problema, impacto e fix sugerido
- P2s com arquivo, problema e fix
- P3s com observacoes
- Output bruto do Codex (colapsavel)

## Categorias de review

| Categoria | O que verifica |
|-----------|---------------|
| SEGURANCA | auth bypass, injection, XSS, CSRF, RLS |
| LOGICA | fluxos quebrados, edge cases, null checks |
| SINTAXE | TypeScript errors, imports errados, tipos |
| ESTILO | naming, formatacao, patterns inconsistentes |
| PERFORMANCE | queries N+1, renders, bundles |
| DEAD_CODE | imports, variaveis, funcoes nao usadas |

## Prioridades

| Nivel | Criterio | Acao |
|-------|----------|------|
| P1 | Quebra producao, vulnerabilidade, perda de dados | Corrigir ANTES de deploy |
| P2 | Dead code, error handling ausente, tipagem errada | Corrigir nesta sessao |
| P3 | Estilo, refatoracao opcional, performance menor | Backlog |

## Funciona em qualquer projeto

- Detecta stack automaticamente (package.json, requirements.txt, go.mod, etc.)
- Salva relatorio relativo ao projeto atual
- Nenhuma dependencia de projeto especifico
