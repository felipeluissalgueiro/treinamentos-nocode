---
name: gemini-review
description: >
  Roda code review via Gemini CLI (Google) na branch atual, processa o output e classifica
  achados em P1/P2/P3 por categoria (lógica, sintaxe, estilo, segurança).
  Ativar quando Felipe disser "/gemini-review", "roda gemini review", "review com gemini",
  "pede pro gemini revisar", "gemini review nos últimos commits".
---

# /gemini-review — Code Review via Gemini CLI + Classificação Estruturada

Executa o Gemini CLI do Google para revisar os commits recentes da branch atual, depois processa e classifica o output em categorias e prioridades.

## Comandos

- `/gemini-review` — revisa os últimos 3 commits da branch atual
- `/gemini-review 5` — revisa os últimos N commits
- `/gemini-review abc1234` — revisa um commit específico
- `/gemini-review abc1234..def5678` — revisa range de commits

## Pré-requisitos

1. **Gemini CLI instalado**: `npm install -g @google/gemini-cli`
2. **Autenticado via OAuth**: `gemini` (primeira execução autentica)
3. Estar dentro de um repositório git

## Fluxo

```
Felipe invoca /gemini-review [args]
    |
    v
1. Verificar Gemini CLI disponível
   - Rodar: gemini --version
   - Se falhar: avisar Felipe e abortar
    |
    v
2. Coletar diff dos commits alvo
   - git diff HEAD~N..HEAD (para N commits)
   - git show <SHA> (para commit específico)
   - git diff <SHA1>..<SHA2> (para range)
   - Incluir: git log --oneline para os commits no range
    |
    v
3. Montar prompt de review e enviar ao Gemini CLI
   - Modo headless: gemini -m gemini-2.5-flash -p "<prompt>"
   - Diff via stdin: git diff ... | gemini -m gemini-2.5-flash -p "<prompt>"
    |
    v
4. Capturar output completo do Gemini
    |
    v
5. Processar output do Gemini (Claude)
   - Parsear todos os achados
   - Classificar cada achado em:
     * Prioridade: P1 (crítico), P2 (importante), P3 (sugestão)
     * Categoria: LÓGICA | SINTAXE | ESTILO | SEGURANÇA | PERFORMANCE | DEAD_CODE
   - Agrupar por prioridade, depois por categoria
    |
    v
6. Gerar relatório estruturado
   - Salvar em: docs/gemini-reviews/gemini-review-DD-MM-YYYY.md (relativo ao projeto atual)
   - Criar pasta docs/gemini-reviews/ se não existir
   - Exibir resumo pro Felipe
    |
    v
7. Perguntar se quer corrigir os P1s automaticamente
```

## Passo 1 — Verificar Gemini CLI

```bash
# Verificar se está instalado
gemini --version

# Se falhar:
# "Gemini CLI não encontrado. Instale com: npm install -g @google/gemini-cli"
```

## Passo 2 — Coletar diff

### Mapeamento de argumentos do usuário → comando git

| Argumento do usuário | Comando git |
|---------------------|-------------|
| `/gemini-review` (sem args) | `git diff HEAD~3..HEAD` + `git log --oneline HEAD~3..HEAD` |
| `/gemini-review 5` | `git diff HEAD~5..HEAD` + `git log --oneline HEAD~5..HEAD` |
| `/gemini-review abc1234` | `git show abc1234` |
| `/gemini-review abc1234..def5678` | `git diff abc1234..def5678` + `git log --oneline abc1234..def5678` |

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

## Passo 3 — Enviar pro Gemini CLI

### Comando base

```bash
# Opção 1: Diff via pipe (preferida para diffs grandes)
git diff HEAD~3..HEAD | gemini -m gemini-2.5-flash -p "$(cat <<'PROMPT'
Você é um code reviewer sênior especializado em [STACK_DETECTADA].

Revise o diff abaixo com foco em:
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

Diff para revisar:
PROMPT
)"

# Opção 2: Para diffs pequenos, inline no prompt
gemini -m gemini-2.5-flash -p "Revise este diff: $(git diff HEAD~3..HEAD)"
```

