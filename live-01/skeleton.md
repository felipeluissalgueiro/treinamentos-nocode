# Live 01 — Como Montar seu Próprio Harness de IA com Claude Code

**Duração:** 2 horas | **Formato:** Demo ao vivo + construção guiada | **Data:** 04/06/2026

---

## Tema

**Como Montar seu Próprio Harness de IA com Claude Code**

Harness é o nome técnico para o que a maioria das pessoas ainda está tentando descobrir como fazer: um sistema operacional de IA — com contexto, memória e automações — que trabalha por você de forma consistente, não só responde perguntas.

Nessa live, o aluno vai entender como o Claude Code funciona por baixo do capô e vai construir, ao vivo, o esqueleto do próprio harness — usando como referência um framework real, construído e operado por uma empresa brasileira de IA.

---

## Por que esse tema agora

O mercado passou por três fases em 18 meses:

1. **"Usa IA no trabalho"** — ChatGPT, prompts, produtividade pessoal
2. **"Constrói com IA"** — APIs, no-code tools, automações pontuais
3. **"Opera com IA"** — sistemas com contexto, memória e agentes especializados que funcionam como um time

A maioria dos cursos ainda está ensinando a fase 1 e 2. A fase 3 é onde estão os builders que estão ganhando de verdade — e é o que pouquíssimas pessoas sabem como fazer.

Claude Code é a ferramenta que viabilizou isso. Não é um chat. Não é um plugin de IDE. É um agente de terminal que lê o projeto inteiro, executa tarefas encadeadas e pode ser estruturado em camadas — contexto, memória e execução — formando um harness completo.

Quem souber montar esse sistema vai operar com IA em outro nível. Quem não souber vai continuar usando prompt solto.

---

## O que o aluno vai aprender

1. Como o Claude Code realmente funciona — e o que o diferencia de um chat ou IDE com IA
2. O que é um harness e quais são suas 3 camadas fundamentais
3. Como criar um CLAUDE.md que dá personalidade, escopo e regras ao agente
4. Como estruturar squads — agentes especializados com contexto e memória próprios
5. Como orquestradores e workers dividem responsabilidades dentro do sistema
6. O que são hooks e como automatizam comportamentos no harness
7. Como spawnar subagentes e conectar serviços externos via MCP
8. Como montar prompts que funcionam dentro de um sistema de agentes
9. Por que multi-model importa e como usar cada IA no papel certo
10. Como definir permissões — o que o agente pode e não pode fazer

---

## O que o aluno será capaz de fazer depois dessa live

- **Instalar e configurar** o Claude Code corretamente no próprio ambiente
- **Criar um CLAUDE.md** estruturado que dá contexto real ao agente
- **Montar um squad simples** com persona, escopo e memória definidos
- **Criar uma skill** funcional e invocá-la dentro do contexto do harness
- **Entender qualquer harness de IA** que encontrar — Cursor, Windsurf, frameworks customizados — porque vai conhecer a arquitetura por baixo
- **Ter um esqueleto funcional** do próprio harness ao final da live, pronto pra expandir

---

## Estrutura da Live (2h)

### Bloco 1 — Abertura com impacto (10 min)

**O que acontece:** Felipe abre mostrando o PD Framework rodando ao vivo — squads respondendo, memória sendo lida, skills disparando, agentes especializados por área. O aluno vê um sistema real de IA operando uma empresa.

**Por que esse bloco:** anchoring. O aluno precisa ver o destino antes de entender o caminho. Ver o sistema funcionando cria curiosidade genuína pelos fundamentos — que vêm no bloco seguinte como resposta ao "como isso funciona?", não como pré-requisito chato.

**Subtópicos:**
- Demo ao vivo do PD Framework: squads, STATE.md, skills disparando
- "Isso foi construído com Claude Code. Hoje você vai entender como — e vai começar a montar o seu."

---

### Bloco 2 — Por baixo do capô (45 min)

**O que acontece:** Felipe desmonta o que o aluno acabou de ver. Explica a arquitetura camada por camada, mostrando cada peça no PD Framework real. Cada subtópico tem ~5 min.

**Por que esse bloco:** o aluno precisa do vocabulário e do modelo mental antes de construir. Fundamentos aparecem como explicação do que já viu — não como teoria prévia.

**Subtópicos:**

**2.1 — O que é Claude Code (e o que não é)** *(5 min)*
- Diferença entre claude.ai (chat), Cursor (IDE com IA) e Claude Code (agente de terminal)
- O que significa ser um agente: lê arquivos, executa comandos, encadeia ações
- Por que isso muda o que é possível construir

**2.2 — Não é vibe coding** *(5 min)*
- Vibe coding: prompt vago + esperar que saia certo + rezar
- Harness: contexto estruturado + regras explícitas + resultado previsível
- A diferença não é a IA — é o sistema em volta dela
- Demo: mesmo pedido com e sem contexto estruturado — outputs completamente diferentes

**2.3 — Anatomia de um prompt que funciona** *(5 min)*
- Os 5 elementos que fazem um prompt funcionar dentro de um harness: contexto + formato + restrições + exemplos + critério de qualidade
- Prompt vago = roleta. Prompt estruturado = produção
- Por que dentro de um harness o prompt não precisa repetir contexto — o CLAUDE.md já carrega

**2.4 — As 3 camadas do harness** *(5 min)*
- Camada 1 — Contexto: CLAUDE.md (quem sou, o que faço, o que não faço)
- Camada 2 — Memória: STATE.md (o que já aconteceu, o que está em progresso)
- Camada 3 — Execução: skills e workers (o que sei fazer de forma repetível)
- Como as 3 camadas conversam e se atualizam

