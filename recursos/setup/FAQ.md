# FAQ — Imersão Claude Code 30d

> Perguntas que todo aluno faz no início. Leia antes de mandar mensagem no WhatsApp — provavelmente está aqui.

---

## Sobre o treinamento

### 1. Quanto eu preciso saber de programação?

Zero pré-requisito de programação. **Pré-requisito é saber usar PC** — abrir terminal, instalar programa, seguir tutorial.

Você não vai virar dev. Você vai virar **construtor** — alguém que dirige o agente IA pra construir o que precisa.

Quem entrega valor maior nos 30 dias: pessoa com 0 programação mas que segue instrução à risca > dev sênior que acha que já sabe e ignora os fundamentos.

### 2. E se eu travar fora dos encontros?

WhatsApp direto comigo, **SLA 24h úteis** (não é plantão).

Como mandar mensagem que VAI ser respondida rápido:
- ✅ Print da tela mostrando o erro
- ✅ Copia o traceback completo (do `Error` até a última linha)
- ✅ Diz o que você tentou
- ❌ "Tá dando erro" (sem print) → vou pedir print, perde 1 dia
- ❌ Áudio de 5min sem contexto → escrever leva 30s e responde mais rápido

### 3. Vou conseguir terminar em 30 dias?

Depende do que você considera "terminar". Realista:

- ✅ Você TERÁ: ambiente configurado, projeto-âncora rodando local, deploy em produção, ≥ 1 integração externa funcionando, autonomia pra evoluir
- ❌ Você NÃO TERÁ: produto perfeito, escalável pra 100k usuários, livre de bug

O 30d é pra você ter **base sólida + 1 MVP no ar**. Não é pra ter empresa pronta. A escala vem depois.

### 4. E se eu pegar mais tempo do que 30 dias?

Acontece com ~30% dos alunos. Razões comuns:
- Caso-base é mais complexo do que parecia
- Aluno não conseguiu dedicar as 6-8h/semana esperadas
- Acesso ao sistema do cliente atrasou (S3 fica bloqueado)

**Não é problema.** Suporte WhatsApp dura 30 dias a partir da S1 e estende caso a caso. Combinamos se ficar fora do prazo original.

### 5. Posso usar o que aprender pra construir produto comercial?

Sim, é literalmente o objetivo. Tudo que está no kit é seu — copie, adapte, venda. **Não há royalty, não há licença.** Use à vontade.

Único pedido: se for falar do treinamento publicamente (post, vídeo), me marca pra eu ver.

---

## Sobre Claude Code / OpenCode

### 6. Claude Code é grátis?

Não. Você precisa de **Claude Pro ($20/mês)** ou **API com créditos pré-pagos** (Console Anthropic, mínimo $5).

Pra esse treinamento, recomendado: **Pro $20/mês**. Cobre todo o uso esperado dos 30 dias sem surpresa de fatura.

### 7. Posso usar com modelo barato (GPT, Gemini, Qwen)?

Pode — usando **OpenCode** (alternativa open-source). Mesmo conceito, qualquer modelo via OpenRouter ou Ollama local.

Recomendação honesta: **comece com Claude.** Modelo barato no início aumenta tempo de debug porque a IA inventa coisa. Quando você já souber o que tá fazendo, troca pra modelo barato em workers que rodam em escala.

### 8. Qual a diferença entre Claude Code e OpenCode?

| | Claude Code | OpenCode |
|---|---|---|
| Quem fez | Anthropic (oficial) | Open-source |
| Modelos | Só Claude (Sonnet, Opus, Haiku) | Qualquer (Anthropic, OpenAI, Gemini, Ollama, OpenRouter) |
| Arquivo de contexto | `CLAUDE.md` | `AGENTS.md` |
| Skills | `~/.claude/skills/` | `~/.config/opencode/skills/` |
| Config | `~/.claude/settings.json` | `opencode.json` |

**Boa notícia:** kit do treinamento é **agnóstico** — funciona nos dois. Ver `AGNOSTICIDADE.md`.

### 9. Vou precisar pagar OpenAI/Gemini também?

Provavelmente **um pouco**. Caso de uso comum:

- Claude: construção principal
- GPT: code review automatizado (Codex CLI) ou tarefas específicas
- Gemini: análise de imagem/PDF (se aplicável)

