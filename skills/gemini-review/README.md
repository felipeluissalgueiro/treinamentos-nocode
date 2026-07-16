# /gemini-review — Code Review com Google Gemini

Review automatizado de commits usando o Gemini CLI do Google como reviewer, com classificação estruturada pelo Claude.

## O que faz

1. Coleta os commits alvo (diff + arquivos modificados)
2. Detecta a stack do projeto automaticamente
3. Envia pro Gemini CLI (modelo gemini-2.5-flash) em modo headless
4. Claude processa o output e classifica cada achado em:
   - **Prioridade**: P1 (crítico), P2 (importante), P3 (sugestão)
   - **Categoria**: LÓGICA, SINTAXE, ESTILO, SEGURANÇA, PERFORMANCE, DEAD_CODE
5. Gera relatório em `docs/gemini-reviews/` do projeto
6. Oferece corrigir P1s automaticamente

## Como usar

```
/gemini-review              # últimos 3 commits
/gemini-review 5            # últimos 5 commits
/gemini-review abc1234      # commit específico
/gemini-review abc..def     # range de commits
```

## Pré-requisitos

| Requisito | Comando |
|-----------|---------|
| Gemini CLI | `npm install -g @google/gemini-cli` |
| Auth | OAuth pessoal (rodar `gemini` na primeira vez) |
| Git repo | Estar dentro de um repositório git |

Se o Gemini não estiver instalado, a skill oferece duas opções:
- Instalar automaticamente
- Fazer o review pelo próprio Claude (mesmo formato P1/P2/P3)

## Output

Relatório salvo em `docs/gemini-reviews/gemini-review-DD-MM-YYYY.md` com:

- Resumo (branch, commits, modelo, contagem P1/P2/P3)
- P1s com arquivo, linha, problema, impacto e fix sugerido
- P2s com arquivo, problema e fix
- P3s com observações
- Output bruto do Gemini (colapsável)

## Custo

$0 — usa autenticação OAuth pessoal com a conta Google.

## Uso combinado com /codex-review

Para review máximo, usar ambas as skills em sequência:
1. `/codex-review` — GPT-5.4 (OpenAI)
2. `/gemini-review` — Gemini 2.5 Flash (Google)
3. Claude consolida achados dos dois modelos

Modelos diferentes de empresas diferentes = blind spots diferentes = cobertura máxima.
