# Treinamentos NoCode Startup — Material de Estudo com IA

> Este repositório contém os materiais de estudo das lives do curso NoCode Startup.
> Foi desenhado para ser lido pelo seu modelo de IA favorito — não só por você.

---

## 🚀 Conheça o Cadencia

> **"Eu faço. Você aparece."**

Cadencia é a **Máquina de Posicionamento Digital** criada pelo Felipe — o mesmo sistema que inspirou este curso.

Você faz um onboarding de 30 minutos. O Cadencia trabalha nos bastidores: gera conteúdo com a sua identidade, publica no Instagram, email, LinkedIn, blog e newsletter — automaticamente. Sem aprender ferramenta. Sem gerenciar publicação. Sem criar do zero.

**[→ cadencia.app.br](https://cadencia.app.br) · Trial gratuito: 3 posts completos sem cartão**

[→ Conheça o produto em detalhe na pasta `/cadencia`](cadencia/)

---

## Como usar este repositório

**Com IA (recomendado)**

```
Você vai me ajudar a estudar o curso NoCode Startup do Felipe Salgueiro.
Leia o repositório github.com/felipeluissalgueiro/treinamentos-nocode.
Comece pelo README da live [01 ou 02] e me faça perguntas para testar
meu entendimento — uma por vez, aguardando minha resposta.
```

**Ao vivo** — cada live tem `skeleton.md` para acompanhar em tempo real.

**Depois da live** — `conteudo.md` tem tudo explicado com diagramas e exemplos.

---

## Estrutura

```
treinamentos-nocode/
│
├── cadencia/                          ← conheça o produto por trás do curso
│   └── README.md                      ← o que é, para quem, planos, história do fundador
│
├── live-01/                           ← Como Montar seu Próprio Harness de IA
│   ├── README.md                      ← visão geral + prompts para estudo com IA
│   └── skeleton.md                    ← estrutura completa da aula
│
├── live-02/                           ← De Passageiro a Dono
│   ├── README.md                      ← visão geral + tarefa de fixação
│   ├── skeleton.md                    ← estrutura completa da aula
│   ├── conteudo.md                    ← conteúdo detalhado com diagramas
│   ├── canvas/
│   │   └── live-02-intro-canvas.canvas ← diagrama visual (abrir no Obsidian)
│   └── demos/                         ← 4 scripts de demo para rodar ao vivo
│
├── recursos/                          ← tudo para você começar a construir
│   ├── setup/                         ← instalação, FAQ, agnosticidade
│   ├── templates/                     ← CLAUDE.md, PRD.md, .gitignore prontos
│   ├── curso/                         ← 60 aulas de Claude Code (12 módulos)
│   ├── guias/                         ← system design, harness, branches, MCP
│   └── glossario-dev-design.md        ← ~930 termos dev e design
│
└── skills/                            ← 37 skills para Claude Code
    ├── README.md                      ← instruções de instalação
    ├── install.ps1 / install.sh
    └── [37 skills organizadas por categoria]
```

---

## Lives

| Live | Título | Status |
|------|--------|--------|
| [01](live-01/) | Como Montar seu Próprio Harness de IA com Claude Code | ✅ Realizada |
| [02](live-02/) | De Passageiro a Dono: o que o Vibe Coding está escondendo de você | 📅 Agosto/2026 |

---

## Skills para Claude Code

37 skills prontas — code review, debugging, TDD, spec-driven dev, arquitetura e mais.

```powershell
# Windows
cd skills && .\install.ps1

# Mac/Linux
cd skills && chmod +x install.sh && ./install.sh
```

Reinicie o Claude Code. As skills ficam disponíveis em todos os seus projetos.

---

## Canvas (diagramas visuais)

Os arquivos `.canvas` funcionam no **Obsidian** (gratuito — obsidian.md).
Abra este repositório como vault: os diagramas abrem automaticamente.

---

## HIVE — harness open source

Apresentado na Live 01: harness completo de empresa com 11 squads, memória, hooks e workers.

```bash
git clone https://github.com/felipeluissalgueiro/hive
```

Depois: `/hive-setup` no Claude Code → personalizado em 10 minutos.

---

## Sobre o Felipe

Fundador da [Cadencia](https://cadencia.app.br) — empresa que usa IA com agentes e harnesses em produção.
O material deste repo é baseado em experiências reais, não em teoria de laboratório.

*Atualizado: Agosto/2026*