Custo combinado típico: **$30-50/mês total** durante o treinamento.

---

## Sobre custo

### 10. Quanto vou gastar nos 30 dias?

| Item | Mínimo | Médio | Folgado |
|---|---|---|---|
| Claude Pro | $20 | $20 | $20 |
| API extra (OpenAI/Gemini) | $0 | $10 | $30 |
| Vercel | $0 (free) | $0 | $20 (Pro) |
| Railway | $5 | $10 | $20 |
| Supabase | $0 (free) | $0 | $25 |
| Domínio (opcional) | $0 | $10 | $15 |
| **Total/mês** | **$25** | **$50** | **$130** |

**Em real:** R$ 130-650/mês. Considera essa faixa.

### 11. Como reduzir custo?

- Use OpenCode com Ollama local (modelo roda no seu PC, $0 por execução — mas precisa GPU decente)
- OpenRouter com Qwen ou GLM em workers (1/10 do custo do Claude)
- Cache agressivo pra leitura
- Vercel + Railway free tier no início — paga só quando passar limite

### 12. Cliente pagou pelo MVP — quanto cobro?

Não é meu papel definir, mas referência:
- MVP simples (1 agente, 1 integração): **R$ 5-15k**
- MVP médio (3-4 fluxos, 2-3 integrações): **R$ 15-40k**
- Recorrência mensal de operação: **R$ 1-5k/mês**

Cobre **pelo valor que entrega** (horas economizadas, leads gerados), não pelas horas suas.

---

## Sobre o kit

### 13. Posso modificar arquivos do kit?

Sim, o kit é seu. Mas **boa prática:**
- Modifique livremente pasta `<projeto>/` (seu MVP)
- No kit em si, prefira **adicionar** (novos arquivos) a **alterar** (arquivos existentes) — evita conflito quando eu publicar versão nova
- Se quer modificar arquivo do kit, faz uma cópia em `<aluno>/customizado/` antes

### 14. Como recebo atualizações do kit?

```bash
cd <seu-kit>
git pull
```

Toda vez que eu publicar material novo (skill, guia, biblioteca), você baixa com 1 comando. Vou avisar no WhatsApp quando tiver novidade.

### 15. Quando vou usar a pasta `hive/`?

Provavelmente **nunca nos 30 dias**. Ver `hive/README.md` — pasta reservada pra escalar depois.

### 16. Posso compartilhar o kit com colega?

Não. Repo é privado, vinculado ao seu treinamento. Se seu colega quer aprender, ele faz o treinamento.

---

## Sobre o projeto-âncora

### 17. E se meu cliente desistir no meio?

Não é fim do mundo. Opções:
- Continua o MVP como portfólio (vai te ajudar a fechar próximo cliente)
- Troca pra outro caso-base (segundo cliente, ou caso interno seu)
- Adapta pra produto próprio (SaaS)

**Combine comigo antes da S2** — fica caro mudar depois.

### 18. E se eu não tiver cliente?

Pode usar caso interno (sua própria operação) ou problema seu pessoal. Funciona igual didaticamente.

Aviso: **alunos com caso real entregam mais e aprendem mais.** Ter cliente "pressionando" gera o tipo de fricção que ensina.

### 19. Posso mudar o projeto-âncora durante os 30 dias?

S1: ok, ainda dá tempo.
S2 em diante: **não recomendo**. Custa retrabalho que come o prazo. Se for crítico, conversamos.

---

## Outras dúvidas

### 20. Onde mando dúvida que não está aqui?

WhatsApp. Mas antes:
1. Verifica se está em `guias/` ou `biblioteca/` no kit
2. Pergunta pro Claude Code (`/help`)
3. Busca no Google "claude code <sua dúvida>"

Aluno que pergunta sem buscar primeiro gasta o SLA dele em coisa que estava a 1 search de distância.

### 21. Como avaliar se estou no ritmo certo?

Cada sessão tem checklist de saída no `templates/issues/s1-4.md`. Ao fim de cada semana:
- Cheguei nos 5-6 checkboxes da sessão? → estou no ritmo
- Cheguei em 2-3? → preciso dedicar mais horas
- Não cheguei em nenhum? → travou em alguma coisa, vamos conversar

Não fica acumulando débito 2 semanas sem avisar.