### Regras de execução

- **Modelo padrão: `gemini-2.5-flash`** — disponível no tier gratuito OAuth, 1M contexto
- **Se Felipe tiver Google AI Pro/Ultra**: pode usar `gemini-3.1-pro-preview` via flag `--pro` (a ser implementada)
- **SEMPRE usar modo headless** (`-p` flag) — nunca modo interativo
- **Timeout**: 5 minutos máximo
- **Se falhar com erro de autenticação**: avisar Felipe para re-autenticar com `gemini` (interativo)
- **Se falhar com rate limit**: esperar 60s e tentar novamente (1 retry)
- **Output format**: usar `--output-format text` (default) para facilitar parsing

### Limites do diff e chunking — OBRIGATÓRIO

O tier gratuito tem **250K tokens/minuto**. Um diff grande pode estourar isso.

**SEMPRE aplicar chunking:**

1. Verificar tamanho do diff: `git diff HEAD~N..HEAD | wc -c`
2. **Se < 30KB** (~10K tokens): enviar tudo em uma chamada
3. **Se 30KB-100KB**: dividir por arquivo, agrupar até ~30KB por chamada
4. **Se > 100KB**: dividir por arquivo individual, enviar um por vez com 5s de delay entre chamadas

```bash
# Passo 1: Listar arquivos modificados
git diff --name-only HEAD~N..HEAD

# Passo 2: Para cada grupo de arquivos (~30KB)
git diff HEAD~N..HEAD -- arquivo1.ts arquivo2.ts | gemini -m gemini-2.5-flash -p "<prompt>"

# Passo 3: Consolidar resultados de todas as chamadas
```

**Rate limit safety**: máximo 5 chamadas por minuto. Se tiver mais grupos, inserir `sleep 15` entre batches.

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
- Correto: é, á, ã, õ, ç, ú, ê, ó, í, â
- Errado: "nao", "voce", "tambem", "producao", "construcao" (sem acentos)

## Passo 5 — Formato do relatório

Salvar no diretório atual do projeto em `docs/gemini-reviews/gemini-review-DD-MM-YYYY.md` (criar pasta se não existir):

```markdown
# Gemini Review — DD/MM/YYYY

## Resumo
- **Branch**: main
- **Commits revisados**: X (hash1..hashN)
- **Modelo**: gemini-2.5-flash
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

## Output bruto do Gemini

<details>
<summary>Clique para expandir</summary>

[OUTPUT COMPLETO DO GEMINI AQUI]

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

## Fallback — Se Gemini CLI não estiver disponível

Se o Gemini CLI não estiver instalado ou autenticação expirada:

1. Avisar: "Gemini CLI não encontrado ou não autenticado. Instale com `npm install -g @google/gemini-cli` e autentique rodando `gemini`."
2. Oferecer alternativa: fazer o review usando o próprio Claude (sem Gemini), seguindo a mesma estrutura de classificação P1/P2/P3.
3. Se Felipe escolher review manual: executar o review com as mesmas categorias e formato de output.

## Diferença em relação ao /codex-review

Esta skill existe como **segunda opinião** usando um modelo de empresa diferente (Google vs OpenAI). A diversidade de modelos aumenta a cobertura do review — cada modelo tem blind spots diferentes.

| Aspecto | /codex-review | /gemini-review |
|---------|--------------|----------------|
| Modelo | GPT-5.4 (OpenAI) | Gemini 2.5 Flash (Google) |
| Auth | API key (OPENAI_API_KEY) | OAuth pessoal (Google) |
| Custo | ~$0.40/review | $0 (conta pessoal) |
| CLI | `codex review --base` | `gemini -m ... -p` |
| Força | Agentic coding | Reasoning + SWE-bench |

## Uso combinado recomendado

Para review completo de uma story/feature:
1. `/codex-review` — primeira passada (OpenAI)
2. `/gemini-review` — segunda passada (Google)
3. Claude classifica e consolida achados de ambos
