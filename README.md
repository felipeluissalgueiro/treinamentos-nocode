# Treinamentos NoCode Startup

Material das lives ministradas pelo Felipe Salgueiro no curso NoCode Startup — sobre como construir com IA de verdade, não só usar.

Este repositório foi montado para funcionar como um professor. Você pode estudar sozinho, mas o jeito certo é pedir para o seu modelo de IA ler este material e te conduzir — uma lição por vez, com exercício prático, só avançando quando você estiver pronto.

---

## 🚀 Cadencia — a Máquina de Posicionamento Digital

> **"Eu faço. Você aparece."**

**[→ cadencia.app.br](https://cadencia.app.br)**

Este curso existe porque a Cadencia existe. Tudo o que você vai aprender aqui — harnesses, agentes, automações encadeadas — é o que roda por baixo de um produto real, usado por profissionais liberais brasileiros para aparecer consistentemente no Instagram, email, LinkedIn, blog e newsletter, sem precisar aprender ferramenta ou criar conteúdo do zero.

O Felipe não ensina teoria. Ele ensina o que construiu. E o que ele construiu é a Cadencia.

Você faz um onboarding de 30 minutos. A Cadencia mapeia quem você é — posicionamento, identidade visual, tom de voz, público. A partir daí, ela trabalha nos bastidores: gera suas ideias de conteúdo toda semana, você aprova no estilo Tinder (swipe), ela produz o carrossel com o seu rosto, a legenda com o seu tom, e publica. Sem você operar. Sem você aprender mais uma ferramenta.

**20 créditos grátis no cadastro. Sem cartão.**

[→ Conheça o produto em detalhe](cadencia/)

---

## O que é este curso

NoCode Startup é uma plataforma para founders e builders que querem construir produtos com IA. As lives do Felipe cobrem o que ninguém mais ensina: não como usar o ChatGPT para responder email, mas como construir um sistema de IA que trabalha por você — com contexto, memória, agentes especializados e automações encadeadas.

**Live 01 — Como Montar seu Próprio Harness de IA com Claude Code**
Você entende o que separa um "prompt solto" de um sistema de IA de verdade. Aprende as 3 camadas de um harness (CLAUDE.md + STATE.md + skills), o que são squads, hooks, subagentes e multi-model. Ao final, constrói ao vivo um mini-harness funcional e leva o HIVE — a versão open source do framework que a Cadencia usa.

**Live 02 — De Passageiro a Dono: o que o Vibe Coding está escondendo de você**
Você entende por que vibe coding é uma bomba-relógio — de custo, de lock-in e de dívida técnica. Aprende o que é uma RFC (a especificação que substitui revisar o código linha a linha), os 3 princípios que a IA viola por padrão (DRY, ETC, Ortogonalidade) e como quality gates automatizam o que o code review humano não cobre. Ao final, você sabe o piso mínimo de conhecimento técnico para parar de ser passageiro do próprio produto.

---

## Como usar com IA — o jeito certo

A forma mais eficaz de estudar este material é **transformar o seu modelo de IA num professor guiado**. Ele lê o repositório, monta um roteiro, e te conduz módulo por módulo — com exercício prático no final de cada um. Você só avança quando disser "próximo".

**Passo 1** — Baixe ou clone este repositório:
```bash
git clone https://github.com/felipeluissalgueiro/treinamentos-nocode.git
```

**Passo 2** — Abra o Claude Code (ou qualquer modelo) na pasta do repo e cole o prompt abaixo:

---

### Prompt de onboarding guiado

```
Você vai me ensinar o conteúdo deste repositório como um professor — não como um chatbot.

Antes de começar, leia estes arquivos para ancorar o tour no material real:
- README.md (este arquivo — visão geral do curso)
- live-01/README.md
- live-02/README.md
- recursos/curso/README.md

Regras do onboarding:
- UMA lição por mensagem. Não despeje tudo de uma vez.
- No fim de cada lição, dê um "experimente" — uma tarefa prática pequena que eu possa fazer agora.
- Espere eu dizer "próximo" antes de avançar para a próxima lição.
- Se eu fizer uma pergunta no meio, responda e pergunte se quero continuar ou voltar.
- Seja direto. Sem enrolação motivacional. Use exemplos de quem está construindo produto.
- Se eu me perder ou pedir pra voltar, volte sem problema.

Comece assim:
1. Me apresente o MAPA COMPLETO do onboarding (todas as lições que você vai cobrir, em ordem)
2. Na mesma mensagem, já entregue a Lição 1

Roteiro sugerido de lições (ajuste a ordem se fizer sentido pedagógico):

BLOCO 1 — Fundamentos de harness
  L1. O que é um harness e por que não é a mesma coisa que um chat com IA
  L2. As 3 camadas: CLAUDE.md (quem sou) + STATE.md (o que está acontecendo) + skills (o que sei fazer)
  L3. Squads — agentes especializados com escopo e memória próprios
  L4. Orquestradores vs workers — quem decide e quem executa
  L5. Hooks — o que roda automático sem você pedir
  L6. Multi-model — o modelo certo para cada tarefa (e o custo de errar)

BLOCO 2 — Construir sem ser passageiro
  L7. O custo de não entender o que roda — tokens, contexto, o caso dos $200 em 2h
  L8. Vendor lock-in e agnósticismo — o que acontece quando o modelo some
  L9. RFC — especificar antes de codar (a inversão do 80/20)
  L10. DRY — por que a IA repete código por padrão e como forçar fonte única
  L11. ETC — por que a IA acopla tudo e o que é "fácil de mudar"
  L12. Ortogonalidade — componentes independentes e quality gates que forçam isso

BLOCO 3 — Prática
  L13. Montar o primeiro CLAUDE.md do zero
  L14. Escrever sua primeira RFC para uma feature real do seu produto
  L15. Instalar as skills deste repositório e invocar a primeira

Tom: direto e prático, sem enrolação. Use caminhos de arquivo reais quando referenciar o material.
Se em algum momento eu disser em que tipo de produto estou trabalhando, adapte os exemplos para o meu contexto.
```

---

## O que tem aqui

```
treinamentos-nocode/
│
├── cadencia/             ← o produto por trás do curso
│
├── live-01/              ← harness de IA: CLAUDE.md, squads, hooks, HIVE
│   ├── README.md
│   └── skeleton.md       ← estrutura da aula para acompanhar ao vivo
│
├── live-02/              ← dono vs. passageiro: custo, RFC, DRY, quality gates
│   ├── README.md
│   ├── skeleton.md
│   ├── conteudo.md       ← conteúdo completo com diagramas para estudo
│   ├── canvas/           ← diagrama visual (abrir no Obsidian)
│   └── demos/            ← 4 scripts de demo para rodar com Claude Code
│
├── recursos/
│   ├── setup/            ← instalar Claude Code, OpenCode, FAQ de 21 perguntas
│   ├── templates/        ← CLAUDE.md, PRD.md, .gitignore, .env prontos para usar
│   ├── curso/            ← 60 aulas em 12 módulos (auto-estudo paralelo às lives)
│   ├── guias/            ← system design, harness, branches, MCP, agnósticismo
│   └── glossario-dev-design.md  ← ~930 termos dev e design
│
└── skills/               ← 37 skills para Claude Code (instalar uma vez, usar em todos os projetos)
    ├── install.ps1        ← Windows
    └── install.sh         ← Mac/Linux
```

---

## Instalar as skills

```powershell
# Windows
cd skills
.\install.ps1

# Mac/Linux
cd skills
chmod +x install.sh && ./install.sh
```

Reinicie o Claude Code. As skills ficam disponíveis em qualquer projeto a partir daí.

---

## Canvas (diagramas visuais)

Os arquivos `.canvas` dentro de `live-02/canvas/` funcionam no **Obsidian**.
Instale em obsidian.md, abra este repositório como vault e os diagramas abrem automaticamente.

---

## HIVE — leve o harness completo

Apresentado ao final da Live 01: versão open source do framework que a Cadencia usa internamente.
11 squads, memória estruturada, 9 hooks, skill `/hive-setup`.

```bash
git clone https://github.com/felipeluissalgueiro/hive
```

No Claude Code: `/hive-setup` → personalizado para o seu contexto em 10 minutos.

---

## Sobre Felipe Luis Salgueiro

Felipe Luis Salgueiro é fundador da [Cadencia](https://cadencia.app.br) e construtor de sistemas de IA aplicados a negócios reais. Passou 15 anos obcecado com a mesma pergunta — "como saber se o posicionamento de um profissional está funcionando?" — por agências digitais, gestão de 30 clientes simultâneos, e quase 100 clientes atendidos em 4 estados. Construiu o PD Framework para rodar sua própria empresa com IA como parceiro de operação. O que você aprende aqui é o que está em produção.

**→ Bio completa:** [cadencia.app.br/felipe-luis-salgueiro](https://cadencia.app.br/felipe-luis-salgueiro)

| Rede | Link |
|------|------|
| Instagram | [@felipeluissalgueiro](https://www.instagram.com/felipeluissalgueiro/) |
| LinkedIn | [felipe-luis-salgueiro](https://www.linkedin.com/in/felipe-luis-salgueiro) |
| YouTube | [@felipeluissalgueirolima](https://www.youtube.com/@felipeluissalgueirolima) |
| TikTok | [@felipeluissalgueiro](https://www.tiktok.com/@felipeluissalgueiro) |
| Threads | [@felipeluissalgueiro](https://www.threads.net/@felipeluissalgueiro) |
| Blog | [felipe-luis-salgueiro.cadencia.app.br](https://felipe-luis-salgueiro.cadencia.app.br) |
