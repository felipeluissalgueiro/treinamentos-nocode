# Live 02 — De Passageiro a Dono: o que o Vibe Coding está escondendo de você

**Duração:** 2 horas | **Formato:** Conceito + demo + construção guiada | **Data:** Agosto/2026

---

## Tema

**De Passageiro a Dono: o que o Vibe Coding está escondendo de você**

No-code foi a porta de entrada. Mas nos próximos 2 anos, quem continuar só delegando para a IA sem entender o que roda por baixo vai pagar caro — literalmente. Essa live não é sobre virar dev de carreira. É sobre parar de ser passageiro do próprio produto.

---

## Por que esse tema agora

Três sinais que já estão acontecendo:

1. **O custo da IA está subindo** — subscription vai morrer, token vai dominar. Quem não entende o que está rodando não sabe por que a conta chegou
2. **A IA quebra silenciosamente** — código que a IA gera funciona hoje e quebra na quinta sem você ter mudado nada. Sem entendimento técnico, você não sabe nem por onde começar a debugar
3. **A janela está fechando** — os builders que estão ganhando de verdade são os que combinam IA com fundamentos. Quem só vibecoda está construindo demo, não negócio

---

## O que o aluno vai aprender

1. Por que vibe coding é uma bomba relógio — de custo, de lock-in e de dívida técnica
2. Como a inversão de tempo mudou o desenvolvimento: 80% planejamento, 20% execução
3. O que é uma RFC e como ela substitui a revisão linha a linha do código gerado
4. Os três princípios que a IA quebra por padrão — e como forçá-la a respeitá-los
5. Como quality gates automatizam o que o code review humano não consegue cobrir
6. Qual é o piso mínimo de conhecimento técnico pra não ser passageiro do próprio produto

---

## O que o aluno será capaz de fazer depois dessa live

- **Identificar** quando a IA está gerando código acoplado, repetido ou sem componentização
- **Escrever uma RFC básica** antes de mandar um agente codar
- **Configurar um quality gate simples** que force a IA a modularizar
- **Nomear o próximo passo** — saber o que estudar e em que ordem para subir de nível

---

## Estrutura da Live (2h20)

---

### Intro — Ancoragem + tese (dono vs. passageiro) (10 min)

**O que acontece:** Felipe retoma em 1 minuto o conceito de harness da Live 01. Depois abre com uma pergunta pra sala e planta a tese — mas sem entregar ainda a resposta.

**Subtópicos:**

**I.1 — Retomada do harness (harness recap)**
- I.1.1 — O que é um harness: o sistema que opera por você
- I.1.2 — As 3 camadas: CLAUDE.md + STATE.md + skills
- I.1.3 — Onde chegamos na Live 01: esqueleto funcional

**I.2 — A pergunta que abre (sintoma + gancho)**
- I.2.1 — *"Quem aqui já teve código que funcionou na terça e quebrou na quinta sem você mudar nada?"*
- I.2.2 — Deixar o silêncio trabalhar
- I.2.3 — *"Hoje a gente vai entender por que isso acontece — e o que separa quem controla de quem é controlado"*

**I.3 — O eixo da aula (dono vs. passageiro)**
- I.3.1 — Passageiro: delega tudo, não entende o que roda, paga a conta sem saber por quê
- I.3.2 — Motorista de táxi: sabe dirigir, mas o carro não é dele
- I.3.3 — Dono: define pra onde vai, a IA dirige, entende o motor o suficiente pra saber quando ela está indo pro lugar errado

---

### Bloco 1 — O preço de não saber (custo de token) (25 min)

**O que acontece:** Felipe abre com um caso concreto de custo real e mostra que o problema não é a IA ser cara — é não entender o que está rodando.

**Subtópicos:**

**1.1 — O caso dos $200 em 2 horas (caso real + demo de custo)**
- 1.1.1 — O contexto: quem é o Luiz e o que ele estava fazendo
- 1.1.2 — O que aconteceu: Codex rodando livre sem controle, sem limite
- 1.1.3 — O que faltou: entender custo por chamada, quando parar, o que estava sendo gerado
- 1.1.4 — Demo ao vivo: diferença de custo entre chamada com contexto inflado vs. bem planejada
- 1.1.5 — A moral: *"Sem entendimento do que roda, você paga pra IA fazer errado"*

**1.2 — A tendência que ninguém quer ouvir (subscription → token)**
- 1.2.1 — Por que a subscription vai morrer: modelo não é sustentável pra quem usa pesado
- 1.2.2 — O que já é caro hoje: mostrar preço real de Opus vs Sonnet vs Haiku por chamada
- 1.2.3 — A trajetória: daqui a 2 anos vai ser mais caro ainda, não mais barato
- 1.2.4 — A vantagem de quem entende: controla custo, controla resultado

