# Material de apoio — System Design pra Vibe Coder e Dev

> Eixo complementar ao "LLM morreu em 2025". Material pronto pra usar como bloco de aula em **S2 (Fundamentos)** ou **S3 (Construção)**. Origem: estudo do vídeo do Lucas Montano (https://youtu.be/16IYx0CekVc, 22min) — nota completa em `Estudo/IA-Tecnologia/2026-06-28_system-design-vibe-coder-dev.md` no vault pessoal.

---

## Tese pro aluno (1 frase)

> No mundo em que IA escreve cada vez mais código, **o que você (dev ou vibe coder) entrega de valor é o desenho do sistema** — não as linhas. IA produz código local; ela não decide onde cachear, quando enfileirar, como dividir o banco.

Esse é o aterrissamento prático do "harness vence o modelo" no nível da aplicação que o aluno vai construir nos 30 dias. Se você não desenhar bem, o agente IA constrói um produto frágil — não por falta de modelo, por falta de arquitetura.

---

## O que define software bom vs. ruim (use como abertura)

3 perguntas que separam produto bom de produto frustrante (vale pra mostrar pro aluno antes de entrar em conceito):

1. **Quão rápido ele responde?** (latência)
2. **Quantos erros ele joga na cara do usuário?** (robustez)
3. **Quando o usuário muda algo numa tela, isso se propaga em todas as camadas?** (consistência)

O bug clássico — "usuário modifica na tela A, volta na tela B e a informação não tá lá" / "clica no botão e o sistema é tão lento que ele clica duas vezes e faz 2 requests cancelando entre si" — **não é bug de código, é bug arquitetural**. O agente IA não vai pegar isso sem você dizer.

---

## Componentes que o aluno precisa saber NOMEAR (vocabulário mínimo)

Sem esse vocabulário, ele não consegue conduzir o agente IA por prompt nem descrever o que quer pro cliente.

| Componente | O que faz | Quando entra |
|---|---|---|
| **Client / Mobile** | Origem do request | Sempre |
| **DNS** | Resolução de domínio | Sempre (transparente) |
| **CDN** | Cache de assets estáticos perto do usuário | Imagem, JS, CSS |
| **Load Balancer** | Distribui requests entre instâncias | Mais de 1 app server |
| **WAF** | Bloqueia SQLi, XSS, bot | Borda do sistema, exposição pública |
| **API Gateway** | Auth, throttle, roteamento | Múltiplos serviços internos |
| **App Server** | Lógica de negócio | Sempre |
| **Cache (Redis, Memcached)** | Leitura quente em memória | Read-heavy |
| **SQL / NoSQL DB** | Persistência | Sempre |
| **Réplica de leitura** | Distribui carga de SELECT | Quando 1 DB não dá conta de leitura |
| **Sharding** | Divide DB por chave | Quando 1 DB não dá conta de escrita |
| **Message Queue / Kafka** | Desacopla produtor e consumidor | Picos de escrita, processamento assíncrono |
| **Logs / Métricas / Traces** | Observabilidade | Antes de precisar (não depois) |
| **Availability Zone** | Isolamento físico | Disponibilidade > 99.5% |

---

## Demo de aula — Hotel Booking (15-20min)

Roteiro pronto pra demonstrar ao vivo no quadro/Excalidraw/qualquer ferramenta de diagrama (ou usar o simulador do Lucas se quiser).

### Passo 1 — Versão ingênua

```
[Client] → [App Server] → [SQL DB]
```

Pergunte ao aluno: "vamos rodar 1000 usuários simultâneos. O que quebra primeiro?"

**Resposta:** o DB satura porque toda busca de quarto bate direto nele.

### Passo 2 — Adiciona cache

```
[Client] → [App Server] → [Cache] → [SQL DB]
```

Por quê funciona: a maioria dos hóspedes consulta os mesmos quartos populares. Cache serve as leituras repetidas.

**Ganho real (medido no simulador):** carga do DB cai de 115% (bottleneck aceso) pra dentro do limite, com o mesmo tráfego.

### Passo 3 — Adiciona Load Balancer + replicar app server

```
[Client] → [LB] → [App Server x N] → [Cache] → [SQL DB]
```

**Pergunta de entrevista:** "Round Robin ou Least Connections?" — depende do critério: se requests têm tempo parecido, RR. Se variam, LC.

### Passo 4 — Escalar DB horizontalmente

Réplicas de leitura distribuem SELECT. **Mas** isso desloca o gargalo pro app server.

### Passo 5 — Adiciona fila pra desacoplar

```
[Client] → [LB] → [App Server x N] → [Cache] → [SQL DB]
                       ↓
                    [Kafka / Queue]
                       ↓
                  [Worker async]
```

**Pergunta crítica de aula:** Kafka, EventBridge, SQS, RabbitMQ — qual? **Depende do critério que o aluno prioriza**:

- Capacidade de lidar com grande volume → Kafka
- Facilidade de integrar com AWS → SQS / EventBridge
- Alta disponibilidade barata → SQS
- Streaming com múltiplos consumidores → Kafka

Lição pro aluno: numa entrevista (ou no prompt pro agente IA), **pergunte o critério antes de escolher**.

---

## Os 10 passos do system design (pro aluno seguir sempre)

Quando o aluno for desenhar QUALQUER feature, segue esta sequência:

1. **Liste o caminho do request** — Client → ? → ? → DB. Versão ingênua direta.
2. **Simule o pico de tráfego previsto** — onde acende o vermelho primeiro?
3. **Pergunte: read-heavy ou write-heavy?** Read → cache primeiro, depois réplica. Write → fila, depois shard.
4. **Adicione Load Balancer ANTES de escalar horizontal** — sem ele, várias instâncias não distribuem carga.
5. **Pra escalar DB**, escolha: réplica de leitura (90% read), sharding (write distribuído), CQRS (read e write muito diferentes).
6. **Após cada mudança, identifique o próximo bottleneck** — escalar B só desloca, não elimina.
7. **Coloque fila/streaming quando precisar desacoplar produtor e consumidor** — Kafka/SQS absorvem picos sem derrubar o app server.
8. **Adicione observabilidade ANTES de precisar (logs, métricas, traces)** — sem isso, debug em produção é chute.
9. **Pergunte: e se o data center cair?** — multi-region, failover, replicação cross-AZ. Trade-off: custo vs. disponibilidade.
10. **Defina rate limiting e WAF na borda** — protege o interno de ataque/cliente mal-comportado.

---

## OLAP vs. OLTP (divisor de águas que o aluno PRECISA pegar)

| OLTP | OLAP |
|---|---|
| Transacional | Analítico |
| Muita escrita, escritas pequenas | Muita leitura, agregação |
| "Usuário fez login, comprou, pagou" | "Quantos compraram no Q3 por região?" |
| Postgres / MySQL | BigQuery / Snowflake / Redshift |
| Index narrow | Index amplo, particionamento |

**Regra prática:** misturar OLTP e OLAP no mesmo banco é raiz de gargalo em qualquer SaaS sério. Se o aluno tá construindo agente que processa lead E precisa relatório executivo de tudo, separar warehouse de operacional o quanto antes.

---

## Dois princípios de produto pro aluno (vale pra MVP dos 30 dias)

### 1. Uma única feature paga no lançamento

Identifique qual é a **única funcionalidade que o cliente pagaria pra usar**. O resto fica grátis ou some.

Exemplo do Lucas: o simulador é a feature paga. O canvas de desenho (que é o "atrativo") fica grátis — "Excalidraw da vida já faz isso, não dá pra cobrar".

Aplicação pro aluno: no MVP de 30 dias, qual é A FEATURE que justifica o cliente pagar? Tudo o que não for ela = distração.

### 2. Lance com monetização desde o dia 1

Em 2026, se a feature não vale dinheiro, não vale construir. Stripe / Asaas / pagamento único configurado **antes da segunda funcionalidade**.

Aplicação pro aluno: se o MVP é interno (resolve sua própria operação), monetização = redução de custo mensurada (X horas/semana economizadas × R$). Se for produto, gateway de pagamento configurado já na S3.

---

## Quando usar este material

| Sessão | Como usar |
|---|---|
| **S2 — Fundamentos** | Bloco "como pensar arquitetura" (~30min). Vocabulário mínimo + demo Hotel Booking ao vivo. Saída: aluno desenha o MVP dele no papel/Excalidraw. |
| **S3 — Construção** | Use os 10 passos como roteiro pra revisar o desenho do MVP do aluno. Identifique 1 gargalo previsto e construa a mitigação (geralmente cache ou fila). |
| **S4 — Entrega** | Princípios de produto (feature paga única + monetização dia 1) como check antes de mostrar o MVP pro cliente. |

---

## Refs

- Vídeo origem: https://youtu.be/16IYx0CekVc (Lucas Montano, 22min)
- Nota de estudo completa: `Estudo/IA-Tecnologia/2026-06-28_system-design-vibe-coder-dev.md` (vault pessoal)
- Enquadramento: `imersao-claude-code-30d/CLAUDE.md` §"Enquadramento do produto"
- Currículo: `imersao-claude-code-30d/curriculo-4-encontros.md`
