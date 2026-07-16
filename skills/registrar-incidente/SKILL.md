---
name: registrar-incidente
description: >
  Registra incidente ou aprendizado técnico no hub centralizado + cópia local no projeto.
  Ativar quando Felipe disser "/registrar-incidente", "registra incidente", "documenta esse problema",
  "registra aprendizado", "isso virou incidente", "guarda esse erro pra não repetir",
  "cria registro do bug", "registra o que deu errado".
  Funciona em QUALQUER projeto Claude Code.
---

# /registrar-incidente — Registrar problema no hub global

Cria arquivo .md estruturado documentando um incidente/aprendizado técnico. Salva **2 cópias** (hub global + pasta local do projeto) e atualiza o INDEX.

## Paths

| Path | Papel |
|---|---|
| `C:\Users\felip\OneDrive\Documentos\ClaudeCode\Hub Projetos\Incidentes\` | **Hub global** (fonte consultável por todos os agentes) |
| `<projeto>\docs\incidentes\` | Cópia local (vive com o projeto) |

Template base: `Incidentes/TEMPLATE.md`
Índice: `Incidentes/INDEX.md`

## Formato do nome do arquivo

`YYYY-MM-DD_titulo-slug.md`

- Data em que o incidente ocorreu (não a data do registro)
- Slug: minúsculo, sem acento, espaços → hífen, máx ~6 palavras
- Ex: `2026-04-15_vercel-6-deploys-falharam.md`

## Fluxo obrigatório

1. **Coletar informações** com Felipe (ou extrair da conversa se já discutido):
   - Título curto do problema
   - Data do incidente
   - Severidade (Baixa / Média / Alta / Crítica)
   - Projeto afetado
   - Duração do impacto
   - O que aconteceu
   - Causa raiz (técnica, com arquivo:linha se aplicável)
   - Por que não foi detectado
   - Como foi corrigido (commits se aplicável)
   - Prevenção (checklist verificável + pattern correto se aplicável)

2. **Identificar projeto atual**: ler do cwd. Ex:
   - `Projetos BMAD/Cadencia` → projeto "Cadência"
   - `Projetos BMAD/PD Marketing` → projeto "PD Marketing"
   - `Rotina` → projeto "Rotina"
   - OpenClaw → projeto "OpenClaw"

3. **Gerar slug**:
   ```python
   import re
   slug = re.sub(r'[^a-z0-9]+', '-', title.lower()).strip('-')
   # Se muito longo, cortar em ~6 palavras / 60 chars
   ```

4. **Escrever arquivo global**:
   `Hub Projetos/Incidentes/YYYY-MM-DD_slug.md`

5. **Escrever cópia local**:
   `<cwd do projeto>/docs/incidentes/YYYY-MM-DD_slug.md`
   - Se a pasta `docs/incidentes/` não existir: criar
   - Se também não tiver `docs/incidentes/README.md` mínimo, criar apontando pro hub

6. **Atualizar INDEX.md global**:
   - Abrir `Hub Projetos/Incidentes/INDEX.md`
   - Inserir nova linha na tabela do mês correto (mais recente primeiro)
   - Manter ordem cronológica reversa dentro do mês
   - Se mês/ano não existir como seção: criar

7. **Reportar pro Felipe**:
   ```
   ✅ Incidente registrado

   Título: [título]
   Projeto: [projeto]
   Severidade: [sev]

   Arquivos:
   - Hub global: Incidentes/YYYY-MM-DD_slug.md
   - Cópia local: <projeto>/docs/incidentes/YYYY-MM-DD_slug.md
   - Índice atualizado: Incidentes/INDEX.md
   ```

## Estrutura do template

Sempre seguir o `Incidentes/TEMPLATE.md`. Seções obrigatórias:

- Header com metadata (Data, Severidade, Projeto, Duração, Tags)
- O que aconteceu
- Causa raiz
- Por que não foi detectado
- Como foi corrigido
- Prevenção (checklist + pattern correto + onde foi atualizado)
- Commits relacionados
- Links relacionados

## Tags padrão (escolher 2-5 por incidente)

**Por área**: `#deploy`, `#infra`, `#bd`, `#api`, `#auth`, `#frontend`, `#backend`, `#comercial`, `#conteudo`
**Por plataforma**: `#vercel`, `#railway`, `#supabase`, `#ghl`, `#wordpress`, `#notion`, `#meta`, `#instagram`
**Por natureza**: `#dados-perdidos`, `#receita-impactada`, `#regressao`, `#silenciosa`, `#falha-detectada`

## Consulta antes de executar (comportamento de TODO agente)

Antes de executar **deploy, mudança de infra, integração crítica ou operação destrutiva**:

1. Ler `Hub Projetos/Incidentes/INDEX.md`
2. Filtrar por tag relevante à tarefa atual (ex: vou fazer deploy Vercel → procurar `#deploy` + `#vercel`)
3. Se houver incidente, abrir e aplicar a seção **Prevenção**

Isso NÃO é uma skill separada — é comportamento padrão de qualquer agente nesta máquina. A skill aqui é só pra REGISTRAR.

## Regras importantes

- **NÃO inventar detalhes técnicos**: se Felipe não deu, perguntar. Nunca deduzir causa raiz sem confirmar.
- **Severidade vem do Felipe**: não classificar sozinho.
- **Commits**: só listar se souber o hash real. Não inventar.
- **Data do incidente ≠ data do registro**: se Felipe está registrando ontem hoje, usar data de ontem.
- **Prevenção deve ser acionável**: itens do checklist precisam ser verificáveis (comando a rodar, padrão a seguir), não genéricos ("ter mais cuidado").

## Criação automática em projeto novo

Quando agente detectar que está em projeto sem `docs/incidentes/` (primeira vez):
1. Criar pasta `docs/incidentes/`
2. Criar `docs/incidentes/README.md` com conteúdo:

```markdown
# Incidentes — [Projeto]

Pasta local de registros de incidentes deste projeto.
Cópia dos mesmos arquivos que ficam em `Hub Projetos/Incidentes/`.

**Hub global**: `C:\Users\felip\OneDrive\Documentos\ClaudeCode\Hub Projetos\Incidentes\`
**Índice completo**: `Hub Projetos/Incidentes/INDEX.md`

Ver skill `/registrar-incidente` pra criar novos registros.
```

Isso NÃO é automático ao criar projeto — acontece na primeira vez que um incidente é registrado nesse projeto.
