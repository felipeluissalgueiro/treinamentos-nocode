# claude-dev-skills

> 37 skills para Claude Code cobrindo o ciclo completo de desenvolvimento — code review, debugging, desenvolvimento orientado a spec, TDD, arquitetura e muito mais.

Uma coleção curada de skills battle-tested para o [Claude Code](https://code.claude.com), organizadas para cobrir todo o ciclo de vida do desenvolvimento de software. Instale uma vez, use em qualquer projeto.

**[🇺🇸 English version](README.md)**

---

## Instalação

**macOS / Linux / WSL**

```bash
git clone https://github.com/Posicionamento-Digital/claude-dev-skills.git
cd claude-dev-skills
chmod +x install.sh && ./install.sh
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/Posicionamento-Digital/claude-dev-skills.git
cd claude-dev-skills
.\install.ps1
```

Reinicie o Claude Code após instalar. As skills são colocadas em `~/.claude/skills/` e ficam disponíveis em todos os seus projetos imediatamente.

Para sobrescrever skills existentes: `./install.sh --force` / `.\install.ps1 -Force`

---

## Catálogo de Skills

### Code Review

| Skill | O que faz |
|---|---|
| `/claude-review [N\|SHA\|range]` | Review via Claude Opus — classifica achados em P1/P2/P3 |
| `/gemini-review [N\|SHA\|range]` | Review via Gemini CLI (gratuito, Google OAuth) |
| `/codex-review [N\|SHA\|range]` | Review via OpenAI Codex CLI |
| `/runtime-fix-review` | Verifica se fixes declarados estão estruturalmente corretos e alcançáveis em runtime |
| `/simplify` ¹ | Revisa código alterado para reuso, qualidade e eficiência |
| `/review` ¹ | Revisa um pull request aberto |
| `/security-review` ¹ | Review focado em segurança dos changes da branch atual |

### Debugging

| Skill | O que faz |
|---|---|
| `/debug-polya` | Framework estruturado em 4 fases baseado em Pólya — entenda antes de agir |
| `/mp-diagnose` | Loop disciplinado: reproduzir → minimizar → hipótese → instrumentar → corrigir → regression-test |

### Desenvolvimento Orientado a Spec

Use para construir features novas com uma abordagem estruturada, spec-first.

| Skill | O que faz |
|---|---|
| `/speckit-constitution` | Cria ou atualiza a constituição do projeto (princípios, convenções) |
| `/speckit-specify` | Escreve a spec da feature a partir de descrição em linguagem natural |
| `/speckit-clarify` | Identifica e resolve ambiguidades na spec |
| `/speckit-plan` | Gera artefatos de design (arquitetura, modelo de dados, contratos de API) |
| `/speckit-tasks` | Gera lista de tarefas ordenada por dependências |
| `/speckit-analyze` | Verifica consistência entre spec, plano e tarefas |
| `/speckit-implement` | Executa as tarefas do tasks.md uma a uma |
| `/speckit-checklist` | Gera checklist customizado para a feature atual |

### TDD e Prototipagem

| Skill | O que faz |
|---|---|
| `/mp-tdd` | Desenvolvimento orientado a testes com ciclo red-green-refactor |
| `/mp-prototype` | Constrói um protótipo descartável para validar um design antes de commitar |

### Arquitetura

| Skill | O que faz |
|---|---|
| `/mp-improve-codebase-architecture` | Encontra oportunidades de melhoria informadas por CONTEXT.md e ADRs |
| `/mp-zoom-out` | Contexto sistêmico — entenda o quadro maior antes de mergulhar |

### Discovery e Planejamento

| Skill | O que faz |
|---|---|
| `/mp-grill-me` | Stress-test implacável de um plano — sem código, só perguntas |
| `/mp-grill-with-docs` | Questiona seu plano contra o domain model existente |
| `/mp-to-prd` | Transforma a conversa atual em um PRD |
| `/mp-to-issues` | Quebra um plano em issues independentes no GitHub |
| `/mp-triage` | Triagem de issues via state machine com papéis definidos |

### Git e Setup

| Skill | O que faz |
|---|---|
| `/mp-git-guardrails-claude-code` | Adiciona hooks para bloquear comandos git perigosos (push, reset --hard, clean) |
| `/mp-setup-pre-commit` | Configura Husky + lint-staged (Prettier) + type checking + testes |
| `/speckit-git-initialize` | Inicializa um repositório git com commit inicial |
| `/speckit-git-feature` | Cria branch de feature com numeração sequencial |
| `/speckit-git-commit` | Faz commit automático após um comando Spec Kit |
| `/speckit-git-remote` | Detecta a URL do remote git para integração com GitHub |
| `/speckit-git-validate` | Valida se a branch atual segue as convenções de nomenclatura |

### Scaffolding e Migração

| Skill | O que faz |
|---|---|
| `/mp-scaffold-exercises` | Cria estruturas de diretório para exercícios com seções e soluções |
| `/mp-migrate-to-shoehorn` | Migra type assertions `as` para `@total-typescript/shoehorn` em testes |
| `/speckit-taskstoissues` | Converte tasks.md em issues acionáveis no GitHub |

### Documentação

| Skill | O que faz |
|---|---|
| `/registrar-incidente` | Registra incidentes e aprendizados técnicos em um hub centralizado |
| `/init` ¹ | Inicializa um CLAUDE.md com documentação do codebase |

### Produtividade

| Skill | O que faz |
|---|---|
| `/mp-caveman` | Modo de comunicação ultra-comprimido — ~75% menos tokens |
| `/mp-handoff` | Compacta a conversa atual em um documento de handoff para outro agente |
| `/mp-write-a-skill` | Cria novas skills com estrutura correta e progressive disclosure |
| `/fewer-permission-prompts` ¹ | Escaneia transcrições e adiciona allowlist para reduzir prompts de permissão |

> ¹ Skill built-in do Claude Code — não incluída neste repositório. Disponível no Claude Code por padrão.

---

## Workflows

Combinações comuns para cenários do dia a dia:

- [Nova Feature](docs/workflows/new-feature.md) — spec → plan → implement → review
- [Debugging](docs/workflows/debugging.md) — reproduce → diagnose → fix → verify
- [Code Review](docs/workflows/code-review.md) — review single-model ou cross-model + verificação pós-fix

---

## Setup Recomendado por Projeto

Para melhores resultados, adicione dois arquivos em cada projeto:

**`CONTEXT.md`** — linguagem ubíqua e domain model. Várias skills (`/mp-grill-with-docs`, `/mp-improve-codebase-architecture`, `/mp-diagnose`) leem este arquivo para se manterem alinhadas com o seu domínio.

```markdown
# Projeto: Meu App

## Linguagem do Domínio
- **Pedido** — uma compra confirmada...
- **Carrinho** — coleção temporária de itens...

## Invariantes
- Pedidos são imutáveis após confirmação
...
```

**`docs/adr/`** — Architecture Decision Records. Um arquivo por decisão significativa (`0001-usar-postgres.md`). As skills usam esses registros para evitar propor mudanças que contradigam decisões anteriores.

---

## Créditos

Esta coleção reúne skills de três fontes:

- **Skills `mp-*`** — [Matt Pocock](https://github.com/mattpocock/skills). Trabalho original de Matt Pocock, adaptado para esta distribuição. Licença MIT.
- **Skills `speckit-*`** — [Spec-Kit](https://github.com/github/spec-kit) by GitHub. Framework de Spec-Driven Development.
- **`debug-polya`, `claude-review`, `codex-review`, `gemini-review`, `runtime-fix-review`, `registrar-incidente`** — Skills originais de [Felipe Salgueiro](https://github.com/felipeluissalgueiro) / [Posicionamento Digital](https://github.com/Posicionamento-Digital).

---

## Contribuindo

1. Fork do repositório
2. Adicione sua skill em `skills/nome-da-skill/SKILL.md`
3. Siga o [formato SKILL.md](https://code.claude.com/docs/en/skills) — frontmatter YAML + instruções em markdown
4. Abra um PR com uma descrição curta do que a skill faz e quando ativá-la

---

## Licença

MIT — veja [LICENSE](LICENSE).

---

## Sobre o Autor

**Felipe Salgueiro** é desenvolvedor, empreendedor e builder de IA, baseado em Sorocaba, SP.

Fundou a [Posicionamento Digital](https://posicionamentodigital.com) — agência de marketing digital e automação com IA — e construiu o [Cadencia](https://cadencia.app.br), plataforma que automatiza pipelines de conteúdo para empresas usando agentes de IA. Também mantém o [Insight Artificial](https://insightartificial.ia.br), portal de conteúdo sobre IA aplicada a negócios.

Essas skills nasceram da necessidade. Gerenciar múltiplos projetos de software ao mesmo tempo, mantendo qualidade, exige uma disciplina que não vem de graça — ela precisa ser engenheirada. Ao longo do tempo, foi curadoria e construção dessa coleção para impor estrutura nas partes do desenvolvimento que mais escorregam: revisar código antes de fazer deploy, diagnosticar bugs de forma metódica em vez de adivinhar, escrever a spec antes de escrever o código, e verificar que os fixes realmente funcionam em runtime — não só no papel.

A coleção reúne o melhor das [skills de engenharia do Matt Pocock](https://github.com/mattpocock/skills), do [framework Spec-Kit do GitHub](https://github.com/github/spec-kit), e skills originais construídas a partir de lições duras em dezenas de projetos em produção.

**Links:**
- Site: [posicionamentodigital.com](https://posicionamentodigital.com)
- Plataforma IA: [cadencia.app.br](https://cadencia.app.br)
- Conteúdo IA: [insightartificial.ia.br](https://insightartificial.ia.br)
- GitHub: [@felipeluissalgueiro](https://github.com/felipeluissalgueiro)
- LinkedIn: [felipe-luis-salgueiro](https://linkedin.com/in/felipe-luis-salgueiro)
- Instagram: [@felipeluissalgueiro](https://instagram.com/felipeluissalgueiro)
- TikTok: [@felipeluissalgueiro](https://tiktok.com/@felipeluissalgueiro)
