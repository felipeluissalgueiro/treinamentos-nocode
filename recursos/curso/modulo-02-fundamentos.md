# Módulo 2 — Fundamentos

**8 aulas · ~35min · Status: ✅ completo**

> Esse módulo é o filtro. Se você sair daqui achando que é só pedir pra IA, você não aprendeu nada. Se sair entendendo COMO pedir, você aprendeu tudo.

---

## Aula 2.1 — Isso aqui NÃO é vibe coding (5 min)

### A diferença em 2 prompts

**Prompt vago (vibe coding):**
> "Cria um app de carrossel pra mim."

Resultado: código genérico, sem estrutura, incompleto. Parece funcionar mas não funciona de verdade.

**Prompt com contexto (engenharia de prompt):**
> "Estou construindo um app de carrossel. A stack é Next.js no frontend + FastAPI no backend. O CLAUDE.md já tem as regras. Quero que você crie a rota POST /generate que recebe `{tema: string, slides: number}` e retorna `{slides: Array<{titulo, texto, imagem_url}>}`. Use a função generate_content() que já existe em src/llm.py."

Resultado: código estruturado, seguindo as regras, encaixando no que já existe.

### A regra

**90% das pessoas faz o primeiro tipo de prompt e desiste em 3 dias.** Os 10% que aprendem o segundo tipo constroem produto real. Esse curso ensina o segundo.

**🏆 Troféu:** Você entende que prompt vago = lixo. Prompt com contexto = código que funciona.

---

## Aula 2.2 — Como um projeto funciona (5 min)

### Analogia da cozinha

| Pasta | Papel na cozinha |
|---|---|
| `src/` | Onde a comida é preparada (código principal) |
| `api/` | Onde os garçons recebem pedido (rotas HTTP) |
| `components/` | Pratos prontos reutilizáveis (UI) |
| `public/` | Vitrine da entrada (assets estáticos) |
| `.env` | Cofre com a chave do caixa (credenciais) |
| `package.json` | Lista de fornecedores (dependências) |
| `node_modules/` | Estoque comprado (bibliotecas instaladas) |
| `.gitignore` | "Não mostra isso pro auditor" (o que não vai pro Git) |

### Você não precisa decorar

Você precisa **reconhecer** essas pastas quando o Claude criar. Quando ele falar "vou colocar isso em `src/lib/utils.ts`", você entende onde fica.

**🏆 Troféu:** Você abre um projeto qualquer (do curso ou exemplo na internet) e não se assusta com a estrutura de pastas.

---

## Aula 2.3 — 5 estruturas de código pra LER (5 min)

Você não precisa **escrever** essas estruturas. Precisa **reconhecer** quando o Claude as escreve.

### 1. Variável

```python
nome = "João"          # variável recebe valor
idade = 30
ativo = True
```

### 2. Condição (if/else)

```python
if idade >= 18:
    print("maior")
else:
    print("menor")
```

### 3. Loop (for/while)

```python
for slide in slides:
    print(slide.titulo)
```

### 4. Função

```python
def gerar_carrossel(tema, slides=7):
    # faz a mágica
    return resultado
```

### 5. Import

```python
from fastapi import FastAPI
import json
```

**🏆 Troféu:** Você abre `src/main.py` do projeto e identifica cada uma dessas 5 estruturas no código.

---

## Aula 2.4 — Ler erro sem pânico (4 min)

### Anatomia de um erro

Quando algo quebra, o terminal mostra algo assim:

```
Traceback (most recent call last):
  File "src/main.py", line 42, in generate
    result = llm.complete(prompt)
AttributeError: 'NoneType' object has no attribute 'complete'
```

| Pedaço | O que significa |
|---|---|
| `Traceback` | "Olha aqui o caminho que o código percorreu até quebrar" |
| `File "src/main.py", line 42` | **Onde** quebrou (arquivo + linha) |
| `in generate` | **Em qual função** quebrou |
| `AttributeError` | **Que tipo** de erro |
| `'NoneType' object has no attribute 'complete'` | **A mensagem** (legal/cripto) |

### O que fazer

1. **Copie a mensagem inteira** (todo o traceback)
2. **Cole pro Claude Code** dizendo: "deu esse erro: [traceback]. Como resolver?"
3. **Claude lê o erro + o código + sugere fix**

