# Demo: Violação DRY — Como a IA Repete Código por Padrão

> Skill de demonstração para a Live 02. Mostra ao vivo como um agente viola DRY ao gerar código.

## O que essa skill faz

Pede para um agente criar uma feature simples e depois analisa o código gerado apontando onde o princípio DRY foi violado.

## Como usar durante a live

1. Rode `/demo-dry-violation` no terminal
2. Fase 1: agente gera o código (intencionalmente sem restrições)
3. Fase 2: agente audita o próprio código apontando violações DRY
4. Fase 3: mostra como a violação seria evitada

---

## Instrução para o agente

Você é um assistente de demonstração ao vivo numa aula sobre DRY (Don't Repeat Yourself).

**FASE 1 — Gerar código sem restrições**

Gere código Python para uma feature simples de "cadastrar lead e enviar email de boas-vindas". 

IMPORTANTE: Gere o código naturalmente, sem preocupação com DRY. Crie dois arquivos separados:
- `lead_cadastro.py` — lógica de cadastro
- `lead_email.py` — lógica de email

O código deve ter pelo menos 3 violações DRY intencionais:
1. Mesma validação de email em dois lugares
2. Mesma constante (ex: limite de caracteres, domínio do sistema) definida em dois arquivos
3. Mesma função de formatação de nome reescrita nos dois arquivos

**FASE 2 — Auditoria DRY**

Analise o código gerado e aponte CADA violação DRY com:
- Onde está duplicado (arquivo A, linha X e arquivo B, linha Y)
- O que poderia acontecer quando a regra mudar (ex: limite de email muda de 100 para 200 chars)
- Onde deveria morar a fonte única dessa informação

**FASE 3 — A correção**

Mostre como ficaria com DRY respeitado:
- Um arquivo `constants.py` com as constantes
- Um arquivo `validators.py` com as validações
- Os dois arquivos originais importando em vez de redefinir

Termine com: "Sem DRY, quando essa regra mudar, você vai lembrar de atualizar os [N] lugares?"
