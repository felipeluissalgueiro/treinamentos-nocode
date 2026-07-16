# Módulo 1 — Mise en Place

**7 aulas · ~28min · Status: ✅ completo (com material adicional do roteiro)**

> "Antes de cozinhar, você organiza a bancada. Mise en place — tudo no lugar. Não pula essa parte. Se você pular, vai travar na aula 4 e vai ter que voltar aqui."

---

## Aula 1.1 — O que você vai precisar instalar (8 min)

### Stack que vamos instalar

| Ferramenta | O que faz | Por quê |
|---|---|---|
| **Node.js** | Motor que roda JavaScript | Backend, frontend, e o próprio Claude Code rodam em Node |
| **Python** | Motor que roda scripts de IA | Backend de agentes IA roda principalmente em Python |
| **Git** | Controle de versão | "Google Docs do código" — cada mudança fica salva |
| **Claude Code** | Agente IA no terminal | Sua ferramenta principal nos 30 dias |

### Passo a passo (Windows + Mac + Linux)

Abre o VS Code limpo. Abre o terminal integrado: **Ctrl+`** (Windows/Linux) ou **Cmd+`** (Mac).

#### 1. Verificar/instalar Node.js

```bash
node --version
```

Se não retornar versão (ex: `v20.x.x` ou superior):
- Baixar em [nodejs.org](https://nodejs.org) — instalar versão LTS
- Reabrir terminal e testar de novo

#### 2. Verificar/instalar Python

```bash
python --version
# ou (Mac/Linux):
python3 --version
```

Se não retornar versão (ex: `Python 3.11+`):
- Baixar em [python.org](https://python.org)
- **Windows:** marcar "Add Python to PATH" no instalador
- Reabrir terminal e testar

#### 3. Verificar/instalar Git

```bash
git --version
```

Se faltar:
- Baixar em [git-scm.com](https://git-scm.com)
- **Windows:** durante instalação, deixar Git Bash marcado

#### 4. Instalar Claude Code

```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

#### 5. Criar contas (gratuitas pra começar)

- **Anthropic Console** — [console.anthropic.com](https://console.anthropic.com) → gera API key
- **Supabase** — [supabase.com](https://supabase.com) → novo projeto
- **Vercel** — [vercel.com](https://vercel.com) → conectar GitHub
- **GitHub** — [github.com](https://github.com) (se ainda não tem)

**🏆 Troféu:** No terminal, os 4 comandos abaixo retornam versão:
```bash
node --version
python --version
git --version
claude --version
```

---

## Aula 1.2 — Terminal Unix no Windows (3 min)

### Por que isso importa

Quase todo material de programação assume terminal Unix (Mac/Linux). No Windows, o terminal padrão (CMD/PowerShell) tem sintaxe diferente. Solução: usar **Git Bash** como terminal padrão no VS Code.

### Passo a passo (só Windows)

1. Abre VS Code → **Ctrl+Shift+P** → digita "Terminal: Select Default Profile"
2. Escolhe **Git Bash**
3. Abre terminal novo (Ctrl+`) — agora vem com `$` no prompt em vez de `>`

### `npm` vs `npx` vs `pip` — pra quê serve cada um

| Comando | O que faz |
|---|---|
| `npm install <pacote>` | Instala biblioteca JS/Node no projeto |
| `npm install -g <pacote>` | Instala globalmente (vale no sistema todo) |
| `npx <comando>` | Roda comando sem instalar permanente |
| `pip install <pacote>` | Mesma coisa do npm, mas pra Python |

**🏆 Troféu:** Você abre o VS Code, abre o terminal, e ele mostra `$` no prompt (Git Bash). Sem CMD/PowerShell pelo caminho.

---

## Aula 1.3 — Conta e primeiro login no Claude Code (4 min)

### Duas formas de pagar

| Forma | Quando usar |
|---|---|
| **Assinatura Claude Pro/Max** ($20/$200 mês) | Uso pessoal contínuo. Inclui Claude na web + Code |
| **Console API** (pré-pago, créditos) | Uso de equipe, agentes em produção, ou se já tem assinatura mas quer key separada |

**Pra esse treinamento, recomendado:** Assinatura Pro ($20/mês). Cobre o uso esperado nos 30 dias sem surpresa.

### Login no terminal

```bash
claude
```

- Primeira vez abre browser pra login
- Após autorizar, sessão fica salva — não pede de novo

**🏆 Troféu:** Você digita `claude` no terminal e ele abre a interface conversacional. Manda "olá" e ele responde.

---

## Aula 1.4 — Stack do projeto: o que vamos usar e por quê (7 min)

### Analogia do restaurante

> "Imagina um restaurante. **Você é o dono. Claude Code é o chef. Next.js é o salão onde o cliente senta. FastAPI é a cozinha. Supabase é a despensa. Playwright é o fotógrafo que tira foto do prato pronto.**"

### Diagrama

```
[Você no terminal]
       ↓
[Claude Code] → escreve código
       ↓
[Next.js no Vercel] ←─ proxy ─→ [FastAPI no Railway]
                                       ↓
                                  [Supabase]
                                       ↓
                              [Playwright: HTML → PNG]
                                       ↓
                                  [Output final]
```

### Tradução pro fluxo do request

Cliente entra no salão (site) → faz o pedido (input) → garçom leva pra cozinha (FastAPI) → chef (Claude/LLM) prepara o conteúdo → monta no prato (template) → fotógrafo tira a foto (renderer) → entrega.

### Adaptando pro seu projeto

A stack acima é a do curso (gerador de carrosséis). **Sua stack vai ser diferente** dependendo do projeto-âncora — mas a estrutura é a mesma:

- Frontend (algum) — onde o usuário interage
- Backend — onde a lógica acontece
- LLM — onde a IA processa
- Database — onde os dados ficam
- Renderer/Output — o que o usuário recebe
- Deploy — onde tudo roda em produção

**🏆 Troféu:** Você consegue desenhar o fluxo do seu projeto no papel, nomeando cada caixa com a tecnologia que vai entrar.

---

## Aula 1.5 — Cria suas contas (4 min)

Já feito na 1.1 (Anthropic, Supabase, Vercel, GitHub). Aqui é só checar.

Adicionar se for usar:
- **Pexels** ([pexels.com](https://pexels.com)) — imagens gratuitas via API. Útil se projeto envolve imagens
- **Railway** ([railway.app](https://railway.app)) — deploy de backend Python/Docker. Free tier pra começar
- **Sentry** ([sentry.io](https://sentry.io)) — captura erros em produção. Plano grátis serve

**🏆 Troféu:** Você tem login funcionando em todas as plataformas que seu projeto vai precisar.

---

## Aula 1.6 — Quanto custa: a conta real (10 min)

### Custos reais (números reais, não chute)

| Serviço | Free tier | Quando começa a cobrar | Custo médio dev solo |
|---|---|---|---|
| **Anthropic** | $5 grátis de signup | API: pago por token consumido | $30-80/mês de uso normal |
| **OpenAI** | $5 grátis de signup | Pago por token | $10-30/mês (uso pontual) |
| **Vercel** | Grátis até bater limite | Pro plan $20/mês se passar | $0 → $20 |
| **Railway** | $5 grátis/mês | Pago por uso de CPU/RAM | $5-15/mês |
| **Supabase** | 500MB DB grátis | Pro $25/mês quando crescer | $0 → $25 |
| **Sentry** | 5k errors/mês grátis | Pago acima | $0 (geralmente) |
| **GitHub** | Grátis pra repo privado solo | Pago só pra time grande | $0 |

### MVP típico de aluno em 30 dias

**$50-80/mês** total. Lembrando: vai gastar mais no começo (você erra, roda pipeline várias vezes). Mês 2 já cai pra metade.

### A regra de ouro

> "Um carrossel custa 15 a 25 centavos de dólar pra gerar. Um designer cobra 150-300 reais pelo mesmo trabalho. 30 carrosséis/mês = 60 reais de API contra 6 mil de designer."

Vale pra qualquer caso de uso: agente que responde lead, agente que classifica documento, agente que resume reunião. O custo da IA é fração do custo humano equivalente.

### O que ninguém te conta

No começo você VAI gastar mais. Vai errar, vai rodar o pipeline várias vezes, vai testar. Primeiro mês triplica o gasto do mês estável. Normal. É investimento em aprendizado.

**🏆 Troféu:** Você abriu sua dashboard Anthropic + Vercel + Supabase e sabe seu custo projetado dos 30 dias.

---

## Aula 1.7 — A real sobre modelos de IA (10 min)

### Comparação ao vivo

Pega o MESMO prompt e roda em 3 modelos:

**Prompt teste:**
> "Cria uma função Python que conecta no Supabase e busca todos os registros da tabela `users`."

Roda em:
1. Claude Code (terminal) — `claude` e cola o prompt
2. ChatGPT (browser) — chat.openai.com
3. DeepSeek (browser) — chat.deepseek.com (opcional)

### Quem ganha em quê

| Modelo | Forte em | Fraco em | Quando usar |
|---|---|---|---|
| **Claude Sonnet/Opus** | Codar projetos reais, contexto longo, seguir instruções complexas | Custo mais alto, latência média | **Construção do MVP** (principal) |
| **GPT-4o / GPT-5** | Tarefas pontuais, geração de texto, classificação | Codar projeto inteiro com qualidade | **Tarefas pequenas dentro do agente** (resumir, classificar) |
| **DeepSeek / Qwen / GLM** | Custo baixíssimo, código simples | Inventa bibliotecas que não existem, sintaxe antiga | **Code review barato** (com supervisão) |
| **Gemini 2.5** | Bom em texto longo + imagens | Codar produção: instável | **Análise de docs, imagens** |
| **Haiku (Claude pequeno)** | Rápido, barato pra agente | Lógica complexa | **Workers que rodam em escala** |

### Lição amarga

> "Eu perdi 2 dias com DeepSeek antes de largar. Ele inventa biblioteca que não existe, usa sintaxe antiga, e o pior: você não percebe o erro até estar em produção."

**Regra:** modelo barato que não funciona é o mais caro que existe. Pra construir o MVP, vai de Claude. Pra economizar em escala depois, aí mistura.

**🏆 Troféu:** Você rodou o mesmo prompt em 2+ modelos e viu na própria tela a diferença de qualidade.

---

## Próximo módulo

[Módulo 2 — Fundamentos](modulo-02-fundamentos.md): CLAUDE.md, terminal, como o Claude Code lê seu projeto.