**Erro NÃO é fracasso. É informação.**

### Erros mais comuns

| Erro | O que geralmente é |
|---|---|
| `ModuleNotFoundError` | Faltou `pip install` ou `npm install` |
| `KeyError` | Procurou chave que não existe num dict/JSON |
| `TypeError` | Passou tipo errado (string onde esperava int) |
| `ConnectionError` | API ou DB fora do ar (ou URL errada) |
| `401 Unauthorized` | API key errada ou expirada |
| `500 Internal Server Error` | Erro no servidor (não no seu código necessariamente) |

**🏆 Troféu:** Apareceu um erro, você leu, identificou tipo + linha, e soube pra onde olhar.

---

## Aula 2.5 — APIs: a cola que conecta tudo (5 min)

### O que é API

**A**pplication **P**rogramming **I**nterface — um jeito padrão de 2 sistemas conversarem.

Analogia: drive-thru. Você não entra na cozinha, você fala pelo microfone. O microfone é a API.

### Os 2 verbos que importam (90% dos casos)

| Verbo | Pra quê | Exemplo |
|---|---|---|
| **GET** | Buscar dado existente | "Me dá a lista de produtos" |
| **POST** | Criar/enviar dado novo | "Cria esse pedido novo" |

(Existem PUT, DELETE, PATCH — você vê depois.)

### JSON: o idioma das APIs

Toda API moderna troca dado em **JSON** (formato texto estruturado):

```json
{
  "tema": "marketing digital",
  "slides": 7,
  "estilo": "minimalista"
}
```

### API key e .env

Pra usar API paga (Anthropic, OpenAI), você precisa de **API key** — senha da sua conta.

**Regra absoluta:** **NUNCA** comita API key no Git. Sempre em arquivo `.env`:

```
ANTHROPIC_API_KEY=sk-ant-...
OPENAI_API_KEY=sk-...
```

E no `.gitignore`:
```
.env
```

**🏆 Troféu:** Você sabe explicar pra alguém o que é GET vs POST + por que `.env` nunca vai pro Git.

---

## Aula 2.6 — Claude Code: usando o CLI dentro do VS Code (10 min)

### Setup ideal

1. Abre VS Code
2. Abre terminal integrado: **Ctrl+`**
3. Digita `claude`
4. Pronto — Claude Code roda dentro do VS Code

> "Você fica no VS Code, abre o terminal embaixo, e conversa com o Claude ali mesmo. Ele lê os arquivos do seu projeto, entende a estrutura, e executa."

### Comandos essenciais (decorar esses)

| Comando | O que faz |
|---|---|
| `/help` | Lista todos comandos |
| `/model` | Troca modelo (Sonnet, Opus, Haiku) |
| `/clear` | Limpa contexto (útil entre tarefas diferentes) |
| `/cost` | Quanto gastou na sessão atual |
| `/compact` | Compacta histórico pra liberar contexto |
| `!comando` | Roda comando shell sem sair do Claude (ex: `!ls`) |
| `Esc Esc` | Para o Claude no meio (se entrou em loop) |
| `Ctrl+C` | Sai do Claude Code |

### Modo one-shot

Sem entrar no chat, só pra rodar uma coisa rápida:

```bash
claude -p "explica o que faz o arquivo src/llm.py"
```

### Dica de ouro: contexto

> "Quando o Claude diz 'não tenho acesso a X' ou 'não consigo fazer Y', 90% das vezes é porque falta contexto. Ele não tá mentindo — ele realmente não sabe."

**Solução:** dá pra ele o caminho do arquivo, a API key (no .env), o endpoint, ou cola o erro completo. Ele lê e responde.

**🏆 Troféu:** Você rodou `claude` dentro do VS Code, deu `/help`, testou `/model` e `/cost`, e conseguiu fazer ele ler um arquivo do projeto.

---

## Aula 2.7 — CLAUDE.md: o documento mais importante do projeto (10 min)

### A analogia

> "Se o Claude Code é o chef, o **CLAUDE.md é o manual da cozinha**. Sem ele, o chef cozinha do jeito que ele quiser. Com ele, o chef segue suas regras."

### O que vai no CLAUDE.md

Estrutura recomendada (templates prontos em `kit-template/templates/CLAUDE.md`):

```markdown
# Contexto do projeto
[1 parágrafo descrevendo o que o projeto faz]

