# PRD — <Nome do Projeto>

> Product Requirements Document. **O que** construir e **por quê**, antes de codar.
> Dica: peça ao Claude pra te entrevistar — "me faça uma pergunta por vez pra montar este PRD".

---

## 1. Problema

<Qual dor, de quem. 2-3 frases. Se você não consegue descrever em 3 frases, você ainda não entendeu o problema.>

## 2. Objetivo + métrica de sucesso

<O que o sistema entrega e como você sabe que funcionou — número/critério objetivo.>

**Exemplo de métricas:**
- "Agente responde lead em < 1min sem intervenção humana — 90% dos casos"
- "Pipeline processa 100 docs/dia sem erro"
- "Tempo de geração de relatório cai de 2h pra 5min"

## 3. Escopo

**Dentro (faz):**
- <item 1>
- <item 2>

**Fora (NÃO faz agora — guardrail contra escopo crescer):**
- <item que parece útil mas vai esperar>
- <feature que vai pra v2>

## 4. Usuários e casos de uso

**Quem usa:** <persona — não inventa, descreve real>

**Fluxo principal (caso feliz):**
1. <passo>
2. <passo>
3. <resultado>

## 5. Requisitos funcionais

<O que o sistema faz. Lista de bullets, cada um testável.>

- [ ] <funcionalidade 1>
- [ ] <funcionalidade 2>

## 6. Requisitos não-funcionais

| Categoria | Requisito |
|---|---|
| Performance | <ex: resposta em < 3s p95> |
| Segurança | <ex: API key nunca exposta no frontend> |
| Custo | <ex: < R$ 50/mês de API> |
| Disponibilidade | <ex: 99% — pode cair manutenção planejada> |

## 7. Riscos e dependências

| Risco/Dependência | Probabilidade | Mitigação |
|---|---|---|
| <ex: cliente não dá acesso à API X até S2> | Alta | <ex: bloqueio explícito no contrato> |
| <ex: rate limit da OpenAI atrapalha pico> | Média | <ex: fila com Redis + retry> |

## 8. Stack escolhida

<Tecnologias que vão entrar. Não o "stack ideal" — o que VOCÊ vai usar.>

- Backend: <linguagem + framework>
- Frontend: <framework ou "sem frontend">
- DB: <Postgres | SQLite | Supabase>
- LLM: <Claude | GPT | misto>
- Deploy: <Vercel | Railway | VPS>

## 9. Fases (ordem de construção)

> Comece pela **fatia vertical mínima** que prova que funciona ponta-a-ponta.

1. **Fase 1 (S1):** <ex: setup + 1 endpoint dummy respondendo>
2. **Fase 2 (S2):** <ex: pipeline LLM funcionando local>
3. **Fase 3 (S3):** <ex: integração com X + 1 caso real rodando>
4. **Fase 4 (S4):** <ex: deploy + 1 cliente usando>

## 10. Critério de aceite

<Como você prova ao seu cliente (ou a si mesmo) que está pronto. Demonstrável.>

---

## Decisões arquiteturais já tomadas

> Para cada decisão importante, registre aqui (ou em `decisions.md`):

- **<Decisão 1>** — <por quê>
- **<Decisão 2>** — <por quê>
