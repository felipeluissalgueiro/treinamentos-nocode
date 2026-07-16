---
name: claude-review
description: >
  Roda code review via Claude Code CLI (Anthropic) com Opus 4.7 na branch atual, processa o output
  e classifica achados em P1/P2/P3 por categoria (lógica, sintaxe, estilo, segurança).
  Ativar quando Felipe disser "/claude-review", "roda claude review", "review com claude",
  "review com opus", "pede pro opus revisar", "claude review nos últimos commits".
---

# /claude-review — Code Review via Claude Code CLI (Opus 4.7) + Classificação Estruturada

Executa uma instância separada do Claude Code CLI com Opus 4.7 em modo headless (-p) para revisar os commits recentes da branch atual, depois processa e classifica o output em categorias e prioridades.

## Comandos

- `/claude-review` — revisa os últimos 3 commits da branch atual
- `/claude-review 5` — revisa os últimos N commits
- `/claude-review abc1234` — revisa um commit específico
- `/claude-review abc1234..def5678` — revisa range de commits

## Pré-requisitos

1. **Claude Code CLI instalado**: `npm install -g @anthropic-ai/claude-code`
2. **Autenticado**: login ativo no Claude Code
3. Estar dentro de um repositório git

## Fluxo

```
Felipe invoca /claude-review [args]
    |
    v
1. Verificar Claude Code CLI disponível
   - Rodar: claude --version
   - Se falhar: avisar Felipe e abortar
    |
    v
2. Coletar diff dos commits alvo
   - git diff HEAD~N..HEAD (para N commits)
   - git show <SHA> (para commit específico)
   - git diff <SHA1>..<SHA2> (para range)
   - Incluir: git log --oneline para os commits no range
   - Incluir: lista de arquivos modificados
    |
    v
3. Montar prompt de review e enviar ao Claude Code CLI
   - Modo headless: claude -p "<prompt>" --model opus
   - Diff passado inline no prompt ou via pipe
    |
    v
4. Capturar output completo do Opus 4.7
    |
    v
5. Processar output (instância atual do Claude)
   - Parsear todos os achados
   - Classificar cada achado em:
     * Prioridade: P1 (crítico), P2 (importante), P3 (sugestão)
     * Categoria: LÓGICA | SINTAXE | ESTILO | SEGURANÇA | PERFORMANCE | DEAD_CODE
   - Agrupar por prioridade, depois por categoria
   - Deduplicar se houver sobreposição com reviews anteriores (/codex-review, /gemini-review)
    |
    v
6. Gerar relatório estruturado
   - Salvar em: docs/claude-reviews/claude-review-DD-MM-YYYY.md (relativo ao projeto atual)
   - Criar pasta docs/claude-reviews/ se não existir
   - Exibir resumo pro Felipe
    |
    v
7. Perguntar se quer corrigir os P1s automaticamente
```

## Passo 1 — Verificar Claude Code CLI

```bash
# Verificar se está instalado
claude --version

# Se falhar:
# "Claude Code CLI não encontrado. Instale com: npm install -g @anthropic-ai/claude-code"
```

## Passo 2 — Coletar diff

### Mapeamento de argumentos do usuário → comando git

| Argumento do usuário | Comando git |
|---------------------|-------------|
| `/claude-review` (sem args) | `git diff HEAD~3..HEAD` + `git log --oneline HEAD~3..HEAD` |
| `/claude-review 5` | `git diff HEAD~5..HEAD` + `git log --oneline HEAD~5..HEAD` |
| `/claude-review abc1234` | `git show abc1234` |
| `/claude-review abc1234..def5678` | `git diff abc1234..def5678` + `git log --oneline abc1234..def5678` |

### Detectar stack do projeto

Antes de montar o prompt, detectar a stack verificando arquivos na raiz:

| Arquivo | Stack |
|---------|-------|
| `package.json` | Node.js / TypeScript / React |
| `requirements.txt` / `pyproject.toml` | Python |
| `go.mod` | Go |
| `Cargo.toml` | Rust |
| `composer.json` | PHP |
| Múltiplos | Listar todos no prompt |

## Passo 3 — Enviar pro Claude Code CLI

### Comando base

