# Como Criar um Harness Claude Code

> Material adaptado da aula de 2h49min do instrutor. Vai fundo na tese central do treinamento: **Claude Code não é um modelo, é um harness — e harness é o que separa quem usa IA de quem constrói com IA.** Material profundo, denso. Estude depois da S1 quando o vocabulário básico já tiver entrado.

---

## TL;DR (7 pontos)

1. **Claude Code não é modelo, é harness.** Um harness é a estrutura de arquivos e scripts que amarra, direciona e persiste o comportamento de uma LLM dentro de um projeto.
2. **Tokens estão subsidiados.** O modelo correto hoje é gastar o máximo possível enquanto ainda é barato — quem aprende a usar agora vai chegar com vantagem quando o preço normalizar.
3. **Sem `CLAUDE.md`, `state.md` e arquivos de memória, cada sessão começa do zero** — e o modelo alucina por falta de contexto. Memória é o ponto central do harness.
4. **Squads especializados (personas com domínio específico) escalam melhor** que um agente generalista. Workers Python determinísticos evitam gastar tokens em tarefas repetíveis.
5. **RAG infla contexto e aumenta alucinação em agentes de código.** Prefira arquivos MD pontuais, busca semântica local (script tipo `lookup.py`) ou embeddings por célula.
6. **MCP nem sempre é a melhor opção.** CLI e chamadas diretas de API são mais determinísticas para operações conhecidas.
7. **N8n não escala pra agentes de IA em produção.** Workers Python + orquestrador + cron é mais rápido e confiável pra qualquer caso real de alto volume.

---

## A analogia que fecha tudo: harness = sistema operacional

Memorize essa analogia. Ela vira régua de design pro resto da sua vida construindo com IA:

| Computador | LLM com harness |
|---|---|
| **CPU** | LLM (modelo, ex: Claude Sonnet) |
| **RAM** | Janela de contexto |
| **Sistema Operacional (Windows/Linux)** | Harness (Claude Code, OpenCode, seu próprio) |
| **Programas instalados** | Skills + workers |
| **Drivers** | MCPs (conectam o agente a serviços externos) |

Quando você entende isso, fica óbvio:
- Por que CPU sozinha não faz nada — precisa de OS pra ser útil
- Por que RAM cheia trava o sistema (= contexto cheio gera alucinação)
- Por que driver ruim instala mal (= MCP mal-feito infla contexto com lixo)

---

## Os arquivos do harness (camadas de memória)

Sem esses arquivos, cada sessão começa do zero. **O modelo não "lembra" — ele lê arquivos.** Toda persistência é gambiarra estruturada, e entender isso é a chave.

### `CLAUDE.md` (e `AGENTS.md` no OpenCode)
- Convenções em cascata: escopo, regras, referências
- Lido automaticamente pelo agente no início da sessão
- Versão por projeto + versão global em `~/.claude/CLAUDE.md`

### `SOUL.md` (opcional — identidade)
- Personalidade do agente — equivale ao "system prompt" da API
- Útil quando você quer várias personas no mesmo projeto (Maria do marketing ≠ João do dev)

### `state.md` (memória transacional viva)
- Atualizado a cada sessão
- Organizado em camadas:
  - **L1** — status atual (o que está fazendo agora)
  - **L2** — em progresso (issues abertas)
  - **L3** — backlog (próximos passos)

### `decisions.md` (log de decisões)
- Cada decisão técnica importante: contexto + motivação + consequência
- Anti-padrão: tomar decisão, esquecer 2 semanas depois, refazer mal

### `gotchas.md` (armadilhas registradas)
- Bug que mordeu uma vez não pode morder duas
- Cada gotcha = "se isso acontecer, faça X"

---

## Foundation / Context: substituindo RAG

**O problema do RAG:** infla contexto com chunks aproximados. Pra agente de código, quase sempre piora a alucinação em vez de reduzir.

**Alternativa que funciona:**
1. **Arquivos MD pontuais por domínio** (ex: `foundation/api-reference.md`, `context/cliente-x.md`)
2. **Busca semântica local** com script (`lookup.py` ou similar) que indexa sessões/incidentes/memória
3. **Embeddings por célula** quando precisa scale — você embeda cada item separado e invoca o embed específico

