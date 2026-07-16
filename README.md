# Treinamentos NoCode Startup — Material de Estudo com IA

> Este repositório contém os materiais de estudo das lives do curso NoCode Startup.
> Foi desenhado para ser lido pelo seu modelo de IA favorito — não só por você.

---

## Como usar este repositório

**Opção 1 — Estudar com IA (recomendado)**

Cole este prompt no seu modelo de IA (Claude, ChatGPT, Gemini, etc.):

```
Você vai me ajudar a estudar o conteúdo do curso NoCode Startup.
Leia o repositório treinamentos-nocode do Felipe Salgueiro no GitHub.
Comece pelo README principal, depois pelo README da live que quero estudar.
Me faça perguntas para testar meu entendimento — uma por vez.
```

**Opção 2 — Acompanhar ao vivo**

Cada live tem um `skeleton.md` com a estrutura completa — use durante a aula para saber onde estamos.

**Opção 3 — Estudar depois**

O arquivo `conteudo.md` de cada live tem todos os conceitos explicados em detalhe, com diagramas e exemplos.

---

## Estrutura

```
treinamentos-nocode/
├── README.md                          ← você está aqui
│
├── live-01/                           ← Como Montar seu Próprio Harness de IA
│   ├── README.md                      ← visão geral + como estudar
│   └── skeleton.md                    ← estrutura completa da aula
│
├── live-02/                           ← De Passageiro a Dono
│   ├── README.md                      ← visão geral + tarefa de fixação
│   ├── skeleton.md                    ← estrutura completa da aula
│   ├── conteudo.md                    ← conteúdo detalhado para estudo
│   ├── canvas/
│   │   └── live-02-intro-canvas.canvas ← diagrama visual (abrir no Obsidian)
│   └── demos/                         ← scripts das demos ao vivo
│       ├── demo-custo-token.md
│       ├── demo-rfc.md
│       ├── demo-dry-violation.md
│       └── demo-agnosticismo.md
│
├── recursos/                          ← materiais de referência
│   ├── README.md                      ← como usar os recursos
│   └── glossario-dev-design.md        ← ~930 termos dev e design
│
└── skills/                            ← 37 skills para Claude Code
    ├── README.md                      ← instruções de instalação
    ├── install.ps1                    ← instalar no Windows
    ├── install.sh                     ← instalar no Mac/Linux
    └── [37 skills organizadas por categoria]
```

---

## Lives

| Live | Título | Status |
|------|--------|--------|
| [01](live-01/) | Como Montar seu Próprio Harness de IA com Claude Code | ✅ Realizada |
| [02](live-02/) | De Passageiro a Dono: o que o Vibe Coding está escondendo de você | 📅 Agosto/2026 |

---

## Skills incluídas

37 skills prontas para instalar no Claude Code — code review, debugging, TDD, spec-driven dev, arquitetura e mais.

**Instalar no Windows:**
```powershell
cd skills
.\install.ps1
```

**Instalar no Mac/Linux:**
```bash
cd skills
chmod +x install.sh && ./install.sh
```

Após instalar, reinicie o Claude Code. As skills ficam disponíveis em todos os seus projetos.

---

## Canvas (diagramas visuais)

Os arquivos `.canvas` funcionam no **Obsidian** (gratuito). Para abrir:
1. Instale o Obsidian: https://obsidian.md
2. Abra este repositório como vault no Obsidian
3. Navegue até o arquivo `.canvas` — o diagrama abre automaticamente

---

## Sobre o curso

**Felipe Salgueiro** é fundador da Cadencia — empresa que usa IA com agentes e harnesses em produção.
O material deste repo é baseado em experiências reais, não em teoria de laboratório.

**HIVE** — o harness open source apresentado na Live 01:
- Repo: https://github.com/felipeluissalgueiro/hive
- 11 squads, memória estruturada, 9 hooks, skill `/hive-setup`
- `git clone` + `/hive-setup` → personalizado em 10 minutos

---

*Atualizado: Agosto/2026*