```bash
# Opção 1: Diff via pipe (preferida para diffs grandes)
git diff HEAD~3..HEAD | claude -p "$(cat <<'PROMPT'
Você é um code reviewer sênior especializado em [STACK_DETECTADA].

Revise o diff abaixo (recebido via stdin) com foco em:
1. SEGURANÇA: auth bypass, injection, XSS, CSRF, RLS, exposure de dados
2. LÓGICA: fluxos quebrados, edge cases, null checks, race conditions
3. SINTAXE: erros de tipo, imports errados, tipagem incorreta
4. PERFORMANCE: queries N+1, renders desnecessários, bundles grandes
5. DEAD_CODE: imports, variáveis, funções não usadas
6. ESTILO: naming inconsistente, patterns quebrados

Para cada achado, responda EXATAMENTE neste formato:

**[CATEGORIA] Título curto**
- Arquivo: path/to/file:linha
- Severidade: P1 (crítico) | P2 (importante) | P3 (sugestão)
- Problema: descrição clara
- Fix sugerido: código ou instrução

Contexto dos commits:
[COMMIT_LOG]

NÃO use ferramentas, NÃO edite arquivos, NÃO rode comandos. Apenas analise o diff e retorne os achados.
PROMPT
)" --model opus --max-turns 1

# Opção 2: Para diffs pequenos, inline no prompt
claude -p "Revise este diff para bugs e vulnerabilidades: $(git diff HEAD~3..HEAD)" --model opus --max-turns 1
```

### Flags obrigatórias

| Flag | Valor | Por quê |
|------|-------|---------|
| `-p` | prompt | Modo headless, não-interativo |
| `--model` | `opus` | Força Opus 4.7 (melhor em SWE-bench Pro) |
| `--max-turns` | `1` | Evita loop agentic — queremos apenas análise, não execução |

### Flags opcionais úteis

| Flag | Valor | Quando usar |
|------|-------|-------------|
| `--max-budget-usd` | `2.00` | Safety net (aplica mesmo em assinatura) |
| `--output-format` | `text` | Default, melhor pra parsing |
| `--allowedTools` | `""` (vazio) | Bloquear uso de ferramentas — review é read-only |

### Regras de execução

- **SEMPRE usar `--model opus`** — Opus 4.7 é #1 em SWE-bench Pro (64.3%), o benchmark mais relevante pra code review
- **SEMPRE usar `--max-turns 1`** — review é análise pura, não precisa de loop agentic
- **SEMPRE incluir no prompt**: "NÃO use ferramentas, NÃO edite arquivos" — prevenir efeitos colaterais
- **Timeout**: 5 minutos máximo
- **Se o diff for muito grande** (>100KB): dividir por arquivo e fazer múltiplas chamadas
- **Se falhar com erro de autenticação**: avisar Felipe para re-autenticar com `claude`

### Limites do diff

Se o diff total for maior que 100KB:
1. Listar arquivos modificados: `git diff --name-only HEAD~N..HEAD`
2. Agrupar por diretório/módulo
3. Enviar cada grupo separadamente pro Claude CLI
4. Consolidar resultados

### IMPORTANTE — Isolamento

Esta skill roda uma **instância SEPARADA** do Claude Code CLI. Isso significa:
- É um processo independente — não interfere na sessão atual
- Tem seu próprio contexto — não vê o histórico da conversa
- Consome tokens separadamente — é uma chamada à API como qualquer outra
- O output é capturado e processado pela instância atual (que já está rodando)

## Passo 4 — Classificação de prioridade

### P1 — Crítico (corrigir ANTES de deploy)
- Bugs que quebram funcionalidade em produção
- Vulnerabilidades de segurança (auth bypass, injection, RLS)
- Race conditions que causam perda de dados
- Erros de lógica que produzem resultado errado
- Regressões que quebram fluxos existentes

### P2 — Importante (corrigir nesta sessão)
- Dead code que polui o codebase
- Error handling ausente em paths críticos
- Tipagem incorreta ou `any` em interfaces públicas
- Inconsistências que confundem manutenção

### P3 — Sugestão (backlog)
- Melhorias de estilo e legibilidade
- Refatorações opcionais
- Performance não-crítica
- Convenções de naming