A regra: **prefira buscar 1 item exato a recuperar 10 chunks vagamente relacionados.**

---

## Workers Python determinísticos

Quando NÃO usar LLM:
- Tarefa tem regra clara, repetível, sem ambiguidade
- Mesma entrada deve gerar mesma saída sempre
- Você consegue escrever a regra em código sem ramificar muito

**Exemplo:** "todo dia 5 do mês, gere o relatório financeiro." Não precisa de LLM. Worker Python + cron resolve.

**Exemplo de QUANDO usar LLM:** "leia o email do cliente e classifique a intenção em [comprar, suporte, reclamação, outro]." Aqui o LLM ganha — entrada varia muito, regra fixa não cobre.

**Padrão profissional:** o agente IA chama workers determinísticos quando faz sentido. Você não paga tokens pra tarefa que script faz de graça.

---

## Personas e Squads — escalando com especialistas

**Anti-padrão:** 1 agente generalista que tenta saber tudo (marketing + dev + financeiro + comercial). Resultado: skills demais no contexto, comportamento errático, performance ruim.

**Padrão profissional:**
- Cada squad/domínio tem seu próprio agente especialista
- Skills do dev não entram no contexto do comercial
- Memória separada por squad

**Resultado:** menos tokens, menos alucinação, mais foco. Decisão de arquitetura, não de organização.

---

## Subagentes e worktrees

- **Subagentes:** agentes spawados pelo orquestrador pra tarefas paralelas. Já nativo no Claude Code (e em runtimes equivalentes).
- **Worktrees:** branches isoladas — cada agente trabalha sem conflitar com a main.

Quando usar: refatoração grande na sessão principal + features pequenas em subagentes paralelos. Cada subagente em sua worktree, merge no final.

---

## MCP vs API vs CLI — quando usar cada um

**MCP** dá liberdade ao agente. Bom quando o caso de uso varia e você quer que o agente decida. Risco: infla contexto com respostas inesperadas do servidor MCP.

**API direta** é mais determinística. Boa quando você sabe exatamente o endpoint e o payload. Risco: tem que escrever wrapper.

**CLI** é o mais leve. Boa quando a operação já tem CLI pronta (gh, vercel, supabase, gcloud). Risco: depende de auth do shell.

**Regra prática:** prefere CLI > API > MCP, nessa ordem, se o caso de uso permite. MCP só quando o agente PRECISA decidir entre várias operações.

---

## Babysitting — o trabalho real de construir com IA

**Tese:** Você não fica programando — você fica revisando o que o agente programa. Issue por issue. Pra evitar:
- Atalho que vira bug em produção
- Lógica simplista que deixa edge case sem cobertura
- "Funciona" sem teste real

**Padrão:** human in the loop. Você valida antes de merge e deploy. Não delega final.

**Aviso amargo:** modelos não alucinam menos hoje — eles **te enganam mais**, porque estão com harness neles. A redução de alucinação que você percebe é efeito do controle externo, não de inteligência maior do modelo.

---

## Por que N8n não escala pra agente de IA

N8n é fila de requisição sequencial. Agente de WhatsApp com alto volume quebra porque:
- Cada mensagem é uma requisição na fila
- Latência de LLM acumula
- Erros não isolam — uma falha trava o fluxo todo
- Visual não vira código que você consegue versionar, testar, deployar

**Alternativa que escala:** workers Python paralelos + orquestrador + cron. Você ganha:
- Paralelismo real
- Testabilidade (cada worker é função pura)
- Versionamento Git
- Logging estruturado

Migrar de N8n pra código nos primeiros 30 dias é o segundo investimento de maior retorno (atrás só de aprender Claude Code).

---

## Conceitos importados de outras áreas

### Fator de correção (culinária → tokens)
No restaurante, "fator de correção" é a perda entre o que você compra (1kg de salmão com pele e espinha) e o que vira prato (300g de filé). Aplicado a tokens:

**Você pede X → o agente consome 5×X de contexto → gera 3×X de output → você usa 0.5×X disso.** Os outros 4.5×X foram "perda do corte". Entender essa perda muda como você projeta prompts.

### CMV (Custo da Mercadoria Vendida — gestão → IA)
No restaurante, CMV é o que custa o prato vs o que cobra. Aplicado a agente:
- Quanto cada execução custa em tokens
- Quanto valor entrega ao cliente
- Margem viável vs inviável

