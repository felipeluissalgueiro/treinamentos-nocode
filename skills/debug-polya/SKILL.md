---
name: debug-polya
description: Framework estruturado de debugging baseado nos 4 pilares de Pólya (How to Solve It). Ativar quando Felipe disser "/debug-polya", "debugar isso", "por que tá quebrando", "investiga esse bug", "o que tá causando isso", "não tá funcionando", "analisa esse erro". Força o agente a pensar metodicamente antes de sair mexendo em código.
---

# Debug Pólya — Resolução Estruturada de Bugs

Framework de debugging em 4 fases obrigatórias. Baseado em "How to Solve It" (George Pólya), adaptado para debugging de software.

**REGRA ABSOLUTA:** Nunca pular direto pra "tentar corrigir". O agente DEVE completar a compreensão antes de agir.

---

## Fluxo Principal

### Passo 0 — TRIAGEM AUTOMÁTICA

Ao receber o relato do problema, o agente DEVE:

1. Executar a Fase 1 (Compreensão) internamente
2. Com base na compreensão, **recomendar a severidade** ao Felipe:

```
🎯 TRIAGEM

[Resumo do problema em 1-2 linhas]

Severidade recomendada: [TRIVIAL / MÉDIO / CRÍTICO]
Justificativa: [por que essa classificação]

→ TRIVIAL: rodo as 4 fases em bloco único, resolvo direto
→ MÉDIO: mostro compreensão + hipóteses, você valida, depois resolvo
→ CRÍTICO: paro em cada fase pra você validar antes de eu avançar

Quer seguir com [recomendação] ou prefere outro modo?
```

3. **Aguardar confirmação do Felipe** antes de prosseguir

### Critérios de classificação

| Severidade | Quando | Exemplos |
|---|---|---|
| TRIVIAL | Causa provável é óbvia, impacto baixo, reversível | typo, import errado, variável undefined, config faltando |
| MÉDIO | Múltiplas causas possíveis, ou impacto moderado | bug de lógica, integração quebrando, comportamento inesperado |
| CRÍTICO | Prod afetada, dados em risco, receita impactada, ou causa desconhecida | prod down, dados corrompidos, cron silenciosamente quebrado, regressão pós-deploy |

---

## Fase 1 — COMPREENSÃO DO PROBLEMA

Antes de tocar em qualquer código, responder TODAS estas perguntas:

### Incógnita (o que estou procurando?)
- Qual é o comportamento esperado?
- Qual é o comportamento observado?
- Qual é o delta entre os dois?

### Dados disponíveis
- Qual é a mensagem de erro exata? (copiar verbatim, não parafrasear)
- Em que ambiente ocorre? (local, staging, prod, VPS, Vercel, Railway)
- É reproduzível? (sempre, intermitente, só em condição X)
- Quando começou? (após qual deploy, commit, ou mudança)
- Logs relevantes? (ler logs ANTES de teorizar)

### Condicionantes (as regras do jogo)
- Quais sistemas/serviços estão envolvidos? (DB, API, cron, frontend, infra)
- Há dependências externas que podem ter mudado? (API terceiros, DNS, SSL, pacotes)
- Há restrições de ambiente? (Windows vs Linux, versão Python, permissões)

### Formato de output
```
🔍 FASE 1 — COMPREENSÃO
Esperado: [X]
Observado: [Y]
Erro: [mensagem exata]
Ambiente: [onde]
Desde: [quando / desconhecido]
Reproduz: [sempre / intermitente / condição]
Sistemas envolvidos: [lista]
Dados faltando: [o que preciso perguntar ao Felipe, se algo]
```

---

## Fase 2 — PLANO DE INVESTIGAÇÃO

NÃO é o plano de correção. É o plano de DIAGNÓSTICO.

### Consulta obrigatória a incidentes
Antes de montar hipóteses, SEMPRE verificar:
- `Hub Projetos/Incidentes/INDEX.md` — filtrar por tags relevantes
- Se houver incidente relacionado: abrir o arquivo e aplicar a seção Prevenção

### Perguntas obrigatórias
- Já vi esse problema antes? (incidentes + git log)
- Conheço um problema similar que já foi resolvido?
- Se o problema é complexo demais, qual versão simplificada posso investigar primeiro?
- Quais hipóteses explicam o comportamento observado? (listar TODAS, não só a favorita)

### Construção do plano
1. Listar hipóteses em ordem de probabilidade (mais provável primeiro)
2. Para cada hipótese: definir o teste que a confirma ou descarta
3. Ordenar por custo: testes rápidos/baratos primeiro
4. Identificar o que NÃO mudar durante investigação

