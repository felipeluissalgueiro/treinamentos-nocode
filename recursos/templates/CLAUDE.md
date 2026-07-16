# <Nome do Projeto>

> Template de `CLAUDE.md`. Apague os comentários `<...>` e preencha com o seu contexto.
> O `CLAUDE.md` é o contrato com o modelo: ele lê isto toda vez. Quanto melhor, melhor o agente.

## Contexto

<O que é o projeto, em 2-3 frases. Qual problema resolve, de quem.>

## Stack

<Linguagem, framework, serviços externos. Ex: Python 3.11, FastAPI, Supabase, OpenAI.>

## Estrutura

```
<projeto>/
  src/             ← código principal
  api/             ← rotas HTTP (se aplicável)
  scripts/         ← scripts auxiliares
  tests/           ← testes
  .env             ← credenciais (NUNCA versionar)
  .env.example     ← exemplo do .env (versionado)
  CLAUDE.md        ← este arquivo
  AGENTS.md        ← espelho deste (pro OpenCode)
```

## Regras do projeto

1. **Segredo nunca no código nem no git.** Tudo em `.env` (local); `.env.example` lista os nomes.
2. **Commits pequenos, em branch.** Uma branch por tarefa; nunca trabalhar direto na `main`.
3. **Nunca `git add -A`** — adicionar arquivos conferindo o que entra.
4. **Operações destrutivas exigem confirmação minha** (delete, drop, force push, deploy em prod).
5. **Antes de criar arquivo novo, prefira editar existente.**
6. **Nunca pule etapas** — se eu pedir teste, roda o teste antes de dizer que terminou.
7. <Outras regras suas: padrão de nomes, idioma, o que pedir aprovação antes de fazer.>

## Restrições do ambiente

- **Sistema:** <Windows 11 | macOS | Linux>
- **Terminal:** <Git Bash | iTerm | bash>
- **Python:** <caminho ou versão>
- **Node:** <versão>
- **Encoding:** UTF-8 (forçar com `PYTHONIOENCODING=utf-8` no Windows)

## Linguagem

- Comunicação comigo: português BR, direta, sem floreio
- Comentários no código: <inglês | português>
- Variáveis: <snake_case | camelCase>

## Como rodar

```bash
# instalar dependências
<comando>

# copiar .env
cp .env.example .env
# editar .env com suas credenciais

# subir local
<comando>
```

## Critério de aceite

<Como você sabe que o projeto está funcionando.>
