# Agnosticidade — Claude Code + OpenCode

> Por que esse kit roda em **qualquer um dos dois runtimes** sem alteração de conteúdo. Padrão validado no framework PD em 2026-06.

---

## A tese

Você (aluno) não deve ficar amarrado num runtime. **O conteúdo é o que vale** — instruções, skills, templates, contexto. O runtime (Claude Code, OpenCode, qualquer agente futuro) é o motor que lê esse conteúdo. Trocar de motor não deveria custar reescrever o produto.

---

## Como funciona na prática

| Runtime | Arquivo de contexto que lê | Pasta de skills | Pasta de config |
|---|---|---|---|
| **Claude Code** | `CLAUDE.md` (raiz do projeto) + `~/.claude/CLAUDE.md` (global) | `~/.claude/skills/` ou `<projeto>/.claude/skills/` | `~/.claude/settings.json` |
| **OpenCode** | `AGENTS.md` (raiz do projeto) + `~/.config/opencode/AGENTS.md` (global) | `~/.config/opencode/skills/` ou `<projeto>/.opencode/skills/` | `opencode.json` (raiz do projeto) |

Mesmo paradigma. Nomes diferentes.

---

## Os 3 padrões pra ficar agnóstico

### Padrão 1 — Dois arquivos com mesmo conteúdo

`CLAUDE.md` e `AGENTS.md` na raiz, mesmo texto. Ambos commitados. Manutenção: editar um e copiar pro outro.

**Quando usar:** simples, funciona em qualquer SO, sem pegadinha.

### Padrão 2 — Um arquivo + symlink

Mantém só `CLAUDE.md` real. `AGENTS.md` é symlink:

```bash
# macOS / Linux
ln -s CLAUDE.md AGENTS.md

# Windows (PowerShell, requer admin OU developer mode ligado)
New-Item -ItemType SymbolicLink -Path AGENTS.md -Target CLAUDE.md
```

**Quando usar:** quer uma única fonte de verdade. **Pegadinha:** Windows precisa de developer mode ligado (Settings → Privacy → For developers).

### Padrão 3 — Stub que importa (recomendado neste kit)

`AGENTS.md` é um stub curto que aponta pro `CLAUDE.md`:

```markdown
# AGENTS.md
> Espelho do CLAUDE.md.
@./CLAUDE.md
```

A sintaxe `@./CLAUDE.md` é interpretada pelo OpenCode (e pelo Claude Code, que ignora se não souber). Vantagem: zero risco de divergência, funciona em qualquer SO sem symlink.

**Quando usar:** padrão aqui, default do `kit-template`.

---

## Como foi feito no framework PD (origem desse padrão)

O monorepo `pd-framework` tem na raiz:

```json
// opencode.json
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["CLAUDE.md", "AGENTS.md"]
}
```

E mantém `CLAUDE.md` como fonte canônica. Mesma estrutura de pastas (`.claude/` e `.opencode/` coexistem nas worktrees).

Resultado: qualquer agente, qualquer dia, qualquer runtime — abre o repo e tem contexto. Vale pra Felipe trabalhando solo, pro Luiz remoto, pra qualquer aluno do treinamento.

---

## Como aplicar isso nos seus projetos próprios (após o treinamento)

Regra de bolso quando iniciar projeto novo:

1. Crie `CLAUDE.md` na raiz com contexto do projeto
2. Crie `AGENTS.md` stub que importa o `CLAUDE.md`
3. Crie `opencode.json` apontando pra ambos
4. Estrutura `.claude/skills/` E `.opencode/skills/` (a segunda pode ser symlink/cópia)

Em 2 minutos seu projeto roda em qualquer runtime — Felipe usa Claude Code, você usa OpenCode com Qwen barato, futuro colaborador usa o que quiser.

---

## Por que isso importa pra MVP de 30 dias

O MVP que você vai entregar pro seu cliente vai ser mantido por quem? Talvez não você. Talvez seu sucessor use Cursor + Composer, OpenCode com modelo local, ou alguma coisa que ainda não existe. Se o projeto for **agnóstico desde o dia 1**, ele sobrevive à troca de runtime.

Custo zero pra fazer agora. Custo alto pra refazer depois.