**2.5 — Orquestradores e workers** *(5 min)*
- Orquestrador: o agente que decide, delega e coordena — não executa tudo
- Worker: o agente que executa uma tarefa específica de forma determinística
- Por que separar os dois: escalabilidade, previsibilidade, custo
- Exemplo real: Stamper (orquestrador) delegando pro Squad Comercial (worker especializado)

**2.6 — Hooks: o que dispara automático** *(5 min)*
- O que são hooks no Claude Code: PreToolUse, PostToolUse, Stop
- Como usar hooks pra automatizar comportamentos sem precisar pedir
- Exemplos reais do PD Framework: hook que cria branch de sessão automaticamente, hook que faz merge ao encerrar
- Hooks = o sistema que roda mesmo quando você não está pedindo

**2.7 — Subagentes e squads** *(5 min)*
- Como spawnar um subagente a partir de um orquestrador
- O que é um squad: agente especializado com CLAUDE.md + memória própria + escopo delimitado
- Por que um agente generalista não escala — e como squads resolvem isso
- MCP: conectar Claude a serviços externos (Notion, Supabase, GitHub) sem escrever integração

**2.8 — Multi-model: a IA certa pra cada tarefa** *(5 min)*
- Uma IA pra tudo = caro e inconsistente
- Claude Code = construir e orquestrar. Codex = revisar código. Gemini = imagem. GPT-4 = classificação
- Como o PD Framework usa múltiplos modelos no mesmo pipeline
- "Barato que não funciona é o mais caro que existe"

**2.9 — Permissões: o que o agente pode e não pode fazer** *(5 min)*
- Por que definir limites é tão importante quanto definir capacidades
- Permissões no Claude Code: o que o agente executa automaticamente vs o que pede confirmação
- Operações destrutivas: por que certas ações exigem confirmação explícita
- Como configurar permissões no settings.json do harness

---

### Bloco 3 — Construção ao vivo (45 min)

**O que acontece:** Felipe constrói um mini-harness do zero na tela. O aluno acompanha e replica em paralelo. Ao final desse bloco, cada aluno tem um esqueleto funcional.

**Por que esse bloco:** aprendizado acontece na prática. Ver funcionar não é suficiente — construir é.

**Subtópicos:**

**3.1 — Setup da bancada** *(10 min)*
- Instalar Claude Code: `irm https://claude.ai/install.ps1 | iex` (Windows) ou `curl` (Mac/Linux)
- Login e verificação de versão
- Criar estrutura de pastas do harness:
  ```
  meu-harness/
    CLAUDE.md
    squads/
    skills/
    memory/
  ```
- Primeiro CLAUDE.md global: identidade + regras básicas

**3.2 — Criando o primeiro squad** *(15 min)*
- Estrutura de um squad: `CLAUDE.md` + `memory/STATE.md` + `skills/`
- Definindo persona: quem é esse agente, qual o escopo, o que ele não faz
- STATE.md inicial com as 3 camadas: L1 (status atual), L2 (em progresso), L3 (backlog)
- Abrindo o squad e vendo o agente responder com o contexto correto

**3.3 — Criando a primeira skill** *(15 min)*
- O que é uma skill: comportamento encapsulado, invocável com `/nome`
- Estrutura de um arquivo de skill: objetivo + steps + inputs + outputs
- Criando skill `/status` ao vivo: o agente lê o STATE e reporta o panorama
- Invocando a skill e vendo funcionar dentro do squad

**3.4 — Fechamento do mini-harness** *(5 min)*
- Revisão do que foi construído: CLAUDE.md global + squad + STATE.md + skill
- O que cada peça faz e como expandir
- "Esse esqueleto é o mesmo que está por baixo do PD Framework. A diferença é tempo e contexto."

---

### Bloco 4 — Q&A + próximas lives (20 min)

**O que acontece:** perguntas dos alunos, casos específicos, e apresentação do que vem a seguir.

**Subtópicos:**
- Perguntas abertas sobre o que foi construído
- "Onde encaixo isso no meu projeto atual?" — Felipe responde casos reais
- Prévia das próximas lives: construção de produto real (gerador de carrosséis) usando o harness como base
- **Anúncio HIVE:** ao final da live, apresentar o HIVE como o harness completo de empresa — 11 squads, memória, hooks, skills — disponível para download imediato

---

## HIVE — entregável da live

Ao final do Bloco 4, Felipe apresenta o **HIVE** — a versão genérica e open source do PD Framework, construída especificamente para que qualquer pessoa possa usar como base do próprio harness.

- **Repo:** https://github.com/felipeluissalgueiro/hive
- **Landing:** https://hive.cadencia.ia.br
- **O que o aluno recebe:** harness completo com 11 squads (Commercial, CS, Marketing, Product, Finance, Dev, Infra, Operations, Quality, Intelligence + Orchestrator), memória estruturada, 9 hooks, skill `/hive-setup` de onboarding e documentação completa
- **Como usar:** `git clone` + `/hive-setup` — personalizado em menos de 10 minutos

**Frase de encerramento sugerida:**
*"Vocês acabaram de construir o esqueleto. O HIVE é o edifício inteiro — 11 squads, memória, hooks, workers — pronto pra você personalizar pra sua empresa. É o mesmo framework que a PD usa. E hoje vocês entenderam como funciona por baixo."*

---

## Resultado esperado ao final da live

O aluno sai com quatro coisas:

1. **Mental model claro** — entende o que está por baixo de qualquer ferramenta de IA baseada em agentes
2. **Esqueleto funcional** — CLAUDE.md + 1 squad + STATE.md + 1 skill rodando na própria máquina
3. **HIVE** — harness completo de empresa para clonar e expandir imediatamente
4. **Direção** — sabe o próximo passo: usar o HIVE como base e construir produto em cima dele nas próximas lives
