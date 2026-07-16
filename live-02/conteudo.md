# Live 02 — Conteúdo Detalhado
## De Passageiro a Dono: o que o Vibe Coding está escondendo de você

> Este arquivo é a versão de estudo da Live 02. Cada tópico e subtópico está explicado em detalhe para que qualquer pessoa possa ler, entender e aplicar os conceitos sem ter assistido à aula ao vivo.

---

## Intro — Ancoragem + tese (dono vs. passageiro)

### I.1 — Retomada do harness

**I.1.1 — O que é um harness**

Um harness é o sistema que opera por você — uma infraestrutura de IA que recebe instruções, sabe como agir, e entrega resultado sem que você precise estar presente em cada passo. É como montar uma equipe que já sabe o que fazer quando o chefe sai da sala.

No contexto do desenvolvimento com IA, um harness não é um único prompt ou uma ferramenta isolada. É uma arquitetura: conjunto de regras, memória, e capacidades que transformam um modelo de linguagem genérico em um agente especializado no seu negócio.

**I.1.2 — As 3 camadas: CLAUDE.md + STATE.md + skills**

```
┌─────────────────────────────────────────────┐
│             HARNESS DE IA                   │
│                                             │
│  CLAUDE.md  ──►  Quem sou eu e como opero  │
│  STATE.md   ──►  O que está acontecendo     │
│  skills/    ──►  O que sei fazer            │
└─────────────────────────────────────────────┘
```