## Stack
- Backend: FastAPI + Python 3.11
- Frontend: Next.js 14
- DB: Supabase (Postgres)
- Deploy: Vercel (frontend) + Railway (backend)

## Regras absolutas
- Nunca comitar .env
- Sempre rodar testes antes de dizer "feito"
- Caminhos relativos, não absolutos
- Pra novo arquivo, prefere editar existente

## Restrições de ambiente
- Sistema: Windows 11
- Terminal: Git Bash
- Python path: C:\Python311\python.exe
- Encoding: UTF-8 forçado (sys.stdout.reconfigure)

## Credenciais
- API keys ficam em .env
- Nunca em código, nunca em commits

## Linguagem
- Comunicação: português BR
- Comentários no código: inglês
- Variáveis: snake_case (Python) / camelCase (JS)
```

### Por que isso importa

Sem CLAUDE.md:
- Claude gera código que assume Linux quando você tá no Windows
- Não respeita encoding UTF-8 e te dá erro de acento
- Ignora padrões do projeto

Com CLAUDE.md:
- Claude lê na primeira mensagem da sessão
- Aplica as regras automaticamente
- Pergunta quando algo conflita

### Dica do instrutor

> "O Claude é preguiçoso. Às vezes ele corta caminho, simplifica demais, ou pula etapas. No CLAUDE.md você pode escrever: 'nunca pule etapas', 'sempre rode os testes antes de dizer que terminou'. Eu tenho isso no meu. Funciona."

### Também vale `AGENTS.md`

Se você usa OpenCode (ou qualquer outro runtime), cria também um `AGENTS.md` com o mesmo conteúdo (ou aponta pra `CLAUDE.md`). Ver `kit/AGNOSTICIDADE.md` pra padrão completo.

**🏆 Troféu:** Você criou um CLAUDE.md no seu projeto-âncora com pelo menos: stack, 3 regras absolutas, 1 restrição de ambiente, política de credenciais.

---

## Aula 2.8 — CLIs dos serviços: as manhas que quebram galho (10 min)

### Por que CLI > dashboard web

> "CLI é como ter o controle remoto da TV em vez de levantar e apertar o botão. Quando seu app tá fora do ar e o cliente reclamando, 2 segundos importam."

### Vercel CLI

```bash
npm install -g vercel
vercel login

vercel                  # deploy de preview
vercel --prod           # deploy de produção
vercel logs             # ver logs em tempo real
vercel env ls           # listar variáveis de ambiente
vercel env add KEY      # adicionar variável
```

### Railway CLI

```bash
npm install -g @railway/cli
railway login

railway status          # estado do projeto
railway logs            # logs em tempo real
railway variables       # listar env vars
railway up              # deploy
```

### Supabase CLI

```bash
npm install -g supabase
supabase login

supabase init           # iniciar projeto local
supabase db push        # subir mudanças do schema
supabase functions deploy <nome>  # deploy de Edge Function
```

### GitHub CLI

```bash
# instala em cli.github.com
gh auth login

gh repo create          # cria repo
gh pr create            # cria PR
gh issue list           # lista issues
gh repo clone <repo>    # clona
```

### Caso prático: deploy quebrou

1. Comando: `vercel logs --prod`
2. Aparece erro: `Environment variable ANTHROPIC_API_KEY is not defined`
3. Fix: `vercel env add ANTHROPIC_API_KEY production`
4. Redeploy: `vercel --prod`
5. Resolvido em 30 segundos sem abrir browser

### Manha número 1

> "**'railway variables'**. Quando algo não funciona no deploy mas funciona local, 99% das vezes é variável de ambiente faltando. Esse comando mostra todas. Compara com seu .env local. Achou a diferença? Achou o bug."

**🏆 Troféu:** Você instalou pelo menos 2 CLIs (Vercel + GitHub) e conseguiu rodar `vercel project ls` + `gh repo list` autenticado.

---

## Próximo módulo

[Módulo 3 — Planejamento](modulo-03-planejamento.md): PRD, framework próprio, arquitetura e stories.
