# Instalação — Claude Code + OpenCode

> Setup completo do ambiente. Faça antes da S1. Dúvida trava aqui — manda print no WhatsApp.

---

## Pré-requisitos (todos os sistemas)

- **Conta Anthropic** com Claude Pro (US$ 20/mês) — necessária pro Claude Code rodar com Sonnet/Opus
- **Node.js 20+** — instala via [nodejs.org](https://nodejs.org) ou nvm
- **Git** — instala via [git-scm.com](https://git-scm.com) (no Windows, marca a opção "Git Bash")
- **GitHub CLI (`gh`)** — instala via [cli.github.com](https://cli.github.com)
- **VS Code** ou editor de preferência (opcional mas recomendado)

---

## 1. Claude Code (recomendado como primeiro runtime)

### macOS / Linux

```bash
npm install -g @anthropic-ai/claude-code
claude --version
claude  # primeira execução pede login do navegador
```

### Windows (PowerShell)

```powershell
npm install -g @anthropic-ai/claude-code
claude --version
claude
```

### Validação

Abre o terminal numa pasta qualquer e roda `claude`. Deve abrir a interface conversacional. Manda "olá" — se responder, tá funcionando.

**Setup de memória persistente:** o Claude Code lê `~/.claude/CLAUDE.md` automaticamente (instruções globais que valem em qualquer projeto) e `<projeto>/CLAUDE.md` (instruções do projeto). Edite ambos conforme o aluno-modelo.

---

## 2. OpenCode (alternativa open-source — opcional mas vale conhecer)

OpenCode é um runtime open-source equivalente ao Claude Code. Mesmo conceito de agente CLI com tools, hooks e skills. **Diferenças práticas:**

- Roda em **qualquer modelo** (Claude, GPT-5, Gemini, Llama via Ollama local, Qwen via OpenRouter)
- Configuração via `opencode.json` em vez de `~/.claude/settings.json`
- Lê `AGENTS.md` em vez de `CLAUDE.md` — mesmo conteúdo, nome diferente
- Open-source, hackável

### Instalação

```bash
# macOS / Linux
curl -fsSL https://opencode.ai/install | bash

# Windows (PowerShell)
iwr -useb https://opencode.ai/install.ps1 | iex
```

### Validação

```bash
opencode --version
opencode  # primeira execução pede config (modelo + key)
```

### Configuração mínima (`opencode.json` na raiz do projeto)

```json
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["CLAUDE.md", "AGENTS.md"]
}
```

> **Por que apontar pros dois arquivos:** mantém o projeto agnóstico — funciona em qualquer um. Ver `AGNOSTICIDADE.md`.

### Provedor de modelo

OpenCode aceita Anthropic direto, OpenAI, OpenRouter (multi-modelo), Ollama local. Recomendado pra começar: **Anthropic** (mesma key do Claude Code, custo separado). Pra economizar: **OpenRouter** com Qwen 3 Max ou GLM 5.2.

---

## 3. Configuração do `~/.claude/` (memória global)

Cria o diretório:

```bash
mkdir -p ~/.claude/skills
mkdir -p ~/.claude/scripts
```

Cria `~/.claude/CLAUDE.md` mínimo:

```markdown
# Instruções globais

- Idioma: português (BR)
- Tom: direto, sem floreio
- Antes de criar arquivo novo, prefira editar existente
- Operações destrutivas exigem minha confirmação explícita
```

> O equivalente no OpenCode: `~/.config/opencode/AGENTS.md`. Mesmo conteúdo.

---

## 4. Skills do kit

Pra usar uma skill do `skills/` deste repo:

**Claude Code:**
```bash
cp -r skills/<nome> ~/.claude/skills/
```

**OpenCode:**
```bash
mkdir -p ~/.config/opencode/skills
cp -r skills/<nome> ~/.config/opencode/skills/
```

A skill fica disponível como `/<nome>` no chat.

---

## 5. GitHub CLI — autenticação

```bash
gh auth login
# escolhe HTTPS + login via browser
gh repo list felipeluissalgueiro --limit 5  # validação
```

---

## 6. Validação final (antes da S1)

Checklist — manda print no WhatsApp quando todos derem ok:

- [ ] `claude --version` retorna versão (ex: `1.0.x`)
- [ ] `opencode --version` retorna versão (opcional)
- [ ] `gh auth status` mostra autenticado
- [ ] `git config user.name` e `git config user.email` configurados
- [ ] Consegue rodar `claude` e ele responde "olá"
- [ ] Clonou este kit em pasta de trabalho

---

## Troubleshooting

| Erro | Causa | Solução |
|---|---|---|
| `claude: command not found` | npm global path não está no PATH | macOS/Linux: `export PATH=$PATH:$(npm prefix -g)/bin` ; Windows: reiniciar terminal |
| Claude pede login toda vez | Token não persistiu | macOS: liberar Keychain ; Windows: rodar como admin uma vez |
| `EACCES` no `npm install -g` | Permissão | macOS/Linux: usar nvm em vez de sudo |
| OpenCode pede modelo na primeira run | Esperado | Escolhe Anthropic + cola sua API key |
| `gh auth` falha | 2FA | Usa token PAT em vez de senha — gerar em github.com/settings/tokens |