### Categorias
- **LÓGICA**: fluxo incorreto, condições erradas, edge cases
- **SINTAXE**: TypeScript errors, imports errados, tipos incorretos
- **ESTILO**: naming, formatação, patterns inconsistentes
- **SEGURANÇA**: auth, injection, exposure de dados, CORS
- **PERFORMANCE**: queries N+1, renders desnecessários, bundles grandes
- **DEAD_CODE**: imports, variáveis, funções, arquivos não usados

**REGRA ABSOLUTA — ACENTUAÇÃO:**
Todo texto gerado DEVE usar acentuação correta do português brasileiro. NUNCA gerar texto sem acentos.

## Passo 5 — Formato do relatório

Salvar no diretório atual do projeto em `docs/claude-reviews/claude-review-DD-MM-YYYY.md` (criar pasta se não existir):

```markdown
# Claude Review — DD/MM/YYYY

## Resumo
- **Branch**: main
- **Commits revisados**: X (hash1..hashN)
- **Modelo**: claude-opus-4-7 (via Claude Code CLI)
- **Achados**: X P1 | Y P2 | Z P3
- **Arquivos analisados**: N

## P1 — Críticos

### [CATEGORIA] Título curto do achado
- **Arquivo**: path/to/file.ts:42
- **Commit**: abc1234
- **Problema**: descrição clara do bug/vulnerabilidade
- **Impacto**: o que acontece se não corrigir
- **Fix sugerido**: código ou instrução de correção

---

## P2 — Importantes

### [CATEGORIA] Título curto
- **Arquivo**: path/to/file.ts:15
- **Commit**: abc1234
- **Problema**: descrição
- **Fix sugerido**: código ou instrução

---

## P3 — Sugestões

### [CATEGORIA] Título curto
- **Arquivo**: path/to/file.ts:88
- **Observação**: descrição da sugestão

---

## Output bruto do Claude

<details>
<summary>Clique para expandir</summary>

[OUTPUT COMPLETO DO CLAUDE CLI AQUI]

</details>
```

## Passo 6 — Ação pós-review

Depois de apresentar o resumo, perguntar:

> **P1s encontrados: N**
> Quer que eu corrija os P1s automaticamente? (sim/não/ver detalhes)

Se Felipe disser sim:
1. Corrigir cada P1 sequencialmente
2. Rodar build após cada correção (se aplicável à stack)
3. Apresentar diff pro Felipe aprovar antes de commit

## Fallback — Se Claude Code CLI falhar

Se o CLI não estiver instalado ou autenticação expirada:

1. Avisar: "Claude Code CLI não disponível. Posso fazer o review diretamente (já sou Opus 4.6), mas sem o isolamento de instância separada."
2. Se Felipe aceitar: fazer o review inline com as mesmas categorias e formato.

## Autenticação e custo

**Auth**: usa o login ativo do Claude Code CLI (assinatura do Felipe). NÃO usa API key avulsa.
- O comando `claude -p` herda a autenticação da sessão já logada
- Consome da cota da assinatura (Max/Pro), não gera cobrança API separada
- Se o login expirar: rodar `claude` interativo pra re-autenticar

**Custo efetivo**: $0 adicional (incluso na assinatura). Consome tokens do plano.

## Comparação com as outras skills de review

| Aspecto | /codex-review | /gemini-review | /claude-review |
|---------|--------------|----------------|----------------|
| Modelo | GPT-5.4 (OpenAI) | Gemini 3.1 Pro (Google) | Opus 4.7 (Anthropic) |
| Auth | API key | OAuth pessoal | Claude Code login |
| Custo/review | ~$0.40 | $0 | $0 (assinatura) |
| SWE-bench Pro | 58.6% | #3 global | 64.3% (#1) |
| Força | Agentic coding | Reasoning geral | Code review + reasoning |
| CLI | `codex review` | `gemini -p` | `claude -p` |

## Pipeline de review triplo recomendado

Para review máximo de uma story/feature crítica:
1. `/gemini-review` — Gemini 3.1 Pro (Google) — $0
2. `/codex-review` — GPT-5.4 (OpenAI) — ~$0.40
3. `/claude-review` — Opus 4.7 (Anthropic) — ~$1.00
4. Instância atual consolida achados dos três modelos

**Custo total do pipeline triplo: ~$1.40 por review.**

Ordem sugerida: do mais barato pro mais caro, pra que os achados fáceis sejam pegos primeiro sem gastar Opus.
