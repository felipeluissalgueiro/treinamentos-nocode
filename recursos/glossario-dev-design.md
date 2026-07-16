# Glossário Dev & Design — referência para agentes

> Dicionário canônico de termos técnicos de desenvolvimento e design. **Objetivo:** quando Felipe pedir algo usando um termo, o agente consulta aqui para entender exatamente o que ele quer. ~930 termos em 9 domínios.
> **Uso (agentes): NÃO leia este arquivo inteiro nem seções inteiras — floodaria o contexto.** Busque só o necessário com o buscador:
> ```
> python _core/glossario.py "<termo ou conceito>"               # lexical, instantâneo, sem rede
> python _core/glossario.py "<consulta conceitual>" --semantic   # embeddings (sinônimo / caso de uso)
> ```
> Retorna as 5-8 entradas relevantes com a seção. Este `.md` é a base de dados do buscador e a versão de leitura humana (espelho Obsidian) — não deve ser carregado em contexto de agente.
> Mantido pelo Stamper. Termos desduplicados (homônimos preservados com qualificador). Cópia espelhada no Obsidian (vault Empresa, `Conceitos/`). Atualizado 2026-06-17.

## Índice

1. [Fundamentos, Linguagens e Paradigmas](#fundamentos-linguagens-e-paradigmas)
2. [Frontend Web e Mobile](#frontend-web-e-mobile)
3. [Backend, APIs e Autenticação](#backend-apis-e-autenticação)
4. [Bancos de Dados e Dados](#bancos-de-dados-e-dados)
5. [DevOps, Infra, Cloud, Observabilidade e Segurança](#devops-infra-cloud-observabilidade-e-segurança)
6. [Arquitetura, Padrões, Versionamento, Testes e Metodologias](#arquitetura-padrões-versionamento-testes-e-metodologias)
7. [Inteligência Artificial, LLMs e Machine Learning](#inteligência-artificial-llms-e-machine-learning)
8. [Design — UX, Pesquisa e Produto](#design--ux-pesquisa-e-produto)
9. [Design — UI, Visual, Design Systems, Branding, Acessibilidade e Ferramentas](#design--ui-visual-design-systems-branding-acessibilidade-e-ferramentas)

---

<!-- Conteúdo gerado por geração paralela multi-agente em 2026-06-17. As 9 seções são inseridas abaixo deste marcador. -->

## Fundamentos, Linguagens e Paradigmas

### Conceitos básicos

**Array** (vetor) — Estrutura de dados que armazena elementos do mesmo tipo em posições contíguas de memória, acessíveis por índice inteiro. Acesso O(1), inserção no meio O(n).
**Atribuição** — Operação que vincula um valor a uma variável ou identificador (`x = 10`). Não confundir com comparação de igualdade (`==`).
**Booleano** — Tipo primitivo com apenas dois valores: verdadeiro (`true`) ou falso (`false`). Base de toda lógica condicional.
**Bug** — Comportamento inesperado ou incorreto em um programa, resultante de erro de lógica, sintaxe ou condição não prevista.
**Compilador** — Programa que traduz código-fonte de alto nível para código de máquina (ou bytecode) antes da execução. Ex: `gcc` para C, `tsc` para TypeScript.
**Compilado vs Interpretado** — Linguagens compiladas (C, Go, Rust) traduzem o código inteiro antes de rodar; interpretadas (Python, Ruby) executam linha a linha via runtime. Java e C# são híbridas.
**Constante** — Identificador cujo valor não pode ser alterado após a atribuição inicial.
**Debugger** — Ferramenta que permite pausar a execução em breakpoints, inspecionar variáveis e rastrear o fluxo passo a passo.
**Escopo** (scope) — Região do código onde uma variável é visível e acessível. Pode ser global, de módulo, de função ou de bloco.
**Expressão** — Trecho de código que produz um valor quando avaliado (`2 + 2`, `fn()`). Contrasta com declaração (statement), que realiza uma ação.
**Formatter** — Ferramenta que reformata código automaticamente segundo convenções de estilo (Prettier, Black, gofmt).
**Função** — Bloco nomeado e reutilizável de código que recebe parâmetros, executa lógica e opcionalmente retorna um valor.
**Heap** — Região de memória alocada dinamicamente em tempo de execução. Objetos criados com `new` vivem no heap; gerenciado por GC ou manualmente.
**IDE** (Integrated Development Environment) — Ambiente que combina editor, debugger, terminal e build. Ex: VS Code, IntelliJ, PyCharm.
**Imutabilidade** — Propriedade de um valor que não pode ser alterado após criação. Favorece previsibilidade e segurança em concorrência.
**Interpretador** — Programa que lê e executa código-fonte linha a linha em tempo real, sem compilação prévia.
**Linter** — Ferramenta de análise estática que detecta erros potenciais e violações de estilo sem executar o código. Ex: ESLint, Pylint.
**Loop** — Estrutura de controle que repete um bloco enquanto uma condição for verdadeira (`for`, `while`). Risco: loop infinito.
**Memória** — Recurso onde dados e instruções são armazenados durante a execução. Dividida em stack (automática, LIFO) e heap (dinâmica).
**Mutabilidade** — Capacidade de um valor ser alterado após criação. Arrays e objetos em JS são mutáveis; strings e números, imutáveis.
**Parâmetro vs Argumento** — Parâmetro é a variável na assinatura da função (`fn(x)`); argumento é o valor passado na chamada (`fn(42)`).
**Ponteiro** (pointer) — Variável que armazena o endereço de memória de outro valor. Central em C/C++; presente em Go e Rust de forma mais segura.
**REPL** (Read-Eval-Print Loop) — Ambiente interativo que lê expressões, avalia e imprime o resultado em loop. Ex: Python shell, Node.js interativo.
**Recursão** — Técnica onde uma função chama a si mesma, com um caso base que encerra a cadeia. Risco: stack overflow.
**Referência** — Valor que aponta para um objeto em memória em vez de conter o valor diretamente. Atribuir referências compartilha o mesmo endereço.
**Retorno** (return) — Instrução que encerra a execução de uma função e opcionalmente devolve um valor ao chamador.
**Sintaxe** — Conjunto de regras que definem como o código deve ser escrito para ser válido. Erros de sintaxe impedem compilação/interpretação.
**Stack** (pilha de chamadas) — Região de memória LIFO que armazena frames de função. Alocação automática; tamanho fixo.
**Tipo** (type) — Classificação de um valor que define operações permitidas e representação (`int`, `string`, `bool`). Primitivo ou composto.
**Tipagem dinâmica** — O tipo é determinado em runtime e pode mudar. Ex: Python, JavaScript. Mais flexível, mais propenso a erros em runtime.
**Tipagem estática** — O tipo é declarado/inferido em compile time e não muda. Ex: Go, Rust, Java, TypeScript. Erros de tipo detectados antes de rodar.
**Tipagem forte** — O sistema proíbe operações implícitas entre tipos incompatíveis (`"1" + 1` gera erro). Ex: Python, Go, Rust.
**Tipagem fraca** — O runtime faz coerções implícitas de tipo (`"1" + 1 = "11"` em JS). Eixo ortogonal a estático/dinâmico.
**Variável** — Identificador nomeado que referencia um valor armazenado em memória.

### Estruturas de dados e complexidade

**Árvore** — Estrutura hierárquica de nós conectados por arestas, sem ciclos. Base de sistemas de arquivos, DOM, parsers.
**Árvore binária de busca** (BST) — Árvore onde cada nó tem ≤2 filhos e esquerdo < nó < direito. Busca O(log n) balanceada.
**Big-O** — Notação que descreve o comportamento assintótico de tempo/espaço de um algoritmo. O(1), O(log n), O(n), O(n²).
**Complexidade de espaço** — Memória adicional que um algoritmo usa em função do tamanho da entrada.
**Complexidade de tempo** — Quantas operações um algoritmo executa em função do tamanho da entrada `n`.
**Dicionário** (hashmap, map) — Estrutura que mapeia chaves únicas a valores com acesso médio O(1). Base de caches e índices.
**Fila** (queue) — Estrutura FIFO: inserção no fim, remoção no início. Usada em filas de tarefas, BFS, mensageria.
**Grafo** — Conjunto de nós (vértices) conectados por arestas. Base de redes sociais, mapas, dependências.
**JSON** (JavaScript Object Notation) — Formato de serialização textual chave-valor. Padrão de facto para APIs REST.
**Lista** (list, linked list) — Coleção ordenada de elementos. Lista encadeada: inserção O(1), acesso O(n).
**Pilha** (stack) — Estrutura LIFO: inserção e remoção no topo. Usada em histórico, avaliação de expressões, DFS.
**Registro** (struct, record) — Tipo composto que agrupa campos de tipos diferentes sob um nome.
**Set** (conjunto) — Coleção de elementos únicos sem ordem garantida. Operações de pertencimento O(1). Útil para deduplicação.
**Tabela hash** — Implementação de dicionário que usa função hash para mapear chaves a índices.
**Tupla** — Coleção ordenada de tamanho fixo, geralmente imutável. Usada para retornar múltiplos valores.

### Paradigmas de programação

**Abstração** — Esconder detalhes de implementação expondo apenas a interface necessária.
**Callback** — Função passada como argumento para ser chamada quando uma operação assíncrona concluir. Excesso de aninhamento gera "callback hell".
**Classe** — Template que define atributos e métodos compartilhados por objetos de um tipo.
**Closure** — Função que captura e mantém acesso a variáveis do escopo onde foi definida, mesmo após esse escopo encerrar.
**Composição vs Herança** — Composição ("has-a") agrega comportamentos via referências; herança ("is-a") deriva de classes pai. Composição é geralmente preferida.
**Currying** — Transformação de função com múltiplos parâmetros em cadeia de funções de um parâmetro: `fn(a)(b)(c)`.
**Declarativo** — Paradigma onde o código descreve *o que* computar, não *como*. Ex: SQL, HTML.
**Efeito colateral** (side effect) — Qualquer mudança de estado observável fora do escopo da função (escrita em arquivo, mutação global, rede).
**Encapsulamento** — Restringir acesso direto ao estado interno de um objeto, expondo-o via métodos públicos.
**Função de ordem superior** — Função que recebe ou retorna outra função. Ex: `map`, `filter`, `reduce`.
**Função pura** — Dados os mesmos argumentos, sempre retorna o mesmo resultado e não produz efeitos colaterais.
**Herança** — Classe filha herda atributos/métodos da classe pai, podendo sobrescrevê-los.
**Imperativo** — Paradigma onde o código descreve *como* computar via sequências de instruções que alteram estado.
**Interface** — Contrato que define quais métodos um tipo deve implementar, sem fornecer implementação.
**Mixin** — Padrão de composição que adiciona métodos a uma classe sem herança formal.
**Objeto** — Instância de uma classe com estado (atributos) e comportamento (métodos).
**Orientado a eventos** — Fluxo determinado por eventos (cliques, mensagens, I/O) capturados por handlers. Base de UIs e servidores assíncronos.
**Orientado a objetos** (OOP) — Organiza código em objetos com estado e comportamento via herança, encapsulamento, polimorfismo e abstração.
**Paradigma funcional** — Trata computação como avaliação de funções puras, evita estado mutável e efeitos colaterais.
**Paradigma reativo** — Baseado em fluxos de dados assíncronos (streams) e propagação automática de mudanças. Ex: RxJS.
**Polimorfismo** — Diferentes tipos respondem à mesma interface de formas distintas. Via herança (runtime) ou generics (compile-time).

### Execução, concorrência e runtime

**Async/Await** — Açúcar sintático sobre Promises/corrotinas para escrever código assíncrono com aparência síncrona.
**Bytecode** — Representação intermediária compilada, executada por uma VM (JVM, CPython). Portável entre plataformas.
**Concorrência** — Capacidade de lidar com múltiplas tarefas ao mesmo tempo (não necessariamente em paralelo).
**Corrotina** (coroutine) — Função que pode ser pausada e retomada, cedendo controle voluntariamente. Base de async/await; mais leve que threads.
**Event Loop** — Mecanismo que monitora a fila de eventos e despacha callbacks quando operações assíncronas completam. Coração do Node.js.
**Garbage Collector** (GC) — Libera automaticamente memória de objetos não mais referenciados. Presente em Java, Python, Go, JS.
**Goroutine** — Unidade de concorrência leve do Go, gerenciada pelo runtime. Criada com `go fn()`; comunicam via channels.
**I/O-bound vs CPU-bound** — I/O-bound espera rede/disco (beneficia de async); CPU-bound processa (beneficia de paralelismo real).
**JIT** (Just-In-Time) — Compilação de bytecode para nativo em runtime, identificando hot paths. Usado em JVM e V8.
**Paralelismo** — Execução simultânea em múltiplos núcleos de CPU. Distinto de concorrência (que pode ser single-threaded).
**Processo** — Instância de um programa em execução com espaço de memória próprio, isolado de outros.
**Promise** — Objeto que representa o resultado futuro de uma operação assíncrona (pendente, resolvida, rejeitada).
**Race condition** — Bug onde o resultado depende da ordem não determinística de execução de threads concorrentes.
**Runtime** — Ambiente de execução que fornece GC, I/O, threading. Ex: Node.js, CPython, JVM.
**Thread** — Unidade de execução dentro de um processo, compartilhando memória. Exige sincronização (mutex, locks).
**Vazamento de memória** (memory leak) — Memória alocada que nunca é liberada. Com GC, causado por referências retidas acidentalmente.

### Linguagens populares

**Bash/Shell** — Scripting de terminal Unix/Linux. Citado para automatizar tarefas de sistema, CI/CD, deploy.
**C** — Compilada de baixo nível, acesso direto a memória. Citado em SOs, drivers, performance crítica.
**C#** — Linguagem estática da Microsoft, ecossistema .NET. Citado em apps Windows, Unity, APIs corporativas.
**C++** — Extensão de C com OOP e templates. Citado em jogos (Unreal), embarcados, computação gráfica.
**CSS** — Linguagem de estilos para HTML. Citado ao falar de visual, layout, responsividade, animações.
**Go** (Golang) — Compilada, tipada, concorrência nativa via goroutines. Citado em backends performáticos, CLIs, microsserviços, infra.
**HTML** — Marcação estrutural para páginas web. Citado ao falar de estrutura, templates, SEO semântico.
**Java** — Estática, OOP, JVM. Citado em sistemas corporativos, Android nativo, Spring.
**JavaScript** (JS) — Interpretada dinâmica, única nativa do browser. Citado em frontend, Node.js, scripts, integrações.
**Kotlin** — Estática moderna da JetBrains, interoperável com JVM. Citado em Android, backends Spring modernos.
**PHP** — Interpretada para web server-side. Citado em WordPress, Laravel, CMS legados.
**Python** — Interpretada, dinâmica, multiparadigma. Citado em automação, data science/ML, backends Django/FastAPI, CLIs.
**Ruby** — Interpretada, focada em produtividade. Citado quase sempre em Rails ou DevOps (Chef, Vagrant).
**Rust** — Compilada com ownership que garante segurança de memória sem GC. Citado em performance extrema, WASM, CLIs.
**SQL** — Declarativa para bancos relacionais. Citado em qualquer operação com dados estruturados.
**Swift** — Compilada da Apple. Citado exclusivamente em iOS/macOS/watchOS/tvOS.
**TypeScript** (TS) — Superset de JS com tipagem estática, compilado para JS. Citado em projetos JS de médio/grande porte.

## Frontend Web e Mobile

### HTML & DOM

**Tag** — Delimitador de elemento HTML, escrito entre `<` e `>`; abertura (`<div>`), fechamento (`</div>`) ou auto-fechamento (`<img />`).
**Elemento** — Unidade completa do HTML: tag de abertura, conteúdo e tag de fechamento; ex: `<p>texto</p>`.
**Atributo** — Propriedade na tag de abertura que modifica comportamento ou metadados; ex: `href`, `class`, `id`, `data-*`.
**HTML Semântico** — Uso de tags com significado (`<header>`, `<nav>`, `<main>`, `<article>`) em vez de `<div>` genérico; melhora acessibilidade e SEO.
**DOM** (Document Object Model) — Representação em árvore do documento HTML em memória, manipulável via JavaScript.
**DOM Virtual** (Virtual DOM) — Representação leve do DOM mantida em memória por frameworks como React; diff determina mínimas atualizações reais.
**Formulário** (`<form>`) — Agrupa inputs para coleta de dados; define método HTTP e ação de envio.
**Input** — Elemento de formulário para entrada de dados; tipos: `text`, `email`, `checkbox`, `radio`, `file`, `range`.
**Validação de formulário** — Verificação de dados antes do envio; nativa do HTML5 (`required`, `pattern`) ou via JS.
**Shadow DOM** — Subárvore DOM encapsulada, isolada do documento principal; base dos Web Components.
**Web Components** — APIs nativas (Custom Elements, Shadow DOM, Templates) para criar componentes reutilizáveis sem framework.
**`<canvas>`** — Elemento para desenho 2D via API JavaScript; usado em jogos, gráficos, manipulação de imagem.
**`<svg>`** — Gráficos vetoriais embutíveis no HTML; escalável sem perda de qualidade.
**Meta tags** — Tags `<meta>` no `<head>` com metadados ao browser e crawlers; charset, viewport, description, Open Graph.

### CSS & Estilo

**Seletor** — Padrão que identifica quais elementos recebem estilo; `div`, `.classe`, `#id`, `[atributo]`, pseudoclasses.
**Especificidade** — Peso calculado de um seletor que determina qual regra prevalece; inline > ID > classe > tag.
**Cascata** — Mecanismo de resolução de conflito entre regras, por origem, especificidade e ordem.
**Box Model** — Espaço de cada elemento: `content` + `padding` + `border` + `margin`; `box-sizing: border-box` inclui padding/border na largura.
**Flexbox** — Layout unidimensional (`display: flex`) para alinhar itens em linha/coluna com `justify-content`, `align-items`.
**CSS Grid** — Layout bidimensional (`display: grid`) com linhas e colunas; ideal para layouts complexos.
**Posicionamento** — `position`: `static`, `relative`, `absolute`, `fixed`, `sticky`.
**z-index** — Controla ordem de empilhamento no eixo Z (profundidade); maior valor fica na frente.
**Media Query** — Aplica estilos condicionalmente por características do dispositivo (`width`, `prefers-color-scheme`).
**Breakpoint** — Valor de largura onde o layout muda via media query; fronteira entre tamanhos de tela.
**Responsividade** — Design que adapta layout a diferentes telas via media queries e unidades relativas.
**Viewport** — Área visível da página; controlada pela meta viewport e unidades `vw`, `vh`.
**Unidades relativas** — `%` (pai), `em` (font do elemento), `rem` (font do root), `vw`/`vh` (viewport).
**Pseudoclasse** — Estilo por estado: `:hover`, `:focus`, `:nth-child()`, `:not()`.
**Pseudoelemento** — Estiliza parte virtual: `::before`, `::after`, `::placeholder`.
**Custom Properties** (CSS Variables) — Variáveis nativas `--nome: valor`, acessadas com `var(--nome)`; cascateiam e são manipuláveis via JS.
**Tailwind CSS** — Framework utility-first com classes atômicas (`flex`, `p-4`, `text-lg`) no HTML; gera só o CSS usado.
**CSS-in-JS** — CSS dentro de JS (styled-components, Emotion); estilos escopados por componente e dinâmicos.
**Sass/SCSS** — Pré-processador com variáveis, nesting, mixins; compilado para CSS puro.
**CSS Modules** — Escopa localmente nomes de classes por arquivo, evitando colisões.
**Design Tokens** (no front) — Variáveis (CSS/JSON/TS) com valores de design (cores, espaçamentos, tipografia); fonte única da verdade visual.

### JavaScript no Browser

**Evento** — Sinal disparado pelo browser por ação do usuário/sistema (`click`, `input`, `scroll`); capturado via `addEventListener`.
**Event Bubbling** — Propagação de evento do alvo aos ancestrais; `stopPropagation()` interrompe.
**Event Delegation** — Escutar eventos num ancestral comum em vez de cada filho; eficiente para listas dinâmicas.
**Fetch API** — API nativa para requisições HTTP assíncronas via Promises; substitui `XMLHttpRequest`.
**AJAX** — Atualizar partes da página sem recarregar via requisições assíncronas; hoje via Fetch ou axios.
**localStorage** — Armazenamento chave-valor persistente por origem; síncrono, ~5MB, só via JS.
**sessionStorage** — Como localStorage, mas expira ao fechar a aba/sessão.
**Cookies** — Dados armazenados no browser e enviados automaticamente nas requisições; `Secure`, `HttpOnly`, `SameSite`.
**SPA** (Single Page Application) — Carrega uma página HTML e atualiza conteúdo via JS sem recarregar.
**SSR** (Server-Side Rendering) — HTML gerado no servidor a cada requisição; melhora SEO e primeiro conteúdo.
**SSG** (Static Site Generation) — HTML gerado em build time; arquivos estáticos servidos de CDN.
**ISR** (Incremental Static Regeneration) — Next.js regenera páginas estáticas em background após intervalo, sem rebuild completo.
**Hydration** — JS client-side "ativa" HTML estático de SSR/SSG, conectando listeners e estado.
**Lazy Loading** — Carregamento adiado de recursos até serem necessários; reduz bundle inicial.
**Code Splitting** — Divisão do bundle JS em chunks carregados sob demanda; via `import()` dinâmico.
**Service Worker** — Script em background que intercepta requisições; base para PWA (offline, push).
**Web Worker** — Script JS em thread separada para processamento pesado sem bloquear a UI.

### React & Frameworks

**React** — Biblioteca JS para UIs baseada em componentes (Meta); usa Virtual DOM.
**Componente React** — Função/classe que recebe `props` e retorna JSX; unidade de composição.
**JSX** — Sintaxe que permite markup tipo HTML dentro de JS; compilado para `React.createElement()`.
**Props** — Dados passados de pai para filho; somente leitura no filho.
**State** (estado) — Dados internos do componente que, ao mudar, disparam re-render; via `useState`.
**`useState`** — Hook que declara variável de estado e função atualizadora.
**`useEffect`** — Hook para efeitos colaterais (fetch, subscriptions) após render; array de dependências controla execução.
**`useRef`** — Persiste valor mutável entre renders sem re-render; também acessa elementos DOM.
**`useMemo` / `useCallback`** — Memoização: `useMemo` guarda resultado de cálculo; `useCallback` guarda referência de função.
**Hook customizado** — Função que usa hooks internos para encapsular lógica reutilizável; nome começa com `use`.
**Context API** — Compartilha dados entre componentes sem prop drilling; `createContext` + `Provider` + `useContext`.
**Prop Drilling** — Anti-padrão de passar props por camadas intermediárias que não as usam; resolvido com Context.
**Controlled Component** — Input cujo valor é controlado pelo state React (`value` + `onChange`).
**Next.js** — Framework React full-stack com SSR, SSG, ISR, API Routes, App Router; principal escolha para produção.
**React Server Components** (RSC) — Componentes que rodam só no servidor, sem JS no cliente; padrão no App Router.
**App Router** (Next.js) — Roteamento por diretório `app/` com RSC, layouts aninhados e Server Actions.
**Vue.js** — Framework progressivo com sistema reativo (Options/Composition API); templates `.vue`.
**Angular** — Framework completo da Google com TS, DI, decorators, RxJS; opinionado, enterprise.
**Svelte** — Compila componentes em JS imperativo sem virtual DOM; menor bundle.
**SolidJS** — Framework reativo sem Virtual DOM; reatividade granular; `createSignal` similar ao `useState`.
**Redux** — State management global imutável com actions e reducers; verboso mas predizível.
**Zustand** — State management minimalista para React; API simples baseada em store com hooks.
**React Query** (TanStack Query) — Gerencia estado de dados assíncronos (fetch, cache, sincronização, invalidação).

### Build & Tooling

**Bundler** — Agrupa arquivos JS/CSS/assets em bundles otimizados; Webpack, Vite, Rollup, Parcel.
**Webpack** — Bundler configurável e maduro, padrão histórico do React; extensível via plugins/loaders.
**Vite** — Bundler/dev server moderno baseado em ES Modules; dev ultra-rápido; build via Rollup.
**Rollup** — Bundler otimizado para bibliotecas; bundles ESM limpos com tree shaking.
**Transpiler** — Converte código de uma versão/sintaxe para outra; TS→JS, JSX→JS, ES2022→ES5.
**Babel** — Transpiler JS amplamente usado; converte sintaxe moderna e JSX em JS compatível.
**SWC** — Transpiler em Rust, muito rápido; substitui Babel no Next.js e Vite.
**npm** — Gerenciador de pacotes padrão do Node.js; dependências em `package.json`, instaladas em `node_modules`.
**yarn** — Gerenciador alternativo ao npm; cache rápido; workspaces para monorepos.
**pnpm** — Gerenciador com armazenamento via hard links; rápido e econômico; preferido em monorepos.
**`package.json`** — Manifesto do projeto Node.js: metadados, scripts, dependências.
**`node_modules`** — Diretório de dependências instaladas localmente; nunca commitado; reproduzido via `npm install`.
**Lock file** (`package-lock.json`, `pnpm-lock.yaml`) — Congela versões exatas para builds reproduzíveis.
**Tree Shaking** — Eliminação de código não utilizado durante o build; depende de módulos ES estáticos.
**Minificação** — Compressão de JS/CSS removendo whitespace e encurtando nomes; reduz tamanho entregue.
**Source Map** — Mapeia código minificado de volta ao fonte original; permite debug legível no DevTools.
**Hot Reload / HMR** — Substituição de módulos no browser em dev sem recarregar; preserva estado.
**ESLint** — Linter estático para JS/TS; detecta erros e enforça convenções.
**Prettier** — Formatador de código opinativo; estilo consistente.
**`.env`** — Variáveis de ambiente para config local; em Next.js, prefixo `NEXT_PUBLIC_` expõe ao browser.

### Performance Web

**Core Web Vitals** — Métricas do Google de qualidade de experiência: LCP, CLS e INP.
**LCP** (Largest Contentful Paint) — Tempo até o maior elemento de conteúdo renderizar; meta < 2.5s.
**CLS** (Cumulative Layout Shift) — Soma de deslocamentos inesperados de layout; meta < 0.1.
**INP** (Interaction to Next Paint) — Latência da interação mais lenta; meta < 200ms; substitui FID.
**FCP** (First Contentful Paint) — Tempo até o primeiro pixel de conteúdo renderizar.
**TTFB** (Time to First Byte) — Tempo até o primeiro byte de resposta; mede latência do servidor.
**Lighthouse** — Ferramenta de auditoria do Google (Chrome DevTools): performance, acessibilidade, SEO.
**CDN** (Content Delivery Network) — Servidores distribuídos que servem assets do ponto mais próximo do usuário.
**Cache do browser** — Armazenamento local de recursos; controlado por `Cache-Control`, `ETag`, `Expires`.
**Prefetch / Preload** — Buscar recursos antecipadamente; `preload` para recurso crítico atual, `prefetch` para navegação futura.
**Image Optimization** — Reduzir peso de imagens: WebP/AVIF, lazy loading, `srcset` responsivo, dimensões explícitas.

### UI Libraries & Componentes

**Component Library** — Componentes UI pré-construídos reutilizáveis; shadcn/ui, Material UI, Ant Design, Radix UI.
**shadcn/ui** — Componentes React acessíveis (Radix UI + Tailwind); código é copiado para o projeto, totalmente customizável.
**Material UI** (MUI) — Componentes React baseados no Material Design; tema via `ThemeProvider`.
**Radix UI** — Componentes headless (sem estilo) com foco em acessibilidade; base do shadcn/ui.
**Storybook** — Desenvolvimento isolado de componentes UI; visualizar, documentar e testar fora da app.

### Mobile

**App Nativo** — Desenvolvido na linguagem oficial da plataforma (Swift/SwiftUI iOS, Kotlin/Compose Android); máximo acesso ao SO.
**App Híbrido** — Código compartilhado entre plataformas (React Native, Flutter); compila para nativo ou WebView.
**PWA** (Progressive Web App) — App web instalável, offline via Service Worker, com push; roda no browser.
**React Native** — Framework da Meta para apps cross-platform em JS/React; renderiza componentes nativos reais.
**Expo** — Plataforma sobre React Native com toolchain gerenciado, OTA updates e APIs pré-configuradas.
**Flutter** — Framework da Google para apps cross-platform em Dart; renderiza via engine própria (Skia/Impeller).
**Swift / SwiftUI** — Linguagem e framework declarativo da Apple para iOS/macOS/watchOS.
**Kotlin / Jetpack Compose** — Linguagem e toolkit declarativo da Google para apps Android nativos.
**Deep Link** — URL que abre uma tela específica dentro de um app; via URL schemes (iOS) ou Intent Filters (Android).
**Push Notification** — Mensagem do servidor ao dispositivo com app fechado; via APNs (iOS) ou FCM (Android).
**App Store / Play Store** — Lojas oficiais Apple e Google para distribuição de apps.
**APK / AAB** — APK: pacote de instalação Android direto. AAB: formato moderno da Play Store, gera APKs otimizados por dispositivo.
**OTA Update** — Atualização do código JS de apps React Native sem revisão das stores (Expo Updates, CodePush).

## Backend, APIs e Autenticação

### HTTP & Rede

**Servidor** — Máquina ou processo que aguarda conexões e responde a requisições de clientes; executa o backend.
**Cliente** — Quem inicia a comunicação com o servidor: navegador, app mobile, script ou outro serviço.
**Request (requisição)** — Mensagem do cliente ao servidor com método, URL, headers e opcionalmente body.
**Response (resposta)** — Mensagem do servidor ao cliente com status code, headers e opcionalmente body.
**HTTP** — Protocolo sem estado usado na web para troca de mensagens cliente-servidor.
**HTTPS** — HTTP com criptografia TLS/SSL; todo tráfego criptografado em trânsito, padrão obrigatório em produção.
**GET** — Lê ou busca um recurso; não altera estado; parâmetros na URL.
**POST** — Cria recurso ou envia dados para processamento; body carrega o payload; não idempotente.
**PUT** — Substitui um recurso inteiro; idempotente.
**PATCH** — Atualiza parcialmente um recurso; mais eficiente que PUT para edições pontuais.
**DELETE** — Remove um recurso; idempotente.
**Status 2xx** — Sucesso: 200 OK, 201 Created, 204 No Content.
**Status 3xx** — Redirecionamentos: 301, 302, 304 Not Modified (cache).
**Status 4xx** — Erros do cliente: 400, 401, 403, 404, 422, 429 Too Many Requests.
**Status 5xx** — Erros do servidor: 500, 502, 503, 504.
**Header** — Par chave-valor com metadados: tipo de conteúdo, autenticação, cache.
**Body** — Payload da requisição/resposta; geralmente JSON, XML ou form-data.
**Query string** — Parâmetros após `?` na URL; ex: `/users?page=2&limit=20`.
**Path param** — Segmento variável na URL; ex: `/users/:id`.
**Porta** — Número que identifica um processo de rede; HTTP 80, HTTPS 443, dev 3000/8000.
**DNS** — Traduz nomes de domínio em IPs.
**SSL/TLS** — Protocolo de criptografia que protege a comunicação; TLS é a versão moderna do SSL.
**CORS** (Cross-Origin Resource Sharing) — Política do browser que bloqueia requisições de origens diferentes; o servidor declara origens permitidas via headers.
**Proxy** — Intermediário que encaminha requisições; usado para cache, balanceamento, segurança.
**Reverse proxy** — Proxy na frente dos servidores de aplicação (Nginx, Caddy); roteia tráfego, termina TLS.
**Load balancer** — Distribui requisições entre instâncias para evitar sobrecarga e aumentar disponibilidade.

### APIs

**API** — Contrato que define como sistemas se comunicam: operações, dados aceitos e retornos.
**REST** — Estilo arquitetural que usa HTTP, recursos por URLs e operações mapeadas para métodos HTTP.
**RESTful** — API que segue REST: interface uniforme, sem estado, recursos nomeados.
**Endpoint** — URL específica que representa um recurso/operação; ex: `POST /api/v1/users`.
**GraphQL** — Linguagem de consulta onde o cliente especifica exatamente quais campos quer; evita over/under-fetching.
**Query (GraphQL)** — Operação de leitura; o cliente declara a estrutura exata dos dados.
**Mutation (GraphQL)** — Operação de escrita (criar, atualizar, deletar).
**Resolver (GraphQL)** — Função no servidor que busca os dados de cada campo do schema.
**Schema (GraphQL)** — Definição tipada de tipos, queries e mutations; contrato cliente-servidor.
**gRPC** — Framework de RPC do Google com Protocol Buffers (serialização binária); comum entre microserviços.
**SOAP** — Protocolo de troca de mensagens XML, antigo e verboso; presente em integrações legadas.
**RPC** — Cliente chama uma função no servidor como se fosse local; gRPC e tRPC são modernos.
**tRPC** — Biblioteca TS com type safety ponta a ponta sem geração de código.
**Webhook** — URL que recebe POST de um sistema externo quando um evento ocorre; o sistema avisa você (push).
**Polling** — Cliente faz requisições periódicas para verificar dados novos; simples mas ineficiente.
**WebSocket** — Protocolo bidirecional e persistente sobre TCP; ideal para chat, notificações em tempo real.
**Rate limit** — Restrição ao número de requisições por período; protege de abuso; resposta 429.
**Paginação** — Divide grandes conjuntos em páginas; via offset/limit, cursor ou page number.
**Cursor-based pagination** — Cada página retorna um cursor para o próximo item; mais eficiente para dados que mudam.
**Versionamento de API** — Manter múltiplas versões (`/v1/`, `/v2/`) para não quebrar clientes existentes.
**OpenAPI** (Swagger) — Especificação padrão para descrever APIs REST em YAML/JSON; gera docs e clientes.
**Postman** — Ferramenta para testar, documentar e explorar APIs; coleções, ambientes, testes.
**Idempotência** — Operação que produz o mesmo resultado independente de quantas vezes é executada; GET, PUT, DELETE.
**Payload** — Dados no body de uma requisição/resposta; o conteúdo útil.
**Serialização** — Conversão de estruturas em memória para formato transmissível (JSON, XML, binário).
**Content-Type** — Header que informa o formato do body; `application/json`, `multipart/form-data`.

### Arquitetura de Backend

**Rota** (route) — Mapeamento entre padrão de URL + método HTTP e a função que trata a requisição.
**Controller** — Recebe o request, valida entrada, chama services e retorna response; sem lógica de negócio pesada.
**Service** — Contém a lógica de negócio; orquestra repositórios, APIs externas e outros serviços.
**Repository** — Camada de acesso a dados que abstrai queries; o service não sabe se vêm de SQL, NoSQL ou API.
**Middleware** — Intercepta o request antes do controller; autenticação, logging, validação, parsing, erros.
**ORM** — Mapeia tabelas para objetos na linguagem; manipula dados sem SQL puro. Prisma, TypeORM, SQLAlchemy.
**DTO** (Data Transfer Object) — Objeto que define a estrutura dos dados trafegados entre camadas; validação e tipagem.
**MVC** (Model-View-Controller) — Separa dados (Model), interface (View) e lógica (Controller). Base de Rails, Django.
**Serializer** — Converte objetos do servidor para JSON e valida/converte entrada.
**Injeção de dependência** (DI) — Dependências fornecidas ao componente em vez de criadas por ele; facilita testes. NestJS, Spring.
**Microserviço** — App dividida em serviços pequenos e independentes, cada um com banco e deploy próprios.
**Monólito** — Todo o código roda em um único processo e deploy; simples no início, difícil de escalar seletivamente.
**API Gateway** — Ponto de entrada único para múltiplos microserviços; autenticação, rate limiting, roteamento.
**BFF** (Backend for Frontend) — Backend especializado por tipo de cliente (web, mobile) que agrega dados na medida certa.
**CQRS** — Separa operações de leitura (queries) e escrita (commands) em modelos distintos.
**Event sourcing** — Estado derivado de uma sequência imutável de eventos em vez de sobrescrever dados; facilita auditoria.

### Runtimes e Frameworks

**Node.js** — Runtime JS no servidor (V8); event loop assíncrono não bloqueante; ideal para APIs e I/O.
**Express** — Framework minimalista para Node.js; roteamento e middleware sem opinião.
**Fastify** — Alternativa ao Express com foco em performance; serialização JSON rápida, schema nativo.
**NestJS** — Framework Node.js com TS, DI, decorators e estrutura opinada (inspirado no Angular); APIs corporativas.
**Django** — Framework Python completo com ORM, admin, auth e migrations; convenção sobre configuração.
**Flask** — Microframework Python minimalista; flexível, sem ORM/auth nativos.
**FastAPI** — Framework Python baseado em type hints; gera OpenAPI automaticamente, validação Pydantic, async nativo.
**Rails** — Framework Ruby com convenções fortes, ORM ActiveRecord e scaffolding.
**Laravel** — Framework PHP com ecossistema rico, ORM Eloquent, filas, auth.
**Spring** (Boot) — Framework Java/Kotlin corporativo com DI e configuração automática.
**Bun** — Runtime JS alternativo ao Node.js; rápido, inclui bundler, test runner e package manager nativos.
**Deno** — Runtime JS/TS seguro por padrão com permissões explícitas; TS nativo sem transpilação.

### Autenticação & Autorização

**Autenticação** (AuthN) — Verifica quem é o usuário ("você é quem diz ser?"); senha, token, biometria.
**Autorização** (AuthZ) — Verifica o que o usuário pode fazer; após autenticação.
**OAuth / OAuth 2.0** — Framework de autorização que permite acesso a recursos em nome do usuário sem expor senha ("Login com Google"); flows como Authorization Code.
**JWT** (JSON Web Token) — Token compacto e assinado com claims do usuário; verificável sem consultar o banco.
**Token** — String que representa uma sessão/identidade autenticada; apresentada em cada requisição.
**Access token** — Token de curta duração para acessar recursos protegidos.
**Refresh token** — Token de longa duração usado só para obter novos access tokens sem reautenticar.
**Bearer token** — Access token enviado em `Authorization: Bearer <token>`.
**Session** — Estado de autenticação no servidor; o cliente recebe um session ID (cookie).
**Cookie** — Dado no browser enviado automaticamente a cada requisição; `Secure`, `HttpOnly`, `SameSite`.
**API Key** — Chave secreta enviada em cada requisição para identificar/autenticar um cliente; comum servidor-a-servidor.
**SSO** (Single Sign-On) — Uma autenticação dá acesso a múltiplos sistemas.
**2FA/MFA** — Autenticação com dois ou mais fatores: senha + OTP/biometria.
**TOTP** — OTP baseado em tempo, renovado a cada 30s; Google Authenticator, Authy.
**RBAC** (Role-Based Access Control) — Permissões atribuídas a papéis (roles); usuários recebem papéis. Ex: admin, editor, viewer.
**Scopes** — Permissões granulares em tokens OAuth; ex: `read:users`, `write:posts`.
**PKCE** — Extensão do OAuth que protege o flow Authorization Code em clientes públicos (SPAs, mobile).
**Passkey** — Credencial criptográfica (FIDO2/WebAuthn) no dispositivo; substitui senhas com biometria/PIN.
**Auth0 / Clerk / Keycloak** — Plataformas de identidade (IDaaS): Auth0 e Clerk SaaS; Keycloak open-source self-hosted.
**CSRF** — Ataque que força navegador autenticado a fazer requisições indesejadas; mitigado com tokens CSRF e SameSite.
**XSS** — Injeta scripts maliciosos em páginas para roubar tokens/dados.

### Mensageria & Assíncrono

**Message queue** — Sistema de filas persistentes para comunicação assíncrona; RabbitMQ, SQS, BullMQ.
**RabbitMQ** — Message broker open-source (AMQP); roteamento flexível via exchanges; tarefas distribuídas.
**Kafka** — Plataforma de streaming distribuído de alta throughput; log imutável; ideal para alto volume e replay.
**Pub/sub** — Produtores publicam em tópicos e múltiplos consumidores assinam independentemente.
**Worker** — Processo em background que consome mensagens de uma fila e executa tarefas assíncronas.
**Job** — Unidade de trabalho enfileirada; tem parâmetros, status (pending/running/done/failed), retries.
**Dead letter queue** (DLQ) — Fila de mensagens que falharam após N tentativas, para análise/reprocessamento.
**Cron** — Agendador baseado em expressões de tempo (`0 */6 * * *`); executa jobs periodicamente.
**Event-driven** — Componentes reagem a eventos em vez de chamadas diretas; promove desacoplamento.
**BullMQ** — Filas para Node.js baseado em Redis; prioridades, delays, retries, concorrência.
**Celery** — Tarefas distribuídas para Python; Redis ou RabbitMQ como broker; padrão em Django/Flask.
**At-least-once delivery** — Garantia onde a mensagem pode ser entregue mais de uma vez; requer consumers idempotentes.
**Saga** — Padrão para transações distribuídas em microserviços; transações locais com compensações.

### Serverless

**Função serverless** — Unidade stateless que roda em resposta a eventos; o provedor gerencia infra e escala; billing por invocação.
**Lambda** (AWS) — Funções serverless da AWS acionadas por eventos (HTTP, S3, SQS).
**Edge function** — Função serverless em nós de CDN próximos ao usuário, com latência mínima; Cloudflare Workers, Vercel Edge.
**Cold start** — Latência extra na primeira invocação quando o container é inicializado do zero; subsequentes são "warm".
**BaaS** (Backend as a Service) — Funcionalidades de backend prontas (banco, auth, storage, realtime); Supabase, Firebase.
**Firebase** — BaaS do Google com Firestore, Authentication, Storage, Cloud Functions; forte com mobile.
**Supabase** — BaaS open-source sobre PostgreSQL; banco relacional, auth, storage, realtime, Edge Functions.
**Vercel Functions** — Funções serverless integradas ao deploy Vercel; arquivos em `/api/` viram endpoints.
**Cloudflare Workers** — Edge runtime (V8 isolates, não containers); cold start ~zero; roda em 300+ data centers.
**Function timeout** — Limite de tempo máximo de execução; Lambda 15min, Vercel Functions 60s (Pro).

## Bancos de Dados e Dados

### Relacional & SQL

**Banco relacional** — Organiza dados em tabelas com linhas e colunas e relações por chaves. PostgreSQL, MySQL, SQLite.
**Tabela** — Estrutura bidimensional com colunas (atributos) e linhas (registros); equivale a uma entidade.
**Linha** (registro, row) — Um item de dados; uma instância da entidade.
**Coluna** (campo) — Atributo com tipo de dado fixo (ex: `name TEXT`).
**Chave primária** (PK) — Coluna(s) que identifica unicamente cada linha; nunca nula, nunca duplicada.
**Chave estrangeira** (FK) — Coluna que referencia a PK de outra tabela; garante integridade referencial.
**Índice** (index) — Estrutura que acelera buscas em colunas sem varrer a tabela; tem custo de escrita.
**JOIN** — Combina linhas de duas+ tabelas por condição de relação. INNER, LEFT, RIGHT, FULL OUTER.
**Query** — Instrução SQL para recuperar/manipular dados.
**Schema** — Estrutura do banco: tabelas, colunas, tipos, constraints. Em Postgres, também namespace (`public`).
**Normalização** — Organiza o schema para eliminar redundância; formas normais 1NF, 2NF, 3NF, BCNF.
**Desnormalização** — Duplicar/fundir tabelas para ganho de leitura, aceitando redundância.
**Transação** — Grupo de operações atômicas: tudo commita ou tudo reverte (rollback).
**ACID** — Atomicidade, Consistência, Isolamento, Durabilidade; garantem confiabilidade de transações.
**Commit / Rollback** — Commit confirma permanentemente; rollback desfaz operações não commitadas.
**Constraint** — Regra que o banco garante: `NOT NULL`, `UNIQUE`, `CHECK`, `FOREIGN KEY`.
**View** — Query salva que se comporta como tabela virtual; não armazena dados próprios.
**Materialized view** — View cujo resultado é armazenado em disco (snapshot); precisa refresh; muito mais rápida.
**Stored procedure** — Bloco de código SQL armazenado no banco; reduz round-trips, dificulta versionamento.
**Trigger** — Função executada automaticamente antes/depois de INSERT/UPDATE/DELETE; auditoria, validações.
**Migration** — Arquivo versionado que descreve mudança incremental no schema; Flyway, Prisma, Drizzle.
**DDL / DML** — DDL define estrutura (`CREATE`, `ALTER`, `DROP`); DML manipula dados (`SELECT`, `INSERT`, `UPDATE`, `DELETE`).
**PostgreSQL** (Postgres) — Banco relacional open-source robusto; JSON, arrays, RLS, extensões (pgvector); base do Supabase.
**MySQL** — Banco relacional open-source da stack LAMP/LEMP; maduro, amplo suporte.
**SQLite** — Banco embutido em arquivo único, sem servidor; ideal para dev local, mobile, edge.
**UUID** — Identificador único de 128 bits; preferível a `SERIAL` em sistemas distribuídos.
**CTE** (Common Table Expression, `WITH`) — Tabela temporária nomeada na query; legibilidade e recursão.
**Window function** — Opera sobre linhas relacionadas sem agrupá-las; `ROW_NUMBER()`, `RANK()`, `LAG()`.
**Aggregate function** — Reduz múltiplas linhas a um valor; `COUNT()`, `SUM()`, `AVG()`, `MAX()`.

### NoSQL

**NoSQL** — Bancos sem schema relacional fixo nem SQL primário; documentos, chave-valor, coluna larga, grafo; flexibilidade e escala horizontal.
**Banco de documentos** — Armazena documentos semi-estruturados (JSON/BSON); sem schema fixo. MongoDB, Firestore.
**MongoDB** — Banco de documentos NoSQL; BSON, índices, aggregation pipeline, transações multi-documento.
**Firestore** — Banco de documentos NoSQL do Google, serverless, com sincronização realtime; coleções e documentos.
**Chave-valor** — NoSQL mais simples: dado armazenado/recuperado por chave única; rápido para cache e sessões. Redis, DynamoDB.
**Redis** — Banco chave-valor in-memory; cache, filas (pub/sub, streams), sessões, rate limiting.
**Coluna larga** — Dados em colunas agrupadas por família; otimizado para escrita/leitura de grandes volumes. Cassandra, HBase.
**Banco de grafo** — Modela dados como nós e arestas; ideal para relações complexas. Neo4j, Neptune.
**BASE** — Oposto ao ACID para distribuídos: Basically Available, Soft state, Eventually consistent.
**Eventual consistency** — Sem novas escritas, todas as réplicas convergem para o mesmo valor em algum momento.
**DynamoDB** — Banco chave-valor/documentos da AWS, serverless e gerenciado, desempenho previsível em qualquer escala.

### ORM & Acesso

**Prisma** — ORM moderno para TS/JS com schema declarativo, migrations automáticas e client type-safe; padrão em Next.js.
**Drizzle** — ORM TS leve e SQL-first; queries que parecem SQL, sem "mágica"; menor overhead que Prisma.
**SQLAlchemy** — ORM e query builder para Python; modos Core (SQL expressivo) e ORM (mapeamento de classes).
**Query builder** — Constrói queries SQL via API fluente sem abstrair completamente; Knex.js, JOOQ.
**Connection pool** — Conexões mantidas abertas e reutilizadas entre requests; PgBouncer, pooler do Supabase.
**N+1 problem** — Uma query busca N registros e faz mais N queries para dados relacionados; resolvido com JOIN/eager loading.
**Lazy loading / Eager loading** — Lazy carrega relacionados quando acessados (perigoso em loops); eager carrega antecipadamente, evita N+1.
**Seed** — Dados iniciais inseridos para dev/testes/produção (admin padrão, categorias fixas).
**Raw query** — SQL escrito diretamente, sem ORM; para queries complexas que o ORM não expressa bem.
**Connection string** (DSN) — String de config com host, porta, credenciais e nome do banco; `postgresql://user:pass@host:5432/db`.

### Performance & Escala

**EXPLAIN** (query plan) — Mostra como o banco executa uma query: índices, custo, linhas. `EXPLAIN ANALYZE` executa e mede tempo real.
**Sequential scan** — Leitura de todas as linhas; normal em tabelas pequenas, ineficiente em grandes sem índice.
**Index scan** — Leitura via índice para localizar linhas rapidamente; eficiente para queries seletivas.
**Composite index** — Índice sobre múltiplas colunas; eficiente para queries que filtram por todas, na ordem definida.
**Partial index** — Índice sobre um subconjunto de linhas que satisfaz condição (ex: só registros ativos).
**Sharding** — Particionamento horizontal de dados entre servidores; escala escrita, aumenta complexidade.
**Replicação** — Cópia contínua do primário para réplicas; réplicas de leitura aliviam carga.
**Particionamento** — Divide tabela grande em partições por critério (data, range de ID); queries que filtram pela chave evitam escanear tudo.
**Cache** — Armazenamento temporário de resultados; Redis (aplicação), materialized view (banco).
**Deadlock** — Duas+ transações esperam indefinidamente por recursos travados uma pela outra; o banco mata uma.
**Lock** — Controle concorrente que impede modificação simultânea do mesmo dado; row-level, table, advisory.
**MVCC** — PostgreSQL mantém múltiplas versões do dado; leitores não bloqueiam escritores; alta concorrência.
**Vacuum** — Remove versões antigas de linhas (dead tuples) do MVCC, liberando espaço; AUTOVACUUM roda automaticamente.
**PgBouncer** — Pooler de conexões para PostgreSQL; evita esgotar o limite de conexões.

### Segurança de Dados

**RLS** (Row Level Security) — PostgreSQL restringe quais linhas cada role pode ver/modificar, no banco. No Supabase, policies definem acesso.
**Policy** (RLS) — Regra (`CREATE POLICY`) com condição booleana de acesso; `USING (user_id = auth.uid())`.
**Role** — Entidade de autenticação/autorização no banco; permissões concedidas a roles.
**Least privilege** — Conceder só as permissões estritamente necessárias; reduz superfície de ataque.
**SQL injection** — Entrada não sanitizada interpretada como SQL; prevenido com queries parametrizadas/prepared statements.
**Prepared statement** — Query pré-compilada com parâmetros separados dos dados; impede SQL injection.
**Service role key** — Chave do Supabase com permissões de admin que bypassa RLS; só no servidor, nunca no cliente.
**Anon key** — Chave pública do Supabase para acesso sem autenticação; sujeita a RLS.

### Data Engineering

**ETL** (Extract, Transform, Load) — Extrai da fonte, transforma e carrega no destino; padrão tradicional para warehouse.
**ELT** — Carrega dados brutos no destino e transforma lá dentro; padrão moderno em BigQuery/Snowflake + dbt.
**Pipeline de dados** — Sequência automatizada que move, transforma e carrega dados; batch ou streaming.
**Data warehouse** — Banco otimizado para queries analíticas (OLAP) sobre grandes volumes históricos. BigQuery, Redshift, Snowflake.
**Data lake** — Armazena dados brutos em qualquer formato a baixo custo. S3, GCS.
**OLTP vs OLAP** — OLTP: transações rápidas (bancos operacionais). OLAP: queries analíticas agregadas (warehouses).
**BigQuery** — Data warehouse serverless do GCP, cobrado por dados escaneados.
**dbt** — Transformações SQL versionadas e testadas dentro do warehouse (padrão ELT).
**Batch vs Streaming** — Batch: lotes agendados (latência alta). Streaming: evento a evento em tempo real (Kafka, Kinesis).
**CDC** (Change Data Capture) — Captura cada mudança no banco operacional e propaga em tempo real; Debezium lendo o WAL.
**WAL** (Write-Ahead Log) — Log sequencial do PostgreSQL que registra cada mudança; usado para replicação, CDC, recuperação.
**Embedding** (vetor) — Representação numérica densa de um objeto (texto, imagem) gerada por ML; busca por similaridade semântica.
**pgvector** — Extensão do PostgreSQL para armazenar/consultar embeddings; busca por similaridade. Padrão para RAG com Supabase.
**Vector database** — Banco especializado em buscar embeddings por similaridade; Pinecone, Weaviate, Qdrant.
**Backup** — Cópia dos dados para recuperação; full, incremental ou contínuo (PITR).
**PITR** (Point-in-Time Recovery) — Restaurar o banco para qualquer momento passado via WAL + snapshot; Supabase Pro oferece.
**Dump / Restore** — Dump exporta schema+dados (`pg_dump`); restore importa de volta (`pg_restore`, `psql`).

### Modelagem de Dados

**Modelagem de dados** — Definir como dados serão estruturados e relacionados antes de implementar o schema.
**ERD** (Entity-Relationship Diagram) — Diagrama de entidades, atributos e relações; ferramenta central de design de schema.
**Entidade** — Objeto do mundo real representado como tabela; ex: User, Order, Product.
**Cardinalidade** — Quantas instâncias de uma entidade se relacionam com outra: 1:1, 1:N, N:N.
**1:1** — Uma linha de A com no máximo uma de B; FK única em uma das tabelas.
**1:N** — Uma linha de A com múltiplas de B; FK na tabela "muitos".
**N:N** — Linhas de A e B se relacionam mutuamente; implementado com tabela de junção (pivot).
**Tabela de junção** (pivot) — Tabela intermediária que implementa N:N com FKs das duas entidades.
**Star schema** — Tabela fato central conectada a tabelas dimensão; desnormalizado, otimizado para analytics.
**Tabela fato / dimensão** — Fato: métricas/eventos + FKs. Dimensão: descreve o contexto (`dim_product`, `dim_date`).

## DevOps, Infra, Cloud, Observabilidade e Segurança

### CI/CD

**CI** (Continuous Integration) — Integrar código ao repositório principal frequentemente, com testes automáticos a cada push.
**CD** (Continuous Delivery / Deployment) — Delivery automatiza a entrega até ambiente pronto; Deployment faz o deploy em produção automaticamente após testes.
**Pipeline** — Sequência ordenada de etapas automatizadas (build, test, lint, deploy) disparadas por mudança de código.
**Build** — Compilar, empacotar e transformar código em artefato distribuível (binário, imagem Docker, bundle).
**Deploy** — Colocar uma versão em um ambiente (dev, staging, prod); manual ou automatizado.
**Rollback** — Reversão para versão anterior após deploy problemático.
**Blue-green deployment** — Dois ambientes idênticos (blue=atual, green=novo); tráfego chaveado após validação; rollback instantâneo.
**Canary deployment** — Liberar nova versão gradualmente para uma fatia pequena, monitorando antes de expandir.
**GitHub Actions** — CI/CD nativo do GitHub via workflows YAML, disparados por push, PR ou cron.
**Artifact** — Produto do build (`.jar`, imagem Docker, `.zip`) armazenado e reutilizado nas etapas seguintes.
**Ambiente dev / staging / prod** — Dev: desenvolvimento; staging: réplica de prod para validação (homologação); prod: live, usuários reais.
**Feature flag** (toggle) — Ativa/desativa funcionalidades em runtime sem deploy; controle por usuário, tenant ou porcentagem.
**Smoke test** — Testes mínimos após deploy para verificar funções críticas antes de testes mais profundos.

### Containers & Orquestração

**Docker** — Empacota aplicações e dependências em containers isolados; roda igual em qualquer ambiente.
**Container** — Unidade de software isolada com código, runtime, libs e config; mais leve que VM (compartilha o kernel).
**Imagem Docker** — Template imutável e versionado de onde containers são criados; construída via `Dockerfile`.
**Dockerfile** — Instruções de como construir uma imagem: base, dependências, build, ponto de entrada.
**Registry** — Repositório de imagens Docker (Docker Hub, GHCR, ECR).
**Docker Compose** — Define e roda apps multi-container via YAML (`docker-compose.yml`).
**Kubernetes** (K8s) — Orquestração de containers: deploy, escalonamento e gerenciamento em clusters.
**Pod** — Menor unidade deployável no K8s; agrupa containers que compartilham rede e armazenamento.
**Node** — Máquina (física/virtual) que compõe um cluster e executa os pods.
**Cluster** — Conjunto de nodes K8s que executam workloads; control plane + worker nodes.
**Helm** — Gerenciador de pacotes para K8s; empacota recursos em "charts" reutilizáveis.
**Orquestração** — Gerenciamento automatizado de containers: scheduling, health checks, restart, balanceamento, escalonamento.
**Volume** (Docker) — Persistência de dados além do ciclo de vida do container.
**Ingress** (K8s) — Gerencia acesso externo HTTP/HTTPS aos serviços, com roteamento por host/path e TLS.

### Cloud & Hospedagem

**Cloud** — Recursos computacionais via internet, sob demanda, pagamento por uso.
**IaaS / PaaS / SaaS** — IaaS: infra bruta (EC2). PaaS: infra+runtime gerenciados (Heroku, Railway). SaaS: software completo (Slack, Linear).
**VPS** (Virtual Private Server) — Servidor virtual com recursos dedicados em host compartilhado; mais controle que PaaS. Ex: Hostinger VPS.
**AWS / GCP / Azure** — Maiores provedores cloud: Amazon, Google, Microsoft.
**Vercel** — PaaS focado em frontend e serverless functions; deploy via git, CDN global, nativo a Next.js.
**Railway** — PaaS que simplifica deploy de backends, bancos e workers; cobra por uso.
**Coolify** — PaaS self-hosted open-source (alternativa Heroku/Railway) em VPS própria; Docker, deploy via git.
**Hostinger** — Provedor de hospedagem/VPS; usado na PD para VPS Master (produção) e VPS Dev.
**Autoscaling** — Aumenta/diminui instâncias automaticamente com base em métricas de demanda.
**Serverless** — Provedor gerencia toda a infra; o dev só escreve funções executadas sob demanda. Lambda, Vercel Functions.
**Edge** — Computação próxima ao usuário final (edge nodes do CDN); latência mínima.
**Object storage** — Armazenamento de arquivos não-estruturados via API; AWS S3, Supabase Storage.

### Infra como Código

**IaC** (Infrastructure as Code) — Definir e provisionar infra via arquivos versionados (git, review, CI).
**Terraform** — Ferramenta IaC da HashiCorp que provisiona infra multi-cloud via arquivos `.tf`; mantém estado em `terraform.tfstate`.
**Ansible** — Automação e configuração de servidores via playbooks YAML; sem agente (só SSH); hardening.
**Provisionamento** — Criar e configurar recursos de infra (VMs, redes, bancos) antes do deploy.

### Rede

**Domínio** — Nome registrado que identifica um endereço na internet; registrado em Registro.br, GoDaddy.
**Subdomínio** — Prefixo antes do domínio (`app.cadencia.ia.br`); segmenta serviços sem domínio novo.
**Registro A** — Mapeia domínio a um IPv4.
**Registro CNAME** — Aponta um nome para outro nome (alias); mapeia subdomínios a endpoints (Vercel, CDN).
**Registro MX** — Especifica os servidores de email que recebem mensagens para um domínio.
**Registro TXT** — Texto livre; verificação de domínio (SPF, DKIM, DMARC) e validação de serviços.
**SPF / DKIM** — SPF lista servidores autorizados a enviar email; DKIM assina emails criptograficamente. Reduzem spoofing.
**TTL** — Tempo de cache de um registro DNS; TTL baixo permite mudanças rápidas, aumenta carga.
**Proxy / Reverse proxy** — Proxy encaminha requisições de clientes; reverse proxy fica na frente dos servidores (Nginx, Caddy, Cloudflare).
**Nginx** — Servidor web e reverse proxy de alto desempenho; serve estáticos, faz proxy, termina SSL.
**Firewall** — Filtra tráfego de rede por regras (IP, porta, protocolo); bloqueia acessos não autorizados.
**VPN** — Túnel criptografado que conecta redes/usuários remotos de forma segura.
**SSH** (Secure Shell) — Protocolo criptografado para acesso remoto a terminais; autenticação por senha ou par de chaves.
**Cloudflare** — CDN, DNS, proteção DDoS e proxy reverso; oculta o IP real do servidor e filtra tráfego.
**Certificado SSL/TLS** — Arquivo de uma CA que autentica o servidor e habilita HTTPS.
**Let's Encrypt** — CA gratuita e automatizada que emite certificados SSL/TLS; integrada em Certbot, Caddy, Coolify.

### Observabilidade

**Observabilidade** — Entender o estado interno de um sistema a partir de suas saídas (logs, métricas, traces).
**Log** — Registro textual e cronológico de eventos; fundamental para debugging e auditoria.
**Métrica** — Medida numérica ao longo do tempo (CPU %, requisições/s, latência p99).
**Trace** (distributed trace) — Caminho completo de uma requisição por múltiplos serviços; identifica gargalos end-to-end.
**Monitoring** — Coleta e análise contínua de métricas e logs para detectar anomalias.
**Alerta** — Notificação automática quando uma métrica cruza um limiar; configurado em Prometheus/Grafana.
**Uptime** — Percentual de tempo disponível; 99.9% ≈ 8.7h de downtime/ano.
**Grafana** — Visualização de métricas e logs; dashboards a partir de Prometheus, Loki, InfluxDB.
**Prometheus** — Coleta e armazena métricas via pull; PromQL; padrão no ecossistema K8s.
**Loki** — Agregação de logs do ecossistema Grafana; indexa só metadados (labels); eficiente.
**APM** (Application Performance Monitoring) — Monitora performance em profundidade (traces, erros, latência). Datadog, New Relic, Sentry.
**Dashboard** — Painel que consolida métricas, logs e alertas em um só lugar.
**SLA / SLO / SLI** — SLA: acordo contratual de nível de serviço. SLO: meta interna. SLI: métrica que mede o SLO.
**Health check** — Endpoint/verificação que responde se um serviço está operacional; usado por load balancers e orquestradores.
**Error budget** — Margem de degradação tolerada pelo SLO; 99.9% uptime = 0.1% de budget/mês.
**Alloy** (Grafana Alloy) — Agente de coleta de telemetria (sucessor do Grafana Agent); encaminha logs, métricas e traces.

### Segurança

**Vulnerabilidade** — Fraqueza explorável que compromete confidencialidade, integridade ou disponibilidade.
**CVE** — Identificador padronizado para vulnerabilidades conhecidas; ex: `CVE-2021-44228` (Log4Shell).
**OWASP** — Organização que publica o "OWASP Top 10", as vulnerabilidades web mais críticas.
**Criptografia** — Transforma dados em formato ilegível; simétrica (mesma chave) e assimétrica (par público/privado).
**Hashing** — Transformação unidirecional em string de tamanho fixo; armazena senhas sem reversibilidade. bcrypt, Argon2.
**Salt** — Valor aleatório adicionado à senha antes do hashing; impede rainbow table.
**Secret** — Dado sensível (API key, senha, token) que não deve aparecer em código, logs ou repos.
**Variável de ambiente** — Injeta config/secrets em runtime sem hardcodar no código.
**.env** — Arquivo de variáveis de ambiente local; NUNCA commitado (deve estar no `.gitignore`).
**Gerenciador de secrets** — Armazena e distribui secrets com controle de acesso e auditoria; 1Password, Vault, AWS Secrets Manager.
**1Password** — Gerenciador de senhas/secrets com Service Accounts para acesso headless via CLI (`op`); fonte única de credenciais na PD.
**Pentest** — Teste de segurança que explora vulnerabilidades de forma controlada antes de atacantes reais.
**Hardening** — Reduzir a superfície de ataque desabilitando serviços, aplicando patches e políticas restritivas.
**Zero trust** — Nenhuma rede/usuário é confiável por padrão; toda requisição exige autenticação e autorização.
**DDoS** — Sobrecarrega um serviço com tráfego massivo de múltiplas origens, tornando-o inacessível.
**Rate limiting** — Limita requisições por intervalo; mitiga DDoS, scraping, brute force.
**Cloudflare WAF** — Web Application Firewall que filtra tráfego malicioso na borda (XSS, SQLi) antes do servidor.

### Processos & Gestão de Incidentes

**Incidente** — Evento não planejado que degrada/interrompe um serviço; classificado por severidade (P1=crítico, P2=alto).
**Postmortem** — Análise retrospectiva de um incidente focada em causas raiz e ações preventivas; cultura blameless.
**Runbook** — Documento operacional com procedimentos passo a passo para tarefas rotineiras ou resposta a incidentes.
**On-call** — Escala de plantão para responder a alertas e incidentes críticos fora do horário comercial.
**Downtime** — Período de indisponibilidade; planejado (manutenção) ou não (incidente); medido contra SLAs.
**MTTR / MTBF** — MTTR: tempo médio para restaurar após falha. MTBF: tempo médio entre falhas.
**Disaster recovery** (DR) — Políticas e procedimentos para recuperar infra e dados após evento catastrófico.
**RTO / RPO** — RTO: tempo máximo aceitável para restaurar. RPO: máxima perda de dados aceitável (define frequência de backup).

## Arquitetura, Padrões, Versionamento, Testes e Metodologias

### Arquitetura de Software

**Monolito** — Todos os módulos implantados como uma única unidade; simples no início, difícil de escalar/manter.
**Microserviços** — App dividida em serviços pequenos e independentes, cada um com banco e deploy próprios.
**Monorepo** — Repositório único com múltiplos projetos/serviços; facilita compartilhamento e refactoring cross-project (Turborepo, Nx).
**SOA** (Service-Oriented Architecture) — Serviços que se comunicam via protocolos padronizados; precursor dos microserviços.
**Event-Driven Architecture** (EDA) — Componentes se comunicam por eventos assíncronos num barramento (Kafka, RabbitMQ).
**Arquitetura Hexagonal** (Ports and Adapters) — Isola o núcleo de negócio de dependências externas via portas (interfaces) e adaptadores.
**Clean Architecture** — Camadas concêntricas (Entities → Use Cases → Adapters → Frameworks); dependências apontam para dentro.
**DDD** (Domain-Driven Design) — Design centrado no domínio, com linguagem ubíqua, bounded contexts, entidades, value objects, agregados.
**MVC / MVVM** — MVC: Model/View/Controller (Rails, Django). MVVM: ViewModel expõe dados via data binding (frontends modernos).
**Camadas** (Layered) — Código em camadas horizontais (apresentação, aplicação, domínio, infra); cada camada depende da de baixo.
**Acoplamento** — Grau de dependência entre módulos; baixo acoplamento é desejável.
**Coesão** — Grau em que os elementos de um módulo pertencem juntos; alta coesão é desejável.
**Escalabilidade Horizontal vs Vertical** — Horizontal (scale out): mais instâncias. Vertical (scale up): mais recursos numa máquina (tem limite físico).
**Stateless vs Stateful** — Stateless não guarda estado entre requisições (essencial para escala horizontal); stateful mantém (websockets, jogos).
**Circuit Breaker** — Interrompe chamadas a um serviço com falhas recorrentes para evitar cascata de erros.
**Strangler Fig** — Migração gradual de monolito para microserviços, substituindo funcionalidades peça a peça.

### Design Patterns & Princípios

**Singleton** — Garante uma única instância de uma classe com acesso global; usar com cuidado (dificulta testes).
**Factory** — Padrão criacional que delega a criação de objetos a métodos/subclasses, desacoplando do cliente.
**Observer** — Um objeto (subject) notifica automaticamente dependentes (observers) quando seu estado muda; base de eventos e reatividade.
**Strategy** — Define família de algoritmos intercambiáveis; troca o comportamento em runtime sem alterar estrutura.
**Adapter** — Converte a interface de uma classe em outra esperada pelo cliente; classes incompatíveis trabalham juntas.
**Decorator** — Adiciona responsabilidades a um objeto dinamicamente, sem herança; middlewares Express, HOCs React.
**Dependency Injection** (DI) — Dependências fornecidas externamente; aumenta testabilidade. Base de NestJS, Spring, Angular.
**IoC** (Inversion of Control) — O controle do fluxo de criação/chamada é invertido para um container/framework; DI é uma implementação.
**SOLID** — Cinco princípios OO: SRP, OCP, LSP, ISP, DIP.
**SRP** (Single Responsibility) — Cada classe/módulo tem uma única responsabilidade.
**OCP** (Open/Closed) — Aberto para extensão, fechado para modificação.
**LSP** (Liskov Substitution) — Subclasses devem substituir as bases sem quebrar comportamento.
**ISP** (Interface Segregation) — Prefira interfaces pequenas e específicas a interfaces gordas.
**DIP** (Dependency Inversion) — Módulos de alto nível e baixo nível dependem de abstrações.
**DRY** (Don't Repeat Yourself) — Cada conhecimento tem representação única; duplicação gera bugs.
**KISS** (Keep It Simple) — Prefira a solução mais simples que funcione.
**YAGNI** (You Aren't Gonna Need It) — Não implemente funcionalidade antes de precisar; evita over-engineering.
**Separation of Concerns** (SoC) — Dividir o sistema em seções com responsabilidades distintas.
**Composition over Inheritance** — Prefira compor comportamentos a hierarquias de herança profundas.

### Qualidade de Código

**Refactoring** — Reestruturar código sem alterar comportamento externo; melhora legibilidade e manutenibilidade. Exige testes antes.
**Code Smell** — Indício de problema estrutural (método longo, classe deus, duplicação) que sugere refactoring.
**Tech Debt** (Dívida Técnica) — Custo de soluções rápidas/subótimas que precisarão ser refeitas; acumula juros.
**Code Review** (PR Review) — Inspeção do código por outro dev antes do merge; bugs, padrões, melhorias, disseminação de conhecimento.
**Pair Programming** — Dois devs no mesmo código: um escreve, outro revisa; reduz bugs e acelera onboarding.
**Legacy Code** — Código sem testes, mal documentado ou obsoleto, difícil de modificar com segurança.
**Boilerplate** — Código repetitivo e estrutural sem lógica de negócio (imports, config, declarações).
**Modularização** — Dividir o código em módulos coesos e independentes com interfaces claras.
**Static Analysis** — Análise do código sem execução, buscando bugs, vulnerabilidades e violações; SonarQube, CodeClimate, type checker.
**Dead Code** — Código que nunca é executado/referenciado; aumenta ruído e deve ser removido.
**Magic Number / String** — Valor literal sem nome (`if status == 3`) que obscurece o significado; usar constantes nomeadas.

### Git & Versionamento

**Git** — Sistema de controle de versão distribuído; cada clone é um repositório completo com histórico inteiro.
**Commit** — Snapshot do estado dos arquivos com mensagem e hash SHA único.
**Branch** — Ponteiro móvel para um commit; permite desenvolvimento paralelo isolado.
**Merge** — Combina duas branches, criando um commit de merge com dois pais; preserva histórico completo.
**Rebase** — Reaplica commits sobre outra branch, reescrevendo histórico em linha linear; não usar em branches públicas.
**Pull Request** (PR) / **Merge Request** (MR) — Proposta de integração de uma branch, com interface para review e aprovação.
**Fork** — Cópia independente de um repositório; contribuir sem acesso de escrita ao original.
**Clone** — Cópia local completa de um repositório remoto, com todo o histórico.
**Push / Pull** — Push envia commits locais ao remoto; pull busca e integra mudanças do remoto.
**Fetch** — Baixa objetos/refs do remoto sem integrar automaticamente.
**Stash** — Salva temporariamente mudanças não commitadas; `git stash pop` reaplica.
**Conflito** (Merge Conflict) — Duas branches modificaram as mesmas linhas de forma incompatível; exige resolução manual.
**HEAD** — Ponteiro que indica o commit atual; geralmente aponta para a branch ativa.
**Tag (Git)** — Referência imutável a um commit; marca releases (`v1.2.3`). Não confundir com a tag de HTML (seção Frontend).
**.gitignore** — Lista padrões de arquivos que o Git deve ignorar (node_modules, .env, builds).
**Cherry-pick** — Aplica um commit específico de uma branch em outra sem merge completo; portar hotfixes.
**Squash** — Combina múltiplos commits em um antes do merge; histórico mais limpo.
**Trunk-Based Development** — Todos integram direto na branch principal com frequência alta, usando feature flags.
**Gitflow** — Modelo de branching com branches dedicadas (main, develop, feature/*, release/*, hotfix/*).
**SemVer** (Versionamento Semântico) — `MAJOR.MINOR.PATCH`: MAJOR breaking, MINOR feature compatível, PATCH bugfix.
**Changelog** — Arquivo (CHANGELOG.md) que documenta mudanças notáveis por versão.
**Conventional Commits** — Mensagens estruturadas (`feat:`, `fix:`, `chore:`) que permitem changelog e bump automáticos.
**Blame** (`git blame`) — Mostra quem modificou cada linha e em qual commit.
**Bisect** (`git bisect`) — Busca binária no histórico para identificar qual commit introduziu um bug.

### Testes

**Teste Unitário** — Testa uma única unidade em isolamento, com dependências mockadas; rápido, base da pirâmide.
**Teste de Integração** — Verifica interação entre múltiplos componentes/camadas (ex: API + banco real).
**Teste E2E** (End-to-End) — Simula fluxos completos do usuário no sistema real (browser + API + banco).
**TDD** (Test-Driven Development) — Teste escrito antes do código: Red → Green → Refactor; força design testável.
**BDD** (Behavior-Driven Development) — Testes em linguagem de negócio (Gherkin: Given/When/Then); colaboração com não-técnicos.
**Mock** — Substitui dependência real com comportamento programado; testa código em isolamento.
**Stub** — Implementação simplificada que retorna valores fixos; mais simples que mock.
**Spy** — Wrapper de função real que registra como foi chamada sem alterar comportamento.
**Fixture** — Dados de teste predefinidos e consistentes para o estado inicial; garante reprodutibilidade.
**Coverage** (Cobertura) — Percentual do código exercitado pelos testes; 100% não garante ausência de bugs.
**Teste de Regressão** — Testa funcionalidades existentes após mudança para garantir que nada quebrou.
**Snapshot Test** — Compara o output renderizado com versão salva; detecta mudanças visuais não intencionais (Jest).
**Jest** — Framework de testes JS/TS com mocking, cobertura, watch mode e snapshots; padrão React/Node.
**Playwright** — Framework E2E que controla browsers reais (Chromium, Firefox, WebKit); robusto e rápido.
**Cypress** — Framework E2E e de componentes com interface visual e time-travel debugging.
**Flaky Test** — Teste que falha intermitentemente sem mudança no código (timing, estado, ordem); corrói confiança.
**Assertion** — Declaração que verifica se um valor é o esperado; se falsa, o teste falha. `expect(result).toBe(42)`.
**Load Testing** — Comportamento do sistema sob carga; k6, Locust, JMeter; latência, throughput, ponto de quebra.

### Metodologias & Processo

**Agile** — Valores e princípios (Manifesto Ágil) que priorizam entrega iterativa, colaboração e resposta a mudanças.
**Scrum** — Framework ágil com papéis (PO, Scrum Master, Dev Team), eventos (sprint, daily, review, retro) e artefatos (backlog).
**Sprint** — Período fixo (1-2 semanas) com compromisso de entregar itens do backlog; resulta em incremento.
**Backlog** — Lista priorizada de trabalho; Product Backlog (geral) e Sprint Backlog (comprometido para a sprint).
**User Story** — Funcionalidade na perspectiva do usuário: "Como [persona] quero [ação] para [benefício]."
**Epic** — Agrupamento de user stories relacionadas (funcionalidade maior); pode durar várias sprints.
**Kanban** — Gestão visual por colunas (To Do, In Progress, Done) com limite de WIP; fluxo contínuo sem sprints fixas.
**Daily** (Standup) — Reunião diária curta (15min): o que fez, o que vai fazer, impedimentos; sincronização, não relatório.
**Retrospectiva** — Ao final da sprint, o time reflete sobre processo e define melhorias; melhoria contínua.
**Story Point** — Unidade relativa de esforço/complexidade; não é tempo direto; calibrada pela velocity.
**MVP** (Minimum Viable Product) — Versão mínima com features suficientes para validar hipóteses; foco em aprendizado.
**Roadmap** — Visão de alto nível do que será construído ao longo do tempo; direção estratégica.
**OKR** (Objectives and Key Results) — Objetivo qualitativo + 2-5 resultados mensuráveis; ciclo trimestral comum.
**Spec** — Documento técnico que define o comportamento esperado de uma feature, com edge cases e critérios de aceitação.
**PRD** (Product Requirements Document) — Descreve o quê e o porquê: problema, objetivos, usuários, requisitos; precede a spec técnica.
**ADR** (Architecture Decision Record) — Registra uma decisão arquitetural: contexto, opções e justificativa; preserva raciocínio.
**Definition of Done** (DoD) — Critérios para considerar uma story completa (código, testes, review, docs, deploy).
**Waterfall** — Metodologia sequencial (requisitos → design → implementação → testes → deploy); baixa adaptabilidade.
**DevOps** — Cultura que une desenvolvimento e operações, automatizando e encurtando o ciclo de entrega.
**WIP** (Work in Progress) — Trabalho iniciado mas não concluído; Kanban limita WIP por coluna.
**Spike** — Tarefa de investigação/PoC com timebox para reduzir incerteza antes de estimar/implementar.
**Lead Time / Cycle Time** — Lead time: da criação à entrega. Cycle time: do início do trabalho ativo à conclusão.
**Throughput** — Itens entregues por unidade de tempo; métrica de fluxo independente de estimativas.

## Inteligência Artificial, LLMs e Machine Learning

### LLMs & Generativo

**LLM** (Large Language Model) — Modelo treinado em grandes volumes de texto que gera, resume, traduz e raciocina sobre linguagem. Base de ChatGPT, Claude, Gemini.
**Modelo** — Arquivo de pesos treinados que define o comportamento; determina capacidades, custo e limite de contexto.
**GPT** (Generative Pre-trained Transformer) — Família de LLMs da OpenAI; o termo é usado genericamente para LLMs de texto.
**Claude** — LLM da Anthropic (Haiku/Sonnet/Opus); foco em segurança, raciocínio longo, contexto grande (até 1M tokens). Modelo padrão deste framework.
**Gemini** — LLMs multimodais do Google DeepMind; via Google AI Studio e Vertex AI.
**Tokenização** — Converte texto em tokens antes do modelo; afeta custo, limite e comportamento em idiomas não-latinos.
**Token (LLM)** — Unidade mínima de processamento de um LLM (palavra, sílaba ou caractere); preço, limites e janela de contexto são medidos em tokens. Não confundir com o token de autenticação (seção Backend).
**Context window** (janela de contexto) — Máximo de tokens que o modelo processa de uma vez (prompt + histórico + resposta).
**Prompt** — Texto de entrada que elicita uma resposta; inclui instrução, contexto e exemplos.
**System prompt** — Instrução de sistema antes da conversa; define persona, restrições, formato e comportamento padrão.
**Prompt engineering** — Redigir e estruturar prompts para maximizar qualidade, consistência e custo-benefício.
**Few-shot / Zero-shot** — Few-shot inclui exemplos no prompt; zero-shot não fornece exemplos.
**Chain-of-thought** (CoT) — Instrui o modelo a externalizar passos de raciocínio antes de concluir; melhora acurácia em lógica/matemática.
**Temperatura** — Parâmetro (0–2) de aleatoriedade; baixo = determinístico, alto = criativo.
**Top-p** (nucleus sampling) — Limita a amostragem ao conjunto mínimo de tokens que somam p%; alternativa à temperatura.
**Streaming** — Retorna tokens incrementalmente conforme gera; reduz latência percebida.
**Alucinação** — Modelo gera informação factualmente incorreta com confiança aparente; risco crítico em precisão factual.
**Jailbreak** — Manipulação de prompt para contornar guardrails e induzir comportamento proibido.
**Guardrails** — Mecanismos de segurança/controle sobre LLMs; de prompt, modelo (fine-tuning) ou aplicação (filtros).
**Parâmetros** (pesos) — Valores internos ajustados no treinamento; modelos maiores têm mais parâmetros (70B = 70 bilhões).

### RAG & Dados

**RAG** (Retrieval-Augmented Generation) — Combina busca em base de conhecimento com geração; injeta trechos relevantes no prompt; reduz alucinação sem retreinar.
**Vetor** — Array numérico de alta dimensão que representa um objeto; similaridade (cosseno) mede proximidade semântica.
**Banco vetorial** (vector store) — Banco otimizado para buscar vetores por similaridade; Pinecone, Weaviate, pgvector, Chroma.
**Chunking** — Divide documentos longos em partes menores antes de gerar embeddings; impacta a qualidade do RAG.
**Similaridade semântica** — Quão próximos dois textos estão em significado, via cosseno entre embeddings; base da recuperação RAG.
**Reranking** — Reordena candidatos recuperados com um modelo mais sofisticado (cross-encoder); melhora precisão.
**Knowledge base** — Documentos, FAQs ou dados indexados para uso em RAG ou pesquisa por agentes.
**Grounding** — Ancorar respostas em fontes verificáveis (documentos, banco, web); reduz alucinação.

### Agentes & Orquestração

**Agente de IA** — Sistema autônomo que usa LLM para planejar e executar ações (tool calls, buscas) até atingir um objetivo.
**Tool use** (function calling) — Capacidade do LLM de invocar funções externas (APIs, banco, shell); retorna JSON com função e argumentos.
**MCP** (Model Context Protocol) — Protocolo aberto da Anthropic para conectar LLMs a dados e ferramentas de forma padronizada; usado por Claude Code.
**Orquestração de agentes** — Coordena múltiplos agentes/chamadas, gerencia fluxo, erros e passagem de contexto.
**Multi-agente** — Múltiplos agentes especializados colaborando; um orquestrador delega subtarefas a sub-agentes.
**Agentic workflow** — Fluxo onde agentes executam tarefas semiautonomamente, iterando e usando ferramentas sem intervenção contínua.
**Memória de agente** — Persistência entre sessões/turnos; curto prazo (contexto), longo prazo (banco externo) ou episódica (logs).
**Sub-agente** — Agente especializado invocado por um orquestrador para uma subtarefa; retorna resultado ao agente pai.
**Harness** — Estrutura de controle que envolve um agente: hooks, permissões, tools, formato de I/O e comportamento em falhas. No pd-framework, o harness do Claude Code é configurado via `settings.json`.

### Fine-tuning & Treino

**Fine-tuning** — Adapta um modelo pré-treinado a uma tarefa/domínio com dados adicionais; menos dados/compute que treino do zero.
**Treinamento** — Ajusta os pesos por exposição a dados e otimização de perda; LLMs grandes demandam clusters de GPUs.
**Dataset** — Conjunto de dados de entrada/saída para treinar, validar ou avaliar; qualidade determina performance.
**Época** (epoch) — Passagem completa pelo dataset de treino; múltiplas épocas com monitoramento de overfitting.
**Overfitting** — Modelo memoriza o treino mas generaliza mal; detectado pela divergência treino × validação.
**Transfer learning** — Reutiliza pesos de modelo treinado em tarefa ampla como ponto de partida; base do pré-treino + fine-tuning.
**LoRA** (Low-Rank Adaptation) — Fine-tuning eficiente que congela pesos originais e treina matrizes de baixo rank; reduz memória GPU.
**RLHF** (Reinforcement Learning from Human Feedback) — Avaliadores humanos classificam respostas para treinar um modelo de recompensa; base do treino do ChatGPT e Claude.
**Distillation** — Treina um modelo menor (student) para imitar um maior (teacher); modelos mais eficientes.
**Inferência** — Fase de uso do modelo treinado para gerar predições; não atualiza pesos; custo/latência de produção.
**Checkpoint** — Snapshot dos pesos em um ponto do treino; permite retomar ou escolher a melhor versão.

### ML Clássico

**Machine learning** (ML) — Sistemas que aprendem padrões a partir de dados sem programar regras explícitas.
**Supervisionado** — Aprendizado com dados rotulados (entrada/saída); classificação, regressão.
**Não-supervisionado** — Sem rótulos; descobre estruturas internas; clustering, redução de dimensionalidade.
**Reforço** (RL) — Agente aprende por tentativa e erro maximizando recompensa via interação com ambiente.
**Classificação** — Prediz a categoria de uma entrada (spam/não-spam, tipo de documento). Métrica: acurácia, F1.
**Regressão** — Prediz valor contínuo (preço, tempo). Métrica: RMSE, MAE.
**Clustering** — Agrupa dados por similaridade sem rótulos (segmentação de clientes). K-means, DBSCAN.
**Feature** — Variável de entrada usada para predições; feature engineering cria representações úteis dos dados brutos.
**Label** — Saída esperada associada a um exemplo no aprendizado supervisionado.
**Rede neural** — Modelo inspirado no cérebro com camadas de neurônios conectados por pesos; base do deep learning.
**Deep learning** — ML com redes neurais profundas; aprende representações hierárquicas de dados brutos (pixels, tokens).
**CNN** (Convolutional Neural Network) — Especializada em dados espaciais (imagens); convoluções detectam padrões locais.
**RNN** (Recurrent Neural Network) — Conexões recorrentes para sequências; predecessora dos transformers, com dificuldade em dependências longas.
**Transformer** — Arquitetura baseada em atenção ("Attention Is All You Need", 2017); base de todos os LLMs modernos.
**Attention** (atenção) — Mecanismo que pondera a importância de partes da entrada ao gerar cada token; viabiliza paralelismo e dependências longas.

### Operação & Custo

**API de LLM** — Interface HTTP para acessar o modelo; endpoints `/messages` (Anthropic) ou `/chat/completions` (OpenAI) com API key.
**Custo por token** — Precificação de APIs de LLM; input e output cobrados separadamente; output custa 3–5x mais.
**Latência** — Tempo até a primeira resposta (TTFT) ou resposta completa; crítico para UX em tempo real.
**Cache de prompt** (prompt caching) — Reutiliza processamento de prefixos idênticos entre requisições; reduz custo e latência para system prompts longos.
**Batch** — Processamento assíncrono de múltiplas requisições agrupadas; desconto de ~50% em troca de latência. Útil para evals.
**Quantização** — Reduz precisão dos pesos (float32 → int8); diminui memória e acelera inferência. Comum em self-hosted.
**GPU** — Hardware de operações matriciais paralelas; essencial para treino e inferência. A100/H100 para LLMs grandes.
**Self-hosted** — Modelos na própria infra (VPS/on-premise); controle total e sem custo por token, mas exige GPU e manutenção.
**OpenRouter** — Agrega múltiplos provedores de LLM numa única API com roteamento e comparação de custo.
**Evals** (avaliação) — Testes automatizados/humanos para medir qualidade, consistência e segurança; "testes unitários" para IA.
**TTFT** (Time To First Token) — Latência até o primeiro token de resposta; relevante para UX de streaming.

### Multimodal

**Visão computacional** (CV) — Processa e interpreta imagens/vídeos; classificação, detecção, segmentação, OCR.
**OCR** (Optical Character Recognition) — Extrai texto de imagens/documentos; Tesseract, Google Vision, Claude com visão.
**Geração de imagem** — Modelos criam imagens a partir de prompts/referências; DALL-E, Stable Diffusion, Midjourney, gpt-image-1.
**Text-to-image** — Geração de imagem condicionada por texto; diffusion models, GANs.
**Speech-to-text** (STT) — Converte fala em texto; Whisper, Google Speech-to-Text, AssemblyAI. Base de transcrição de reuniões.
**Text-to-speech** (TTS) — Converte texto em fala sintética; ElevenLabs, OpenAI TTS.
**Transcrição** — Converte áudio/vídeo em texto; pode incluir timestamps, falantes e pontuação.
**Diarização** — Identifica e separa falantes num áudio ("quem falou o quê"); combinada com transcrição para atas automáticas.
**Multimodal** — Modelos que processam/geram múltiplos tipos de mídia (texto, imagem, áudio, vídeo); GPT-4o, Gemini, Claude com visão.
**WhisperX** — Versão otimizada do Whisper com alinhamento por palavra e diarização; timestamps por palavra.

## Design — UX, Pesquisa e Produto

### UX Fundamentos

**UX** (User Experience) — Percepções e respostas do usuário ao interagir com um produto; utilidade, usabilidade e desejo.
**Usabilidade** — Grau em que um produto permite atingir objetivos com eficácia, eficiência e satisfação.
**User-centered design** (UCD) — Coloca necessidades e limitações do usuário no centro de cada decisão; pesquisa e validação contínuas.
**Design thinking** — Método iterativo em 5 fases (empatizar, definir, idear, prototipar, testar); entende o humano antes da solução.
**Heurísticas de Nielsen** — 10 princípios gerais de usabilidade (visibilidade do status, controle do usuário, prevenção de erros); checklist de avaliação.
**Affordance** — Propriedade que sugere como um elemento pode ser usado; botão em relevo aforda clique.
**Signifier** — Sinal perceptível que comunica como interagir; complementa o affordance (label "clique aqui").
**Feedback** — Retorno imediato do sistema após uma ação, confirmando que foi recebida e processada.
**Carga cognitiva** — Esforço mental para processar informação e completar uma tarefa; bom design minimiza a desnecessária.
**Lei de Fitts** — Tempo para alcançar um alvo depende da distância e do tamanho; elementos acionáveis devem ser grandes e próximos.
**Lei de Hick** — Tempo de decisão aumenta com o número de opções; menus longos violam.
**Lei de Miller** — Memória de trabalho comporta 7 (±2) itens; agrupar conteúdo reduz sobrecarga.
**Mental model** — Representação interna que o usuário tem de como o sistema funciona; bom design alinha-se a ela.
**Fricção** — Obstáculo ou esforço extra na jornada; pode ser intencional (confirmar exclusão) ou indesejada.
**Dark pattern** — Design enganoso que induz a ações não desejadas (cancelamento difícil, opt-out escondido).
**Consistência** — Uso uniforme de padrões visuais, linguagem e comportamento; reduz carga cognitiva.
**Acessibilidade** (a11y) — Grau em que um produto pode ser usado por pessoas com diferentes capacidades; guiada por WCAG.
**Responsive design** — Interface que se adapta fluidamente a diferentes tamanhos de tela.
**Mobile-first** — Estratégia que prioriza a experiência em tela pequena antes de escalar para telas maiores.

### Pesquisa

**Pesquisa de usuário** (user research) — Métodos para entender comportamentos, necessidades e motivações; informa produto e design.
**Entrevista** — Coleta qualitativa via conversa estruturada/semi-estruturada para explorar motivações e contextos.
**Persona** — Representação fictícia, baseada em pesquisa, de um segmento de usuários; perfil, objetivos, frustrações, contexto.
**Mapa de empatia** — Organiza o que o usuário diz, pensa, faz e sente; desenvolve empatia e identifica lacunas.
**Jornada do usuário** (user journey) — Etapas que o usuário percorre para atingir um objetivo, com touchpoints, emoções e fricções.
**Job to be done** (JTBD) — Enquadra necessidades como "trabalhos" que o usuário contrata o produto para fazer; foca no progresso desejado.
**Teste de usabilidade** — Usuários reais executam tarefas enquanto observadores identificam dificuldades; moderado ou não.
**A/B test** — Experimento que expõe dois grupos a variações diferentes para determinar qual performa melhor.
**Card sorting** — Participantes agrupam itens em categorias; informa arquitetura de informação e modelos mentais.
**Tree testing** — Avalia se a hierarquia de navegação permite encontrar informações com facilidade.
**Pesquisa qualitativa vs quantitativa** — Qualitativa entende o "porquê" (entrevistas, observação); quantitativa mede padrões em escala.
**Insight** — Descoberta não óbvia sobre comportamento/necessidade do usuário com potencial de gerar decisões.
**Hipótese** — Afirmação testável: "Acreditamos que [ação] resultará em [outcome] para [usuário]."
**Feedback loop** — Ciclo de coletar, analisar e incorporar feedback no produto; quanto menor, mais rápida a aprendizagem.
**NPS** (Net Promoter Score) — Mede lealdade: "de 0 a 10, quanto recomendaria?"; promotores, neutros, detratores.
**CSAT** — Métrica de satisfação pontual, coletada após interação específica.
**Diary study** — Participantes registram experiências ao longo do tempo; captura comportamento em contexto real.

### Arquitetura de Informação

**Arquitetura de informação** (IA) — Organiza, estrutura e rotula conteúdo para facilitar encontrabilidade; navegação, taxonomia, hierarquia.
**Sitemap** — Diagrama hierárquico de todas as páginas/seções e suas relações; planeja a navegação.
**Fluxo do usuário** (user flow) — Caminho que o usuário percorre para completar uma tarefa específica.
**Taxonomia** — Sistema de classificação de conteúdo em categorias; define como itens são nomeados e agrupados.
**Navegação** — Elementos (menus, breadcrumbs, links) que permitem mover-se pelo produto; previsível e consistente.
**Hierarquia** — Organização por importância visual/estrutural; orienta o olhar e comunica prioridade.
**Findability** (encontrabilidade) — Facilidade de localizar informação específica; depende de taxonomia, busca e navegação.
**Breadcrumb** — Trilha que mostra o caminho percorrido na hierarquia; facilita orientação e retorno.

### Processo de Design

**Wireframe** — Esquema de baixa fidelidade sem cores/tipografia final; foca em layout, hierarquia e funcionalidade.
**Mockup** — Representação estática de alta fidelidade com visual final (cores, tipografia, imagens); não interativo.
**Protótipo** — Versão simulada que permite testar interações e fluxos antes do dev; lo-fi (papel) ou hi-fi (digital).
**Lo-fi / Hi-fi** — Lo-fi: baixa fidelidade, rápido (estrutura). Hi-fi: alta fidelidade, representa o produto final.
**Fidelidade** — Nível de detalhe e acabamento de um artefato; de esboço a pixel-perfect com interação.
**MVP / MMP** — MVP: mínimo para validar hipóteses. MMP (Minimum Marketable Product): mínimo lançável com valor de mercado.
**Iteração** — Ciclo de melhoria incremental baseado em feedback validado.
**Double diamond** — Processo em 4 fases (descobrir, definir, desenvolver, entregar); alterna pensamento divergente e convergente.
**Sprint de design** — Processo intensivo de 5 dias (Google Ventures) para responder questões via protótipo e teste.
**Handoff** — Entrega do design para o dev com specs, assets e documentação; Figma automatiza parte.
**Design critique** — Sessão de revisão com feedback construtivo focado em objetivos do usuário, não em preferências pessoais.

### Produto & Métricas

**Product design** — Integra UX, UI e estratégia para criar soluções que atendam usuário e negócio.
**North star metric** — Única métrica que melhor captura o valor entregue e o sucesso de longo prazo; orienta priorização.
**Funil** (funnel) — Etapas do primeiro contato até a conversão; usuários abandonam em cada etapa.
**Conversão** — Ação desejada completada (cadastro, compra, upgrade); taxa = converteram / total exposto.
**Retenção** — Percentual de usuários que retornam após o primeiro uso; indicador de valor recorrente.
**Churn** — Taxa de abandono de usuários/receita num período; alto indica falha na entrega de valor.
**Ativação** — Momento em que o usuário experimenta o valor central pela primeira vez; marco do onboarding.
**Onboarding** — Introdução do usuário ao produto até a ativação; impacta retenção de longo prazo.
**Engajamento** — Frequência, profundidade e qualidade das interações; DAU/MAU, sessões, ações.
**DAU/MAU** — Usuários ativos diários/mensais; a razão indica "stickiness" (adesão).
**KPI** — Indicador-chave de performance; específico, mensurável e acionável.
**PMF** (Product-Market Fit) — Produto satisfaz uma demanda real tão bem que gera crescimento orgânico.
**Discovery vs Delivery** — Discovery: entender problemas/oportunidades antes de soluções. Delivery: construir e entregar soluções validadas.
**Dogfooding** — Usar o próprio produto internamente antes de lançar; identifica problemas reais cedo.
**Stakeholder** — Qualquer pessoa/grupo com interesse no produto (clientes, investidores, equipe, parceiros).
**Acceptance criteria** — Condições que uma funcionalidade deve satisfazer para ser considerada completa; define o "done" da story.
**Time to value** (TTV) — Tempo do cadastro até experimentar o valor central; minimizar melhora ativação/retenção.

### UX Writing

**UX writing** — Escrever textos de interface (botões, erros, tooltips, onboarding) com foco em clareza, utilidade e consistência.
**Microcopy** — Textos curtos de interface (labels, placeholders, erros, confirmações); impacto desproporcional na usabilidade.
**Tom de voz** — Características de personalidade que guiam como a marca se comunica; consistente em todos os contatos.
**Content design** — Usa conteúdo como material de design; considera estrutura, formato e canal além do texto.
**Call to action** (CTA) — Texto que convida a uma ação específica ("Comece grátis"); claro, específico, orientado ao benefício.
**Empty state** — Estado da interface sem conteúdo a exibir; boa UX writing o transforma em orientação ou engajamento.
**Error message** — Texto que informa que algo deu errado; explica o problema, indica causa e orienta a solução sem culpar.
**Tooltip** — Texto de ajuda contextual que aparece ao hover/toque; breve e agregando informação.
**Placeholder** — Texto de exemplo dentro de um input; orienta o que inserir; não substitui labels.
**Label (formulário/UI)** — Rótulo de um campo de formulário ou elemento; claro, conciso e visível mesmo após o campo ser preenchido. Não confundir com label de ML (seção IA).

## Design — UI, Visual, Design Systems, Branding, Acessibilidade e Ferramentas

### UI Fundamentos

**UI** (User Interface) — Elementos visuais e interativos pelos quais o usuário opera um sistema; tudo que é visto e clicado.
**Interface (UI)** — Ponto de contato visual entre usuário e sistema: telas, fluxos, componentes e feedbacks. Não confundir com interface de OOP (seção Fundamentos).
**Componente** — Unidade reutilizável de UI com estrutura, estilo e comportamento; botão, input, card, modal.
**Layout** — Arranjo e distribuição dos elementos na tela.
**Grid** — Sistema de colunas e linhas para alinhar e distribuir elementos com consistência.
**Coluna (grid)** — Divisão vertical do grid de layout; 4 (mobile), 8 (tablet) ou 12 (desktop) colunas. Não confundir com coluna de tabela (seção Bancos de Dados).
**Gutter** — Espaço fixo entre colunas do grid.
**Espaçamento** (Spacing) — Sistema de medidas pré-definidas (múltiplos de 4 ou 8px) para distâncias consistentes.
**Padding / Margin** — Padding é espaço interno (conteúdo↔borda); margin é espaço externo (entre elementos).
**Alinhamento** — Posicionamento em relação a um eixo comum; cria ordem visual.
**Hierarquia visual** — Organiza elementos por importância via tamanho, cor, peso e posição; guia o olhar.
**Contraste** — Diferença perceptual entre elementos (cor, tamanho, forma); destaca informações e cria hierarquia.
**Proximidade** — Princípio de Gestalt: elementos próximos são percebidos como relacionados.
**Repetição** — Uso consistente de padrões visuais para coesão e identidade.
**White space** (espaço negativo) — Área vazia entre elementos; melhora legibilidade, foco e elegância.
**Above the fold** — Área visível sem rolar; conteúdo crítico (CTA, proposta de valor) deve estar nessa região.
**Densidade** — Quantidade de informação por área; densa (mais dados) vs espaçada (mais foco).

### Cor

**Paleta** — Conjunto curado de cores da identidade visual; primárias, secundárias, neutras, semânticas.
**Cor primária / secundária / de acento** — Primária: principal da marca. Secundária: complementar. Acento: destaque usado com parcimônia (CTAs, badges).
**Cor semântica** — Cor com significado: verde=sucesso, vermelho=erro, amarelo=aviso, azul=informação.
**HEX / RGB / HSL** — HEX: notação hexadecimal (`#3B82F6`). RGB: Red/Green/Blue (0-255). HSL: Hue/Saturation/Lightness, mais intuitivo para ajustes.
**Contraste de cor** — Relação de luminância entre texto e fundo (ex: 4.5:1); regulado pela WCAG.
**Gradiente** — Transição suave entre cores; backgrounds, botões, ilustrações.
**Modo claro/escuro** — Esquema de cores que se adapta à preferência do sistema/usuário.
**Teoria das cores** — Como cores interagem: roda de cores, harmonia (complementar, análoga, tríade), temperatura.
**Saturação / Matiz / Luminosidade** — Saturação: intensidade. Matiz (hue): família da cor. Luminosidade: quanto de branco/preto; afeta contraste.
**Opacidade** (Alpha) — Grau de transparência de 0 (invisível) a 1 (opaco).

### Tipografia

**Fonte** (Font) — Arquivo com os glifos de uma família em peso e estilo específicos (Inter Regular 400).
**Tipografia** — Arte de organizar texto para legibilidade e estética; fontes, tamanhos, espaçamentos.
**Família tipográfica** (Typeface) — Conjunto de fontes com design compartilhado em pesos/estilos (Inter, Roboto).
**Serif / Sans-serif / Monospace** — Serif: com serifas (tradição). Sans-serif: sem serifas (moderna, predominante em UI). Monospace: largura uniforme (código).
**Peso** (Weight) — Espessura das letras; 100 (Thin) a 900 (Black); 400=Regular, 700=Bold.
**Tamanho** (Size) — Altura das letras em px/rem/pt; a escala tipográfica define os tamanhos permitidos.
**Altura de linha** (Line-height/Leading) — Distância vertical entre linhas; 1.4–1.6 ideal para leitura.
**Kerning / Tracking** — Kerning: espaço entre pares específicos (AV). Tracking: espaçamento uniforme entre todos os caracteres.
**Hierarquia tipográfica** — Sistema de tamanhos/pesos que indica importância: H1 > H2 > H3 > body > caption.
**Escala tipográfica** — Conjunto definido de tamanhos (12, 14, 16, 20, 24, 32, 48px) usado consistentemente.
**Fonte variável** — Arquivo único com múltiplos pesos/estilos em range contínuo; reduz requisições, permite animações.
**Web font** — Fonte carregada via CSS (`@font-face`, Google Fonts); otimizar para performance (WOFF2).
**Legibilidade vs Leiturabilidade** — Legibilidade: distinguir letras. Leiturabilidade: ler blocos de texto (linha, line-height, contraste).
**Comprimento de linha** (Measure) — Caracteres por linha; ideal 60-80 para textos longos.

### Design Systems

**Design system** — Sistema centralizado que unifica componentes, tokens e diretrizes de design e código; consistência entre produto e times.
**Design token** — Valor nomeado que representa uma decisão de design (`color-primary-500: #3B82F6`); conecta design e código.
**Biblioteca de componentes** — Coleção de componentes reutilizáveis documentados; usada por designers (Figma) e devs (React).
**Atomic Design** — Metodologia de Brad Frost: átomos → moléculas → organismos → templates → páginas.
**Átomo / Molécula / Organismo** — Átomo: menor unidade (botão, input). Molécula: combinação de átomos (campo de busca). Organismo: seção (header).
**Variante** — Versão alternativa de um componente (botão primary/secondary/ghost; input com/sem erro).
**Estado** — Condição visual de um componente: default, hover, focus, active, disabled, loading, error.
**Hover / Active / Disabled** — Hover: cursor sobre o elemento. Active: durante o clique. Disabled: não interativo (atenuado).
**Guideline / Style guide / Pattern library** — Guideline: diretriz. Style guide: padrões visuais (cores, tipografia). Pattern library: padrões de UI com uso.
**Token semântico** — Token que representa o propósito (`color-background-error`) em vez do valor bruto; permite trocar tema.
**Tema** (Theme) — Conjunto de tokens que definem a aparência; permite múltiplos visuais (claro/escuro) com os mesmos componentes.

### Branding & Identidade

**Identidade visual** — Sistema de elementos gráficos da marca: logo, cores, tipografia, padrões, tom visual.
**Logo / Logotipo / Símbolo** — Logo: representação visual. Logotipo: composto por tipografia (Google). Símbolo: ícone independente (maçã da Apple).
**Brandbook** — Documento central da identidade: logo, cores, tipografia, tom de voz, usos corretos e incorretos.
**Brand guidelines** — Regras de como aplicar a identidade em diferentes contextos e mídias.
**Marca** — Percepção total que o público tem da empresa; identidade visual, voz, valores, experiência.
**Naming** — Criação do nome de marca/produto/feature; fonética, disponibilidade legal, memorabilidade.
**Mood board** — Painel de referências (imagens, cores, texturas, estilos) para alinhar direção criativa antes do design.
**Rebranding** — Renovação da identidade visual ou posicionamento de uma marca existente.

### Layout & Componentes

**Responsivo** — Design que se adapta a diferentes telas sem perder usabilidade.
**Card** — Container que agrupa informações relacionadas; versátil em feeds e dashboards.
**Modal** — Camada sobreposta que exige ação antes de continuar; bloqueia o fundo.
**Dropdown** — Menu que expande exibindo opções ocultas; navegação, filtros, seleção.
**Tooltip / Popover** — Tooltip: texto pequeno ao hover. Popover: conteúdo mais rico (links, botões), via clique.
**Skeleton** — Placeholder animado que simula o layout enquanto carrega; melhora percepção de performance.
**Hero** — Seção principal de destaque no topo, com headline, subtext e CTA; primeira impressão.
**CTA** (Call to Action) — Elemento que convida a uma ação ("Começar grátis", "Ver demo"); botão/link destacado.
**Ícone / Ilustração / Asset** — Ícone: representação gráfica simplificada. Ilustração: imagem não-fotográfica. Asset: arquivo de design (imagem, ícone, fonte).
**Tabs / Accordion** — Tabs: abas que alternam seções. Accordion: expande/colapsa seções; economiza espaço vertical.
**Badge** — Pequeno indicador (número/label) que comunica status, notificações ou categorias.
**Stepper** — Guia o usuário por um processo em múltiplas etapas, mostrando progresso.
**Form / Input** — Form: conjunto de inputs, labels e botões. Input: campo de entrada (text, number, email, select, checkbox).
**Loader / Spinner** — Indicador animado de carregamento; sinaliza processamento.
**Toast / Snackbar** — Notificação temporária não-modal na borda para feedback de ações.
**Sidebar / Navbar / Footer** — Sidebar: painel lateral. Navbar: barra de navegação principal. Footer: rodapé com links secundários e legais.
**Avatar / Chip** — Avatar: representação visual do usuário (foto/iniciais). Chip (tag/pill): elemento compacto de valor/filtro.

### Motion

**Animação** — Mudança de propriedades visuais ao longo do tempo (posição, opacidade, escala); comunica estado e feedback.
**Transição** — Animação que conecta dois estados ou telas; fade, slide, escala ao abrir modal.
**Microinteração** — Animação pequena e contextual que responde a uma ação (curtir, toggle, envio de form).
**Easing** — Curva de aceleração da animação; ease-in, ease-out, ease-in-out (movimento natural).
**Motion design** — Disciplina de movimento e animação em interfaces; define quando, como e por que elementos se movem.
**Duração / Delay / Stagger** — Duração: tempo (100–400ms). Delay: pausa antes de iniciar. Stagger: delays incrementais para efeito em cascata.
**Spring animation** — Animação baseada em física de mola, com overshoot/bounce; movimento natural.

### Acessibilidade

**WCAG** — Padrão internacional de acessibilidade web (W3C); critérios em níveis A, AA, AAA.
**Contraste mínimo** — WCAG: 4.5:1 para texto normal (AA), 3:1 para texto grande.
**Leitor de tela** (Screen reader) — Converte texto e UI em áudio/braille; NVDA, VoiceOver, TalkBack.
**ARIA** — Atributos HTML (`role`, `aria-label`, `aria-hidden`) que adicionam semântica para leitores de tela.
**Navegação por teclado** — Operar toda a interface só com teclado (Tab, Enter, Setas, Esc); obrigatório para acessibilidade motora.
**Foco** (Focus) — Indicador visual do elemento ativo na navegação por teclado; nunca remover sem substituto visível.
**Alt text** — Descrição textual de uma imagem (`alt`); lida por leitores de tela e exibida se a imagem não carregar.
**Design inclusivo** — Projeta para a diversidade humana desde o início; além da acessibilidade técnica.
**Semantic HTML** — Elementos com significado correto (`<button>`, `<nav>`, `<main>`, `<h1>`); base da acessibilidade antes do ARIA.
**Target size** — Tamanho mínimo clicável/tocável; WCAG recomenda 44x44px em mobile.
**Redução de movimento** (`prefers-reduced-motion`) — Media query que detecta preferência por menos animações; respeitar é obrigatório (epilepsia, vertigem).

### Ferramentas

**Figma** — Ferramenta de design de interface colaborativa no browser; padrão da indústria para UI/UX, prototipagem e handoff.
**Frame / Artboard** — Container que representa uma tela/seção; "frame" no Figma, "artboard" em Sketch/XD.
**Auto Layout** — Recurso do Figma para containers flexíveis (similar ao Flexbox); ajusta-se ao conteúdo.
**Componente Figma / Instância** — Componente: elemento reutilizável editável; mudanças propagam. Instância: cópia que herda do componente-mãe.
**Variant** (Figma) — Agrupa versões de um componente com propriedades comutáveis (Button [type] [size] [state]).
**Plugin** (Figma) — Extensão que adiciona funcionalidades; Content Reel, Stark (a11y), Variables Import/Export.
**Figma Variables** — Sistema nativo de design tokens (cores, números, strings, booleanos) com múltiplos modos (temas).
**FigJam** — Whiteboard colaborativo do Figma; ideação, mapeamento de fluxos, workshops.
**Sketch / Adobe XD / Canva** — Sketch: design vetorial macOS. XD: descontinuado em 2024. Canva: design simplificado para não-designers.
**Dev Mode** (Figma) — Modo para devs: exibe CSS, tokens, medidas e assets prontos para implementação.
**Lottie** — Formato de animação em JSON (plugin Bodymovin do After Effects) para animações vetoriais leves em apps e web.