- **CLAUDE.md**: Define identidade, regras absolutas, tom, como o agente deve se comportar. É o "manual de operação" do agente.
- **STATE.md**: Memória operacional viva — projetos ativos, decisões tomadas, contexto corrente. Atualizado continuamente.
- **skills/**: Capacidades atômicas e reutilizáveis. Cada skill é um comportamento específico que o agente pode executar.

**I.1.3 — Onde chegamos na Live 01**

Na Live 01 construímos o esqueleto de um harness funcional: criamos um CLAUDE.md com identidade, um STATE.md com contexto inicial, e uma skill básica. O aluno saiu com um agente que "sabe quem é" e "sabe o que está fazendo". Hoje vamos entender por que isso é apenas o começo — e o que acontece quando você não entende o que roda por baixo desse sistema.

---

### I.2 — A pergunta que abre

**I.2.1 — "Quem aqui já teve código que funcionou na terça e quebrou na quinta sem você mudar nada?"**

Essa pergunta não é retórica. Ela aponta para um dos fenômenos mais comuns — e mais perturbadores — do desenvolvimento com IA: o **breaking silencioso**.

Quando você delega código para um agente de IA sem entender o que ele gerou, está aceitando uma caixa preta. E caixas pretas quebram. O modelo que alimenta o agente pode ter sido atualizado. A dependência que o código usa pode ter mudado de comportamento. A API externa pode ter alterado seu contrato. Sem entendimento técnico mínimo, você não sabe nem por onde começar a investigar.

**I.2.2 — Deixar o silêncio trabalhar**

A pausa depois da pergunta é intencional. Quando alguém responde com "sim, aconteceu comigo", a sala inteira reconhece o problema como real — não como teoria. Isso quebra a postura defensiva de quem acredita que "só precisa de boas ferramentas".

**I.2.3 — "Hoje a gente vai entender por que isso acontece"**

A aula não é sobre assustar — é sobre equipar. O aluno vai sair entendendo o mecanismo do problema e com ferramentas concretas para não ser pego de surpresa.

---

### I.3 — O eixo da aula: dono vs. passageiro

Este é o eixo central que atravessa toda a Live 02. Não é sobre virar desenvolvedor de carreira. É sobre entender em qual posição você está em relação ao seu próprio produto.

```
PASSAGEIRO           MOTORISTA DE TÁXI         DONO
─────────────────────────────────────────────────────
Delega tudo          Sabe dirigir              Define o destino
Não entende          Mas o carro               A IA dirige
o que roda           não é dele                Entende o motor
Paga a conta                                   o suficiente
sem saber por quê                              para saber quando
                                               está indo errado
```

**I.3.1 — Passageiro**

O passageiro delega 100% para a IA. Ele diz "cria um sistema de agendamento" e aceita o que vier. Não sabe quais dependências foram instaladas, quais modelos estão sendo chamados, quanto cada chamada custa, nem o que acontece quando algo quebra. Se a conta chegar alta, ele não sabe por quê. Se o código parar de funcionar, ele não sabe por onde debugar.

**I.3.2 — Motorista de táxi**

O dev tradicional sabe escrever código na unha. Conhece algoritmos, estruturas de dados, padrões de projeto. Mas num mundo onde a IA gera 10x mais código por hora, ele ainda está competindo no terreno errado — velocidade de digitação, não capacidade de orquestração.

**I.3.3 — Dono**

O dono define o destino. Ele não precisa saber dirigir para ser dono do carro — mas precisa entender o suficiente para saber se o motorista está indo para o lugar certo. No contexto da IA: ele sabe ler o código gerado, identificar quando a IA violou uma regra de negócio, calcular o custo de uma decisão de arquitetura, e intervir antes que o problema vire dívida técnica irreversível.

---

## Bloco 1 — O preço de não saber (custo de token)

### 1.1 — O caso dos $200 em 2 horas

**1.1.1 — O contexto: quem é o Luiz e o que ele estava fazendo**

Luiz é um builder entusiasmado. Descobriu o Codex — sistema de agentes autônomos da OpenAI que pode rodar tarefas por horas sem supervisão humana. Ficou empolgado com a possibilidade de "deixar a IA trabalhar enquanto eu durmo" e ativou o agente numa tarde.

**1.1.2 — O que aconteceu: Codex rodando livre sem controle**

O agente rodou por cerca de 2 horas gerando código, fazendo chamadas de API, consumindo tokens. Sem limite de budget configurado, sem monitoramento de custo, sem ponto de parada definido. Quando Luiz verificou a conta, tinha $200 de custo gerado — por código que ele não revisou, que resolveu (ou não) o problema que ele queria, e que agora está num repositório que ele não entende completamente.

**1.1.3 — O que faltou: entendimento do que estava sendo gerado**

Três coisas simples teriam evitado o problema:
1. **Entender custo por chamada**: saber que Opus custa ~$15/Mtok de input e que um agente em loop pode consumir centenas de milhares de tokens por hora
2. **Configurar budget cap**: definir limite máximo antes de ativar o agente
3. **Revisar o plano antes de executar**: entender o que o agente vai fazer antes de deixar rodar

**1.1.4 — Demo ao vivo: contexto inflado vs. bem planejado**

```
CHAMADA COM CONTEXTO INFLADO
─────────────────────────────
System prompt:  15.000 tokens
Histórico:      40.000 tokens
Tarefa:          2.000 tokens
────────────────────────────
Total input:    57.000 tokens
Custo (Opus):  ~$0,86 por chamada
10 iterações:  ~$8,60

CHAMADA BEM PLANEJADA
─────────────────────────────
System prompt:   3.000 tokens (enxuto)
Contexto RFC:    2.000 tokens (só o necessário)
Tarefa:          1.000 tokens
────────────────────────────
Total input:     6.000 tokens
Custo (Opus):   ~$0,09 por chamada
10 iterações:   ~$0,90
```

**Diferença: 9,5x no mesmo resultado.** Quem não entende contexto paga quase 10x mais pela mesma tarefa.

**1.1.5 — A moral**

*"Sem entendimento do que roda, você paga pra IA fazer errado."* O problema não é a IA ser cara. É não saber o que está sendo executado, em qual escala, com qual contexto.

---

### 1.2 — A tendência que ninguém quer ouvir: subscription → token

**1.2.1 — Por que a subscription vai morrer**

O modelo de $20/mês para uso ilimitado não é sustentável para quem usa IA de forma intensiva. As empresas de IA estão subsidiando o acesso hoje para ganhar usuários — mas o modelo econômico real é por token. Quando a escala aumentar e a competição se estabilizar, o modelo por token vai dominar.

**1.2.2 — O que já é caro hoje**

| Modelo | Input (por Mtok) | Output (por Mtok) |
|--------|-----------------|-------------------|
| Claude Opus 4.7 | ~$15 | ~$75 |
| Claude Sonnet 4.6 | ~$3 | ~$15 |
| Claude Haiku 4.5 | ~$0,80 | ~$4 |

Uma mesma tarefa pode custar 18x mais num Opus do que num Haiku. Quem não sabe diferenciar quando usar cada modelo está literalmente jogando dinheiro fora.

**1.2.3 — A trajetória: vai ficar mais caro, não mais barato**

Enquanto os modelos de linguagem ficam mais capazes, o uso tende a escalar junto. Quem constrói produtos em cima de IA sem entender o modelo de custo está construindo sobre areia.

**1.2.4 — A vantagem de quem entende**

Quem entende custo por token pode:
- Escolher o modelo certo para cada tarefa
- Dimensionar o contexto antes de executar
- Configurar budget caps nos agentes
- Auditar gastos e identificar onde o custo está indo

---

### 1.3 — O que separa quem controla de quem é controlado

**1.3.1 — O que não é leitura crítica de código**

Não é saber escrever Python do zero. Não é entender algoritmos de ordenação. Não é ter formação em Ciência da Computação. Você não precisa de nenhum desses para parar de ser passageiro.

**1.3.2 — O que é: saber ler o que a IA escreveu**

Leitura crítica é conseguir responder perguntas sobre o código gerado:
- Essa função faz o que eu pedi?
- Ela usa alguma dependência externa que eu não conheço?
- Ela vai chamar uma API externa? Com qual frequência?
- O que acontece se ela falhar?

Você não precisa escrever esse código. Precisa entender o suficiente para saber se ele está certo.

**1.3.3 — O que é: saber quando parar o agente**

Se você ativou um agente e ele está iterando há 20 minutos sem parecer convergir para uma solução, você deve saber parar. Isso exige entender o que o agente está tentando fazer e reconhecer quando ele está em loop.

**1.3.4 — Conclusão do bloco**

*"Você não precisa virar dev de carreira. Precisa parar de ser passageiro."* O piso mínimo não é alto — mas é real. E quem não sobe esse degrau vai pagar pelo privilégio de ignorá-lo.

---

## Bloco 2 — Entender os modelos e não ficar preso em nenhum deles

### 2.1 — Cada modelo tem custo, contexto e força diferentes

**2.1.1 — Janela de contexto: o que cabe numa chamada**

Cada modelo tem um limite máximo de tokens que consegue processar numa única chamada — a "janela de contexto". Tudo que entra nessa janela (instruções, histórico, documentos, exemplos) é cobrado como input.

```
JANELA DE CONTEXTO
─────────────────────────────────────────
│ System prompt │ Histórico │ Tarefa atual │
└───────────────────────────────────────┘
        ↑
   Tudo isso é cobrado como input
```

Quando o contexto transborda, o modelo começa a "esquecer" o que veio antes — e você paga pelo esquecimento.

**2.1.2 — Custo por token: o mesmo pedido pode custar 10x mais**

Rodar uma tarefa de arquitetura complexa no Haiku vai gerar resultado inferior — mas rodar uma tarefa simples de formatação no Opus é desperdício puro. A estratégia vencedora é **multi-model**: modelo certo para cada tipo de tarefa.

**2.1.3 — Força e fraqueza por modelo**

| Uso | Modelo ideal |
|-----|-------------|
| Arquitetura, decisão complexa | Opus |
| Código, debug, análise | Sonnet |
| Tarefas mecânicas, classificação, formatação | Haiku |
| Código privado, custo zero | Local (Ollama) |

**2.1.4 — Estratégia multi-model na prática**

Em vez de um modelo fazendo tudo, o harness usa o modelo certo para cada etapa:
- Vitor (Tech Lead) roda em Opus para decisões de arquitetura
- Amélia (Dev Sênior) roda em Sonnet para implementação
- Rafael (Social Media) roda em Haiku para geração de variações de copy

**2.1.5 — A equação do custo**

*"Barato que não funciona é o mais caro que existe — mas caro para tarefa simples é dinheiro jogado fora."*

---

### 2.2 — O risco que ninguém vê até ser tarde: vendor lock-in

**2.2.1 — O que é lock-in**

Lock-in acontece quando toda a sua infraestrutura depende de uma escolha específica — modelo, plataforma, runtime — e trocar essa escolha exigiria reescrever tudo. Não é uma possibilidade teórica. É uma armadilha que fecha devagar e aparece de uma vez.

**2.2.2 — Caso real: governo americano e o Fable 5**

O governo americano proibiu o uso de modelos de IA desenvolvidos por certas empresas. Produtos que tinham toda sua inteligência integrada diretamente a um único modelo específico tiveram que fazer reescrita de emergência — ou simplesmente pararam de funcionar para clientes governamentais. O contrato estava feito, o produto estava em produção, e a infraestrutura não tinha sido construída para trocar de modelo.

**2.2.3 — O que acontece com quem não preparou**

- Reescrita de emergência (alto custo, baixa qualidade)
- Janela de atendimento fechada enquanto o produto está quebrado
- Clientes perdidos para concorrentes que estavam preparados

**2.2.4 — O problema de ambiente: Linux vs. Windows**

Lock-in não é só de modelo — é de ambiente. Código que roda em Linux pode falhar em Windows por diferenças de:
- Comandos de shell (bash vs. PowerShell)
- Encoding de arquivos (UTF-8 sem BOM vs. UTF-8 com BOM)
- Separadores de path (`/` vs. `\`)
- Disponibilidade de ferramentas do sistema

Um produto construído assumindo um ambiente específico é um produto frágil.

**2.2.5 — A pergunta que todo builder deveria fazer**

*"Se o modelo que você usa hoje ficar caro amanhã ou for descontinuado — o que acontece com o seu produto?"*

Se a resposta for "teria que reescrever tudo" — você tem um problema de arquitetura, não de tecnologia.

---

### 2.3 — Como o PD Framework virou agnóstico: demo ao vivo

**2.3.1 — O contrato de runtime: 8 capacidades**

Em vez de integrar com um runtime específico, o PD Framework define um **contrato de capacidades** — uma lista do que qualquer runtime precisa saber fazer para rodar o framework. Se o runtime implementa o contrato, o framework funciona nele.

```
CONTRATO DE RUNTIME (C1-C8)
────────────────────────────
C1  protect_main       Nunca escrever direto na main
C2  read_context       Ler arquivos de contexto (CLAUDE.md, STATE.md)
C3  open_session       Abrir branch de sessão antes de escrever
C4  execute_skills     Executar skills como comandos
C5  record_memory      Registrar decisões e memória
C6  close_session      Mergear e encerrar sessão
C7  notify             Enviar notificações (WhatsApp, etc.)
C8  audit              Registrar o que foi feito e por quê
```

Qualquer runtime que implementa esses 8 contratos pode rodar o PD Framework — sem que o framework saiba ou se importe com qual runtime é.

**2.3.2 — As 3 primitivas agnósticas**

- **Markdown como contexto**: CLAUDE.md e STATE.md são arquivos de texto. Qualquer runtime que leia arquivos consegue usá-los.
- **Scripts Python no core**: Lógica crítica fica em Python puro — não em DSL proprietária de nenhum runtime.
- **Skills como diretório**: Cada skill é um arquivo Markdown numa pasta. Nenhuma dependência de plataforma.

**2.3.3 — Demo: mesma sessão em Claude Code e OpenCode**

[Demo ao vivo: Felipe abre a mesma sessão de trabalho em Claude Code e em OpenCode — os dois executam a mesma skill, leem o mesmo STATE.md, entregam o mesmo resultado. O framework não sabe quem está executando.]

**2.3.4 — A lição**

*"Você não precisa de 3 frameworks diferentes. Precisa de 1 contrato que qualquer runtime implementa."* Agnósticismo não é sobre usar todos os runtimes ao mesmo tempo — é sobre ter a liberdade de trocar sem reescrever.

---

## Bloco 3 — A inversão de tempo (RFC)

### 3.1 — O que mudou no desenvolvimento

**3.1.1 — Como era antes: 80% codificando, 20% planejando**

No desenvolvimento tradicional, codar era lento. Você passava horas escrevendo, testando, debugando — e esse tempo forçava reflexão. Você entendia o sistema que estava construindo porque estava construindo cada parte na mão.

**3.1.2 — Como é agora: agentes rodam por horas gerando código que ninguém revisa**

Com agentes autônomos, você pode gerar 1.000 linhas de código em minutos. O problema: quem revisou? Quem entende o que foi gerado? Quem sabe se a arquitetura está coerente?

A velocidade de geração de código aumentou 10x. A velocidade de entendimento humano ficou a mesma.

**3.1.3 — A virada**

*"O custo de codificar caiu. O custo de entender o que foi gerado subiu."*

Antes, o gargalo era escrever código. Agora, o gargalo é especificar com precisão o suficiente para que a IA gere o código certo — e ter critérios para saber se o que foi gerado está correto.

**3.1.4 — O novo modelo: 80% especificação, 20% execução**

```
ANTES DA IA                    COM IA
─────────────────              ─────────────────
20% planejamento    →          80% especificação
80% codificação     →          20% execução
```

Quem ainda gasta 80% do tempo "fazendo a IA codar" está no modelo errado. O tempo bem investido é no que vai guiar o que a IA vai gerar.

---

### 3.2 — O que é uma RFC

**3.2.1 — Origem do nome: Request for Comments**

RFC vem da cultura de engenharia de software — você propõe uma mudança, documenta o raciocínio por trás dela, e pede comentários de outras pessoas antes de implementar. O nome captura exatamente o que o artefato é: uma proposta que existe para ser questionada antes de virar código.

**3.2.2 — O que é na prática: documento Markdown escrito antes de codar**

Uma RFC não é um documento burocrático. É um arquivo Markdown simples que responde: o que vou construir, quais são as entradas e saídas, quais são as regras de negócio, o que deve ser validado, o que não deve acontecer.

**3.2.3 — Campos mínimos de uma RFC**

```markdown
# RFC: [Nome da Feature]

## Contexto
Por que essa feature existe? Qual problema resolve?

## Entradas
O que entra no sistema? (tipos, formatos, validações)

## Saídas
O que sai? (tipos, formatos, efeitos colaterais)

## Regras de negócio
Quais são as regras que o sistema deve respeitar?

## Validações
O que deve ser rejeitado? Quais são os casos de erro?

## O que não é escopo
O que deliberadamente não será feito nessa iteração?
```

**3.2.4 — Por que agnóstico a linguagem**

A RFC foca em **domínio e padrões** — não em Python vs. TypeScript. Com a mesma RFC você pode gerar a implementação em qualquer linguagem via IA. A especificação captura as regras de negócio; a linguagem é detalhe de implementação.

**3.2.5 — A consequência de não ter RFC**

*"Sem RFC bem definida, o código que a IA gera pode violar sua arquitetura sem você perceber."* A IA vai resolver o problema imediato — mas vai tomar decisões de arquitetura por conta própria, sem saber o que veio antes e o que vai vir depois.

---

### 3.3 — Como usar a RFC com IA

**3.3.1 — RFC como contexto do agente**

Em vez de mandar um prompt vago ("cria uma feature de agendamento"), você passa a RFC como contexto:

```
[RFC completa como contexto]
+ 
"Implemente a feature descrita nesta RFC."
```

O agente tem um norte claro. A chance de alucinação cai drasticamente.

**3.3.2 — Revisar a RFC, não o código**

A RFC tem 50 linhas. O código gerado tem 300. Qual é mais rápido de revisar? Qual é mais fácil de identificar erros?

Quando você revisa a RFC antes de gerar o código, você está verificando o raciocínio — não a implementação. Se o raciocínio está certo, a implementação tende a estar certa.

**3.3.3 — Revisão colaborativa**

Colegas podem comentar na RFC antes de uma linha ser escrita. "Espera — essa regra de negócio está errada, o cliente muda de estado aqui" é muito mais barato de corrigir numa RFC do que num pull request.

**3.3.4 — Demo ao vivo: RFC curta pra feature real**

[Demo: Felipe escreve uma RFC curta para uma feature real do framework e usa como contexto para um agente. O aluno vê a diferença entre "prompt vago" e "RFC como contexto".]

---

### 3.4 — O Grill Me reverso (quality gate de entendimento)

**3.4.1 — O conceito**

Em vez de você revisar o código que a IA gerou, a IA te questiona sobre as decisões de domínio antes de gerar. É uma inversão do fluxo de revisão.

```
REVISÃO TRADICIONAL              GRILL ME REVERSO
─────────────────────            ─────────────────────────
IA gera código        →          IA pergunta sobre domínio
Dev revisa código     →          Dev responde / clarifica
Dev encontra erros    →          IA e dev chegam a acordo
Dev pede correção     →          IA gera código com entendimento mútuo
```

**3.4.2 — Exemplo de pergunta da IA**

*"Você tem uma cláusula if aqui que verifica se o usuário está ativo — qual é a regra de negócio por trás? O que acontece com usuários em trial? E com usuários suspensos?"*

Essa pergunta força o dev a articular uma regra que talvez estava implícita na cabeça — e que, sem ser verbalizada, a IA teria inventado.

**3.4.3 — Por que isso é um quality gate**

O Grill Me reverso garante entendimento mútuo antes de gerar. É um quality gate de entendimento — não de código. Quando ambos (IA e dev) chegam ao mesmo entendimento da regra de negócio, o código gerado tende a estar correto por construção.

**3.4.4 — Como implementar**

Customizar um prompt/skill que instrui a IA a fazer perguntas antes de executar:

```
Antes de implementar qualquer feature:
1. Liste as decisões de domínio implícitas
2. Faça uma pergunta por vez sobre cada uma
3. Só comece a implementar depois de ter resposta para todas
4. Forneça um resumo do que foi acordado antes de codar
```

---

## Bloco 4 — As regras que a IA quebra

### 4.1 — DRY: a IA repete código por padrão

**4.1.1 — Definição real: todo conhecimento tem uma representação única e autoritativa**

DRY (Don't Repeat Yourself) não é só sobre evitar copy-paste de código. É sobre garantir que cada pedaço de conhecimento do sistema — regra de negócio, configuração, lógica — existe em um único lugar. Se você precisar mudar, muda em um lugar. Acabou.

**4.1.2 — O que não é DRY**

DRY não é sobre linhas de código duplicadas. Você pode ter duas funções que fazem coisas parecidas e ainda estar respeitando DRY — se cada uma representa um conhecimento diferente. O problema é quando o mesmo **conhecimento** está em dois lugares.

**4.1.3 — O que é violação de DRY**

Exemplo clássico: você tem uma regra de negócio que diz "desconto máximo é 30%". Essa regra está codificada:
- Na função que calcula o desconto
- No validator do formulário
- No email de confirmação
- No PDF do pedido

Quando a regra mudar para 25%, você vai lembrar de atualizar os 4 lugares? E o dev que vier depois de você?

**4.1.4 — Como a IA viola DRY**

A IA gera código para resolver o problema imediato. Se ela já gerou uma função que calcula desconto em outro arquivo, ela não vai necessariamente linkar — vai gerar outra. Se ela precisou de uma constante que já existe, vai definir de novo.

```python
# Arquivo A (gerado primeiro)
MAX_DISCOUNT = 0.30

# Arquivo B (gerado depois — IA não "lembrou" do A)
DISCOUNT_LIMIT = 0.30  # mesma constante, nome diferente, lugar diferente
```

**4.1.5 — Como resolver**

- Identificar a fonte única de cada conhecimento
- Fazer a IA importar/referenciar em vez de redefinir
- Usar a RFC para definir onde cada conhecimento vive antes de gerar código

---

### 4.2 — ETC: a IA acopla tudo

**4.2.1 — Definição: fácil de mudar**

ETC (Easy to Change) é o princípio que guia todas as decisões de design. Antes de qualquer escolha arquitetural, a pergunta é: *"Isso vai facilitar ou dificultar mudar depois?"* Código que é difícil de mudar é código que vai custar caro.

**4.2.2 — Como a IA viola ETC**

A IA otimiza para o problema imediato. Se o endpoint da API está disponível agora como constante, ela usa como constante. Se o ID do serviço de email está disponível, ela hardcoda. O resultado é um sistema que funciona hoje — e que vai custar caro para qualquer mudança amanhã.

**4.2.3 — Exemplos reais de violação de ETC**

```python
# VIOLAÇÃO: path hardcoded
config_path = "/home/ubuntu/app/config.json"

# CORRETO: configurável via ambiente
config_path = os.getenv("CONFIG_PATH", "config.json")

# VIOLAÇÃO: ID de serviço hardcoded
EMAIL_SERVICE_ID = "ses-us-east-1-prod"

# CORRETO: via configuração
EMAIL_SERVICE_ID = config.get("email_service_id")
```

Cada vez que você vê um valor que poderia mudar tratado como constante fixa, você está vendo uma violação de ETC.

**4.2.4 — Como resolver**

Criar uma camada entre a decisão e quem a usa:
- Variável de ambiente para configurações que podem mudar por ambiente
- Arquivo de config para parâmetros que o operador pode ajustar
- Interface/abstração para dependências que podem ser trocadas

---

### 4.3 — Ortogonalidade: a IA não componentiza

**4.3.1 — Definição: componentes que não se afetam**

Ortogonalidade significa que as partes do sistema são independentes entre si. Mudar uma não quebra a outra. Você pode modificar o componente de email sem tocar no de agendamento. Você pode trocar o banco de dados sem reescrever as regras de negócio.

```
SISTEMA ORTOGONAL              SISTEMA ACOPLADO
──────────────────             ────────────────────
[Email]   [Agenda]             [Email + Agenda + 
                                Pagamento + Usuário]
[Pagto]   [Usuário]                    ↑
                               mudar um quebra tudo
  mudar um não afeta o outro
```

**4.3.2 — Como a IA viola ortogonalidade**

A IA gera sistemas onde tudo depende de tudo porque é mais fácil resolver como bloco único. Em vez de criar um componente de email independente, ela mistura a lógica de email dentro do fluxo de agendamento. Em vez de uma camada de dados separada, ela faz queries diretamente nas funções de negócio.

**4.3.3 — Demo: pedir para IA criar uma feature e ver o acoplamento**

[Demo: Felipe pede para um agente criar uma feature simples. O resultado mostra funções que fazem coisas demais, dependências entre módulos que não deveriam se conhecer, lógica de negócio misturada com lógica de apresentação.]

**4.3.4 — Como resolver: não pedir para a IA componentizar — forçar via quality gate**

O erro mais comum é tentar resolver isso no prompt: "crie componentes bem separados, com baixo acoplamento". A IA vai tentar — e vai falhar de formas sutis que você não vai detectar na revisão.

A solução é **não pedir** — é **forçar**. Quality gates que medem acoplamento, tamanho de função e dependências entre módulos fazem o enforcement automático. Se o código gerado viola os limites, o gate bloqueia. A IA refatora. O resultado é componentização — não porque a IA quis, mas porque não tinha outra opção.

---

### 4.4 — Quality gates: automatizar o que o code review não cobre

**4.4.1 — O que é um linter e o que ele checa**

Um linter é uma ferramenta que analisa código **sem executar** — apenas lendo a estrutura. Ele pode verificar:
- Linhas por função (ex: máximo 30)
- Linhas por arquivo (ex: máximo 200)
- Duplicação de código (ex: zero duplicação acima de 5 linhas)
- Complexidade ciclomática (número de caminhos possíveis em uma função)
- Imports não utilizados
- Violações de convenção de nomenclatura

**4.4.2 — Como o gate funciona no CI/CD**

```
IA gera código
      ↓
Commit na branch
      ↓
CI/CD roda o gate
      ↓
┌─────────────────────┐
│ Gate passa?         │
│                     │
│ SIM → merge OK      │
│                     │
│ NÃO → bloqueia      │
│       IA refatora   │
│       volta pro gate│
└─────────────────────┘
```

**4.4.3 — Skills atômicas: o mesmo princípio para agentes**

O mesmo conceito de "limite de tamanho" que funciona para funções funciona para skills de agentes:
- Skills < 70-80 linhas: cada skill faz uma coisa
- Um agente por skill: coder, QA, PO não são o mesmo agente
- Se a skill está crescendo, é sinal de que ela está fazendo coisas demais

**4.4.4 — A regra de ouro dos quality gates**

*"Você não pede para a IA escrever código limpo. Você configura o gate que impede o contrário."*

Confiar na boa vontade do agente é a estratégia do passageiro. O dono configura as regras e deixa o mecanismo trabalhar.

---

## Bloco 5 — O próximo degrau (piso mínimo)

### 5.1 — O piso mínimo

**5.1.1 — O que não é o piso**

- Não é saber escrever Python do zero
- Não é entender algoritmos e estruturas de dados
- Não é ter cursado Ciência da Computação
- Não é saber configurar um servidor Linux na mão
- Não é entender compiladores, gerenciamento de memória, ou ponteiros

**5.1.2 — O que é o piso**

Quatro capacidades concretas definem quem não é passageiro:

```
PISO MÍNIMO DO DONO
──────────────────────────────────────────────────────
1. LER CÓDIGO
   Entender o que a IA gerou o suficiente para saber
   se está errado. Não precisa saber escrever — precisa
   saber ler.

2. ESCREVER RFCs
   Especificar antes de executar. Definir entradas,
   saídas, regras de negócio. Dar à IA um norte claro.

3. RECONHECER AS VIOLAÇÕES
   DRY, ETC, Ortogonalidade como checklist de revisão.
   "Essa constante está duplicada?" "Isso vai ser difícil
   de mudar?" "Esse componente está fazendo coisas demais?"

4. CONFIGURAR UM GATE BÁSICO
   Linter simples que bloqueia os piores casos.
   Limite de linhas por função. Nada mais sofisticado
   que isso para começar.
```

**5.1.3 — Ordem de estudo sugerida**

```
(1) Lógica de programação básica
    ↓ Entender if/else, loops, funções — sem linguagem específica
(2) Como ler e entender código
    ↓ Praticar leitura de código gerado por IA: o que faz, por que
(3) System design introdutório
    ↓ Como sistemas são organizados: camadas, componentes, contratos
(4) DRY / ETC / Ortogonalidade na prática
    ↓ Identificar violações no código real do seu produto
```

Não é uma jornada de 4 anos. É uma jornada de meses, com foco no que importa para quem constrói com IA — não para quem constrói IA.

---

### 5.2 — Encerramento

**5.2.1 — Vibe coder vs. desenvolvedor pragmático com IA**

| | Vibe Coder | Dev Pragmático com IA |
|---|---|---|
| Especificação | Prompt vago | RFC antes de codar |
| Revisão | Olha se "parece certo" | Checa DRY/ETC/Ortogonalidade |
| Custo | Não sabe quanto gasta | Escolhe modelo certo, configura budget |
| Lock-in | Depende de um runtime | Contrato agnóstico |
| Gate | Confia na IA | Configura linter, CI/CD |
| Quando quebra | Não sabe por onde debugar | Sabe onde olhar |

**5.2.2 — A frase de fechamento**

*"No-code foi a porta de entrada. O que vai determinar quem continua no mercado daqui a 2 anos não é saber mais ferramentas — é entender o que as ferramentas estão fazendo."*

**5.2.3 — Prévia da próxima live**

[A definir — continuidade da jornada de no-coder a dono do produto]

**5.2.4 — Q&A aberto**

Perguntas frequentes esperadas:
- *"Qual linguagem devo aprender primeiro?"* → A que o código gerado para o seu produto usa. Se é Python, leia Python. Se é TypeScript, leia TypeScript.
- *"Preciso de quanto tempo para chegar no piso mínimo?"* → Com foco, 3-6 meses de estudo consistente. O objetivo não é proficiência — é leitura crítica.
- *"E se a IA gerar código que eu nunca vou conseguir entender?"* → Esse é exatamente o sintoma de que você está sendo passageiro. O piso mínimo resolve isso.

---

## Resumo: o mapa da aula

```
DE PASSAGEIRO A DONO
────────────────────────────────────────────────────────────

INTRO: Dono vs. Passageiro vs. Motorista de táxi

BLOCO 1: Custo de token
  → $200 em 2h (Luiz)
  → Subscription vai morrer → token vai dominar
  → Leitura crítica como diferencial

BLOCO 2: Agnósticismo
  → Multi-model: modelo certo pra cada tarefa
  → Vendor lock-in: Fable 5, Linux/Windows
  → Contrato de runtime: 8 capacidades, 3 primitivas

BLOCO 3: RFC
  → 80/20 invertido: especificação antes de execução
  → RFC como artefato: Markdown antes de codar
  → Grill Me reverso: IA questiona dev

BLOCO 4: Regras que a IA quebra
  → DRY: fonte única de verdade
  → ETC: fácil de mudar
  → Ortogonalidade: componentes independentes
  → Quality gates: mecanismo de enforcement

BLOCO 5: Piso mínimo
  → Ler código, escrever RFC, reconhecer violações, configurar gate
  → Ordem de estudo: lógica → leitura → system design → pragmático
```

---

*Live 02 — NoCode Startup · Agosto/2026*