### Formato de output
```
🗺️ FASE 2 — PLANO DE INVESTIGAÇÃO

Incidentes relacionados: [nenhum / link pro incidente]

Hipóteses (ordem de probabilidade):
H1: [descrição] → Teste: [o que vou verificar]
H2: [descrição] → Teste: [o que vou verificar]
H3: [descrição] → Teste: [o que vou verificar]

Ordem de execução: H1 → H2 → H3
Restrição: não alterar código até confirmar causa raiz
```

---

## Fase 3 — EXECUÇÃO DO DIAGNÓSTICO

Executar o plano da Fase 2, verificando cada passo.

### Regras de execução
- **Um teste por vez.** Não rodar 5 coisas ao mesmo tempo.
- **Verificar cada passo.** "O resultado confirma ou descarta a hipótese?"
- **Registrar evidência.** Cada teste produz um resultado concreto (log, output, valor).
- **Não corrigir durante diagnóstico.** Primeiro entender, depois corrigir.
- **Se a hipótese 1 falhar, não insistir.** Ir pra hipótese 2.

### Anti-patterns proibidos
- ❌ Mudar código "pra ver se resolve" sem entender a causa
- ❌ Aplicar fix de Stack Overflow sem validar que o contexto é o mesmo
- ❌ Alterar múltiplas coisas ao mesmo tempo (impossível saber o que corrigiu)
- ❌ Ignorar a mensagem de erro e ir direto pro código
- ❌ Assumir que "deve ser X" sem evidência
- ❌ Teorizar sem ler logs primeiro

### Ao encontrar a causa raiz
- Descrever a causa com precisão (arquivo:linha, fluxo exato)
- Explicar POR QUE causa o comportamento observado (cadeia causal)
- Confirmar que a causa explica TODOS os sintomas, não só parte

### Formato de output
```
🔬 FASE 3 — DIAGNÓSTICO

Teste H1: [o que fiz] → Resultado: [confirmado/descartado]
  Evidência: [output/log/valor concreto]

Teste H2: [o que fiz] → Resultado: [confirmado/descartado]
  Evidência: [output/log/valor concreto]

✅ CAUSA RAIZ IDENTIFICADA:
[descrição precisa — arquivo:linha, fluxo, por que quebra]

Cadeia causal: [A] → [B] → [C] → [erro observado]
```

---

## Fase 4 — CORREÇÃO + RETROSPECTO

Só agora corrigir. E depois: revisar.

### Correção
1. Propor a correção mínima que resolve a causa raiz
2. Não aproveitar pra refatorar, melhorar, ou "limpar" código adjacente
3. Verificar que a correção não introduz regressão
4. Testar que o comportamento esperado (Fase 1) agora funciona

### Retrospecto (a fase que ninguém faz)
Responder obrigatoriamente:

- **Resultado verificado?** O comportamento esperado foi restaurado?
- **Caminho alternativo?** Havia outra forma de diagnosticar mais rápido?
- **Reutilizável?** Esse diagnóstico ou correção se aplica a outro lugar no sistema?
- **Prevenção:** O que impediria esse bug de acontecer de novo?
- **Registrar como incidente?** Se levou >30min ou impactou prod → `/registrar-incidente`

### Formato de output
```
🔧 FASE 4 — CORREÇÃO + RETROSPECTO

Correção aplicada:
  Arquivo: [path:linha]
  Mudança: [descrição concisa]

Verificação:
  [ ] Comportamento esperado restaurado
  [ ] Sem regressão identificada
  [ ] Testado em [ambiente]

Retrospecto:
  Tempo gasto: [estimativa]
  Poderia ter sido mais rápido se: [insight]
  Reutilizável em: [outro lugar / não aplicável]
  Prevenção: [o que fazer pra não repetir]
  Registrar incidente: [sim/não — justificativa]
```

---

## Comportamento por modo

### TRIVIAL
- Fases 1→2→3→4 em bloco único
- Output condensado (sem separação de fases, mas todas presentes)
- Resolve e apresenta resultado final

### MÉDIO
- Fase 1 + Fase 2 → **PARA** → apresenta ao Felipe
- Felipe valida hipóteses ou redireciona
- Fase 3 + Fase 4 → apresenta resultado

### CRÍTICO
- Fase 1 → **PARA** → Felipe valida compreensão
- Fase 2 → **PARA** → Felipe valida plano
- Fase 3 → **PARA** → Felipe valida causa raiz
- Fase 4 → apresenta correção + retrospecto
- `/registrar-incidente` obrigatório ao final

---

## Integração com outras skills

- Consultar incidentes: `Hub Projetos/Incidentes/INDEX.md` (obrigatório na Fase 2)
- Registrar incidente: `/registrar-incidente` (quando aplicável na Fase 4)
- Log da sessão: `/log-sessao` (se o debug foi significativo)
