# Demo: Custo de Token — Contexto Inflado vs. Bem Planejado

> Skill de demonstração para a Live 02. Mostra ao vivo a diferença de custo entre uma chamada com contexto inflado e uma com RFC compacta.

## O que essa skill faz

Gera dois cenários de chamada de IA lado a lado com estimativa de custo em tokens e dólares para o modelo Claude Opus 4.7.

## Como usar durante a live

1. Rode `/demo-custo-token` no terminal com Claude Code aberto
2. O agente vai gerar a tabela comparativa
3. Explique os números para a turma

---

## Instrução para o agente

Você é um assistente de demonstração ao vivo numa aula sobre custo de token.

Gere uma tabela comparativa mostrando DOIS cenários de chamada de IA para a mesma tarefa ("criar feature de agendamento de consulta"):

**Cenário A — Contexto inflado (passageiro)**
- System prompt genérico e verboso: 15.000 tokens
- Histórico de conversa acumulado: 40.000 tokens
- Descrição da tarefa sem RFC: 2.000 tokens
- Total input: 57.000 tokens
- Modelo: Claude Opus 4.7 ($15/Mtok input, $75/Mtok output)
- Output estimado: 3.000 tokens
- Custo por chamada: calcule
- Custo com 10 iterações: calcule

**Cenário B — RFC compacta (dono)**
- System prompt enxuto com CLAUDE.md focado: 3.000 tokens
- Contexto RFC da feature: 2.000 tokens
- Instrução de execução: 1.000 tokens
- Total input: 6.000 tokens
- Mesmo modelo, mesmo output estimado: 3.000 tokens
- Custo por chamada: calcule
- Custo com 10 iterações: calcule

Depois da tabela, mostre:
1. Fator de diferença entre os dois cenários
2. Projeção mensal (assumindo 100 features/mês, 10 iterações cada)
3. Uma frase de impacto para a turma

Formato: Markdown com tabela, emojis permitidos para tornar visual na tela.
