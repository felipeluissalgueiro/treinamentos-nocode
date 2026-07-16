# /claude-review — Code Review com Claude Opus 4.7

Review automatizado de commits usando uma instância separada do Claude Code CLI com Opus 4.7 em modo headless, com classificação estruturada.

## O que faz

1. Coleta os commits alvo (diff + arquivos modificados)
2. Detecta a stack do projeto automaticamente
3. Envia pro Claude Code CLI (`claude -p --model opus --max-turns 1`)
4. Instância atual processa o output e classifica cada achado em:
   - **Prioridade**: P1 (crítico), P2 (importante), P3 (sugestão)
   - **Categoria**: LÓGICA, SINTAXE, ESTILO, SEGURANÇA, PERFORMANCE, DEAD_CODE
5. Gera relatório em `docs/claude-reviews/` do projeto
6. Oferece corrigir P1s automaticamente

## Como usar

```
/claude-review              # últimos 3 commits
/claude-review 5            # últimos 5 commits
/claude-review abc1234      # commit específico
/claude-review abc..def     # range de commits
```

## Pré-requisitos

| Requisito | Comando |
|-----------|---------|
| Claude Code CLI | `npm install -g @anthropic-ai/claude-code` |
| Auth | Login ativo (`claude`) |
| Git repo | Estar dentro de um repositório git |

## Autenticação e custo

Usa o login ativo do Claude Code CLI (assinatura do Felipe), NÃO API key avulsa.
Custo efetivo: $0 adicional — incluso na assinatura. Consome tokens do plano.

## Pipeline triplo de review

Para cobertura máxima, usar as 3 skills em sequência:
1. `/gemini-review` — Gemini 3.1 Pro (Google) — $0
2. `/codex-review` — GPT-5.4 (OpenAI) — ~$0.40
3. `/claude-review` — Opus 4.7 (Anthropic) — $0 (assinatura)
4. Instância atual consolida achados dos 3 modelos

Custo total: ~$1.40 por review. Três empresas, três blind spots diferentes.