Agente IA bom tem CMV calculado, não chutado.

---

## Pessoas mencionadas (refs pra aprofundar)

- **Boris (Anthropic)** — engenheiro criador do Claude Code; conta a origem em podcast
- **Andrej Karpathy** — educador de IA; referência de estudo
- **Fábio Akita** — youtuber técnico BR; popularizou "harness" no Brasil via episódio no Flow
- **Joshua Greene** — autor de *Moral Tribes*; leitura de repertório

---

## Ferramentas mencionadas (mapa pra montar seu próprio harness)

| Categoria | Ferramentas mencionadas | Função |
|---|---|---|
| Runtime do agente | Claude Code, OpenCode | Roda o agente |
| Code review | Codex CLI, OpenRouter (Qwen, GLM) | 2ª opinião automatizada |
| Gestão de projeto | Linear, GitHub Issues | Epics → Stories → Issues |
| Credenciais | 1Password Service Accounts | Substitui .env, headless |
| Banco de dados | Supabase, Postgres, Redis | Persistência + cache |
| Deploy | Vercel, Railway, Coolify, VPS | Frontend + backend + infra |
| Conhecimento local | Obsidian + CouchDB (self-host) | Base de notas técnicas |
| Monitoramento | Sentry | Erros em produção |
| Transcrição | WhisperX (local, Hugging Face) | Reuniões → texto |
| Agregador modelos | OpenRouter | 300+ modelos via API única |
| WhatsApp | API genérica (Z-API, Evo, Twilio) | Notificações + bot |
| Spec-driven | Spec-Kit (GitHub) | Referência, não obrigatório |

---

## Trechos de alto impacto (referência)

Marcadores temporais da aula original, caso você tenha acesso ao vídeo:

| Tempo | Trecho |
|---|---|
| 00:07:47–08:26 | Analogia do fator de correção (salmão → tokens) |
| 00:15:16–15:51 | "Claude Code não é inteligente. É harness." |
| 00:17:01–17:33 | Analogia Super-Homem descobrindo poderes |
| 00:26:05–27:07 | "Harness é uma gambiarra sofisticada que as empresas criaram" |
| 00:29:16–31:10 | História: 3h tentando usar API do Obsidian que não existia (modelo inventou endpoints) |
| 00:53:27–54:35 | Caso real: primeiro criminoso condenado com base em chats com IA |
| 01:43:08–43:45 | Analogia completa: harness = sistema operacional |
| 02:07:12–08:15 | Trajetória pessoal: TDAH + altas habilidades como origem da curva de aprendizado |
| 02:15:56–16:31 | "Detesto N8n. Não faz mais sentido pra agentes de IA." |

---

## Conexões com o resto do kit

| Material relacionado | Onde está |
|---|---|
| Curso 60 aulas auto-estudo | `aulas/curso-claude-code/` |
| Padrão CLAUDE.md cascata | `aulas/curso-claude-code/modulo-02-fundamentos.md` §2.7 |
| Agnosticidade Claude Code + OpenCode | `kit-template/AGNOSTICIDADE.md` |
| System design (eixo arquitetural) | `material/system-design-vibe-coder.md` |
| Notas técnicas portáveis | `biblioteca/README.md` |
| Skills reutilizáveis | `kit-template/skills/` |

---

## Adaptação pro seu projeto

Esse material foi construído com base no harness do instrutor (que ele construiu pra rodar seus produtos). **Você não vai copiar o harness dele.** Vai construir o seu, sob medida pro seu projeto e domínio.

O que copiar:
- Conceitos: CLAUDE.md, state.md, decisions.md, gotchas.md
- Princípios: workers determinísticos onde der, squad especializado, CLI > MCP
- Analogias: harness = OS, fator de correção, CMV de tokens

O que NÃO copiar:
- Estrutura específica de squads (você não tem comercial+CS+infra+dev — você tem o seu domínio)
- Stack de produção (depende do projeto)
- Skills internas dele (a versão genérica vai pro `skills/` do kit; o resto é dele)

**Regra:** absorva os princípios, construa a sua versão. É justamente o que diferencia "construtor" de "copiador" — o tema central do treinamento.