**1.3 — O que separa quem controla de quem é controlado (leitura crítica de código)**
- 1.3.1 — O que não é: saber escrever código na unha, ter formação em CC
- 1.3.2 — O que é: saber ler o que a IA escreveu e entender se está certo
- 1.3.3 — O que é: saber quando parar o agente antes de gastar mais do que deveria
- 1.3.4 — *"Você não precisa virar dev de carreira. Precisa parar de ser passageiro."*

---

### Bloco 2 — Entender os modelos e não ficar preso em nenhum deles (multi-model + agnósticismo) (25 min)

**O que acontece:** Felipe mostra que escolher modelo errado é dinheiro jogado fora — e que ficar preso num único modelo ou runtime é um risco real, não teórico. Usa o PD Framework como evidência ao vivo.

**Subtópicos:**

**2.1 — Cada modelo tem custo, contexto e força diferentes (custo por token + janela de contexto)**
- 2.1.1 — Janela de contexto: o que cabe numa chamada e o que transborda (e cobra extra)
- 2.1.2 — Custo por token: Opus vs. Sonnet vs. Haiku — o mesmo pedido pode custar 10x mais
- 2.1.3 — Força e fraqueza: modelo errado pra tarefa certa = resultado ruim + conta alta
- 2.1.4 — Estratégia multi-model: Claude pra arquitetura, menores pra tarefas específicas, local quando fizer sentido
- 2.1.5 — *"Barato que não funciona é o mais caro que existe — mas caro pra tarefa simples é dinheiro jogado fora"*

**2.2 — O risco que ninguém vê até ser tarde: vendor lock-in (lock-in + Fable 5 + Linux/Windows)**
- 2.2.1 — O que é lock-in: quando trocar de modelo ou tool vira reescrita
- 2.2.2 — Caso real: governo americano e o Fable 5 — modelo em produção ficou inacessível
- 2.2.3 — O que acontece com quem não preparou: reescrita de emergência, custo alto, janela fechada
- 2.2.4 — O problema de ambiente: Linux vs. Windows — comandos diferentes, encoding diferente, paths diferentes
- 2.2.5 — *"Se toda a sua infraestrutura depende de um modelo e ele muda de preço amanhã — o que acontece com o seu produto?"*

**2.3 — Como o PD Framework virou agnóstico: demo ao vivo (runtime contract + demo)**
- 2.3.1 — O contrato de runtime: 8 capacidades que qualquer runtime precisa implementar
- 2.3.2 — As 3 primitivas: Markdown como contexto, scripts Python no core, skills como diretório
- 2.3.3 — Demo: mesma sessão rodando em Claude Code e OpenCode — o framework não sabe quem executa
- 2.3.4 — A lição: *"Você não precisa de 3 frameworks diferentes. Precisa de 1 contrato que qualquer runtime implementa."*

---

### Bloco 3 — A inversão de tempo (RFC) (30 min)

**O que acontece:** Felipe apresenta o novo modelo mental de desenvolvimento com IA — e o artefato concreto que o viabiliza: a RFC.

**Subtópicos:**

**3.1 — O que mudou no desenvolvimento (inversão 80/20)**
- 3.1.1 — Como era antes: 80% codificando, 20% planejando — o tempo de codar forçava reflexão
- 3.1.2 — Como é agora: agentes rodam por horas gerando código que ninguém revisa
- 3.1.3 — A virada: *"O custo de codificar caiu. O custo de entender o que foi gerado subiu."*
- 3.1.4 — O novo modelo: 80% especificação, 20% execução

**3.2 — O que é uma RFC (RFC como artefato)**
- 3.2.1 — Origem do nome: Request for Comments — você propõe, pede revisão antes de executar
- 3.2.2 — O que é na prática: documento Markdown escrito antes de codar
- 3.2.3 — Campos mínimos: contexto, entradas/saídas, regras de negócio, validações
- 3.2.4 — Por que agnóstico a linguagem: DDD e padrões, não Python vs. TypeScript — mesma RFC gera em qualquer linguagem
- 3.2.5 — *"Sem RFC bem definida, o código que a IA gera pode violar sua arquitetura sem você perceber"*

**3.3 — Como usar a RFC com IA (RFC como system prompt + demo)**
- 3.3.1 — RFC como contexto do agente: substitui a supervisão linha a linha
- 3.3.2 — Revisar a RFC, não o código: a RFC é menor, mais legível, mais fácil de apontar erro
- 3.3.3 — Revisão colaborativa: colegas comentam na RFC antes de uma linha ser escrita
- 3.3.4 — Demo ao vivo: Felipe escreve uma RFC curta pra feature real e usa como contexto pra um agente

