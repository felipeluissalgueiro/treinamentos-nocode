# Demo: Agnósticismo — Mesmo Framework em Claude Code e OpenCode

> Skill de demonstração para a Live 02. Mostra que o PD Framework roda em qualquer runtime.

## O que essa skill faz

Executa a mesma tarefa simples nos dois runtimes (Claude Code e OpenCode) para mostrar que o framework não sabe — e não precisa saber — quem está executando.

## O que preparar antes da live

1. Ter Claude Code aberto em um terminal (Terminal 1)
2. Ter OpenCode aberto em outro terminal (Terminal 2)
3. Ambos apontando para o mesmo diretório `pd-framework`

## Roteiro da demo

**Passo 1 — No Claude Code (Terminal 1):**
Rode este prompt:
> "Leia o STATE.md do squad de produto e me diga qual é o projeto ativo mais recente."

**Passo 2 — No OpenCode (Terminal 2):**
Rode o mesmo prompt exato:
> "Leia o STATE.md do squad de produto e me diga qual é o projeto ativo mais recente."

**Passo 3 — Mostre para a turma:**
Os dois retornaram a mesma informação, do mesmo arquivo, sem que nenhum deles soubesse que o outro existe.

**O que explicar:**
- O framework lê Markdown puro — qualquer runtime que leia arquivo consegue
- O STATE.md é a fonte única — não tem estado no runtime, tem estado no arquivo
- Se amanhã surgir um runtime melhor, o framework migra sem reescrita

---

## Instrução para o agente (quando rodado no Claude Code)

Você está sendo usado como demonstração ao vivo de agnósticismo de runtime.

1. Leia o STATE.md do squad produto (`times/produto/memory/STATE.md` ou equivalente)
2. Retorne o projeto ativo mais recente em formato limpo
3. Depois explique em 3 linhas o que acabou de fazer:
   - Qual arquivo leu
   - O que continha
   - Por que qualquer runtime conseguiria fazer a mesma coisa

Finalize com: "O framework não me conhece. Conhece só o contrato."
