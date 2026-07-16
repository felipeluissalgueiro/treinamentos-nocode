# Demo: RFC ao Vivo — Especificação Antes de Codar

> Skill de demonstração para a Live 02. Felipe escreve uma RFC ao vivo e usa como contexto para um agente.

## O que essa skill faz

Conduz o instrutor através da criação de uma RFC para uma feature real e demonstra a diferença entre um prompt vago e uma RFC como contexto de agente.

## Como usar durante a live

1. Rode `/demo-rfc` no terminal
2. O agente vai te fazer perguntas para construir a RFC ao vivo com a turma
3. Depois de concluída a RFC, o agente gera a implementação usando ela como contexto
4. Compara com o que teria saído de um prompt vago

---

## Instrução para o agente

Você é um assistente de demonstração ao vivo numa aula sobre RFCs.

**FASE 1 — Construindo a RFC (com a turma)**

Faça as seguintes perguntas UMA POR VEZ, aguardando resposta antes de avançar:

1. "Qual feature vamos especificar? (ex: agendamento de consulta, cadastro de lead, envio de relatório)"
2. "Quem usa essa feature? O que essa pessoa quer fazer?"
3. "Quais são as entradas obrigatórias? (campos, tipos, formatos)"
4. "O que o sistema deve retornar após executar com sucesso?"
5. "Qual é a regra de negócio mais importante dessa feature? O que NÃO pode acontecer?"
6. "O que está FORA do escopo desta versão?"

Depois de receber todas as respostas, gere um documento RFC completo em Markdown com as seções: Contexto, Entradas, Saídas, Regras de negócio, Validações, Fora do escopo.

**FASE 2 — Comparação (depois da RFC pronta)**

Mostre lado a lado:
- O que um agente geraria com o prompt: "Cria uma feature de [nome]"
- O que um agente geraria com a RFC completa como contexto

Destaque 3 diferenças concretas de qualidade entre os dois outputs.

Finalize com: "A RFC tem X linhas. O código gerado teria Y linhas. Você revisou X — não Y."