**3.4 — O Grill Me reverso (quality gate de entendimento)**
- 3.4.1 — O conceito: em vez de você revisar o código da IA, a IA te questiona sobre as decisões de domínio
- 3.4.2 — Exemplo de pergunta: *"Você tem uma cláusula if aqui — qual é a regra de negócio por trás?"*
- 3.4.3 — Por que isso é um quality gate: garante entendimento mútuo antes de gerar
- 3.4.4 — Como implementar: customizar um prompt/skill para a IA questionar antes de executar

---

### Bloco 4 — As regras que a IA quebra (DRY + ETC + Ortogonalidade + quality gates) (35 min)

**O que acontece:** Felipe apresenta os três princípios do Programador Pragmático que a IA viola por padrão — e mostra o mecanismo concreto pra forçá-la a respeitá-los.

**Subtópicos:**

**4.1 — DRY: a IA repete código por padrão (fonte única de verdade)**
- 4.1.1 — Definição real: todo conhecimento tem uma representação única e autoritativa no sistema
- 4.1.2 — O que não é: não é só sobre copy-paste de código
- 4.1.3 — O que é: regra de negócio escrita em 2 lugares que vão divergir — é questão de quando, não de se
- 4.1.4 — Demo: pedir pra IA criar uma feature, mostrar onde ela duplicou lógica ou configuração
- 4.1.5 — Como resolver: identificar a fonte única, gerar ou linkar — nunca copiar à mão

**4.2 — ETC: a IA acopla tudo (camada de abstração)**
- 4.2.1 — Definição: toda decisão de design se julga por — *"isso vai facilitar ou dificultar mudar depois?"*
- 4.2.2 — Como a IA viola: otimiza pro problema imediato, amarra o sistema a um modelo/path/config específica
- 4.2.3 — Exemplos reais: paths hardcoded, IDs de serviço como constante, decisão que vazou pra 10 lugares
- 4.2.4 — Como resolver: camada entre a decisão e quem a usa — env var, config, interface

**4.3 — Ortogonalidade: a IA não componentiza (componentização forçada)**
- 4.3.1 — Definição: componentes que não se afetam — mudar um não quebra o outro
- 4.3.2 — Como a IA viola: gera sistemas onde tudo depende de tudo — mais fácil resolver como bloco único
- 4.3.3 — Demo: pedir pra IA criar uma feature e mostrar o acoplamento que sai
- 4.3.4 — Como resolver: não pedir pra IA componentizar — forçar via quality gate

**4.4 — Quality gates: automatizar o que o code review não cobre (linter + limites de função)**
- 4.4.1 — O que é um linter e o que ele checa: linhas por função, linhas por arquivo, duplicação
- 4.4.2 — Como o gate funciona: código gerado ultrapassa o limite → gate bloqueia → IA refatora
- 4.4.3 — Skills atômicas: mesmo princípio aplicado aos agentes — skills <70-80 linhas, um agente por skill
- 4.4.4 — *"Você não pede pra IA escrever código limpo. Você configura o gate que impede o contrário."*

---

### Bloco 5 — O próximo degrau (piso mínimo) (15 min)

**O que acontece:** Felipe responde a pergunta que ficou no ar desde o início — qual é o piso mínimo pra não ser passageiro — e entrega um caminho concreto.

**Subtópicos:**

**5.1 — O piso mínimo (ordem de estudo)**
- 5.1.1 — O que não é o piso: saber escrever Python do zero, entender algoritmos, ter graduação em CC
- 5.1.2 — O que é o piso:
  - Ler código: entender o que a IA gerou o suficiente pra saber se está errado
  - Escrever RFCs: especificar antes de executar
  - Reconhecer as violações: DRY, ETC, Ortogonalidade como checklist de revisão
  - Configurar um gate básico: linter simples que bloqueia os piores casos
- 5.1.3 — Ordem de estudo sugerida: (1) lógica de programação básica → (2) como ler e entender código → (3) system design introdutório → (4) DRY/ETC/Ortogonalidade na prática

**5.2 — Encerramento (fechamento + prévia + Q&A)**
- 5.2.1 — Vibe coder vs. desenvolvedor pragmático com IA: lado a lado
- 5.2.2 — *"No-code foi a porta de entrada. O que vai determinar quem continua no mercado daqui a 2 anos não é saber mais ferramentas — é entender o que as ferramentas estão fazendo."*
- 5.2.3 — Prévia da próxima live
- 5.2.4 — Q&A aberto

---

## Resultado esperado ao final da live

O aluno sai com quatro coisas:

1. **Mental model claro** — entende por que vibe coding tem prazo de validade
2. **RFC** — sabe escrever uma especificação técnica antes de mandar um agente codar
3. **Critérios observáveis** — consegue identificar DRY, ETC e Ortogonalidade sendo violados
4. **Próximo passo concreto** — sabe o que estudar e em que ordem pra subir de nível
