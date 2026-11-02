# 🎬 Catálogo de Filmes e Séries (SwiftUI)

Este é um aplicativo iOS nativo construído com SwiftUI que funciona como um catálogo de entretenimento. O app exibe uma lista de filmes e séries, filtra o conteúdo por categoria e notas do IMDb, e permite ao usuário ver os detalhes de cada obra em uma tela dedicada.

## 📱 Telas e Funcionalidades

O projeto é composto por um fluxo de navegação simples e intuitivo:

### 1. Tela Principal (`ContentView.swift`)
A tela inicial atua como um *hub* de descoberta de conteúdo.
* **Dados Estruturados:** Utiliza um modelo `Conteudo` para armazenar nome, categoria, URL da capa, ano, gênero, país (emojis) e nota no IMDb.
* **Filtros Automáticos (Computed Properties):** O app processa a lista principal automaticamente e a divide em três sessões utilizando `.filter`:
  * **Séries:** Lista vertical exibindo apenas conteúdos com a categoria "Série".
  * **Filmes:** Lista vertical exibindo apenas conteúdos com a categoria "Filme".
  * **Bons (Top Rated):** Um carrossel horizontal (`ScrollView(.horizontal)`) destacando apenas as obras com nota do IMDb superior a 8.0.
* **Imagens Assíncronas:** Utiliza `AsyncImage` para baixar e exibir os pôsteres (capas) diretamente da internet, sem travar a interface do usuário.
* **Layout:** Aplica um `LinearGradient` (de branco para preto) no fundo, dando um toque moderno e cinematográfico à interface.

### 2. Tela de Detalhes (`ShowView.swift`)
Ao clicar em qualquer item da tela principal via `NavigationLink`, o usuário é levado para esta tela.
* **Exibição Completa:** Mostra a capa do filme/série em destaque (`.scaledToFill()`).
* **Informações Detalhadas:** Lista de forma limpa a Categoria, Ano, Gênero e País.
* **Destaque para a Nota:** A nota do IMDb ganha destaque na parte inferior da tela utilizando fontes maiores (`.largeTitle`).
* O background também acompanha o gradiente estilizado da tela inicial.

## ⚙️ Arquitetura e Código

* **Modelo (`Conteudo`):** Uma `Struct` que implementa o protocolo `Hashable`, essencial para iterar sobre a lista usando `ForEach` de forma segura.
* **Componentes de Navegação:** Uso do moderno `NavigationStack` emparelhado com `NavigationLink` para transições de tela fluidas e nativas.
* **Listas Mistas:** Demonstra o domínio de layouts bidirecionais, utilizando `VStack` e `ScrollView` padrão para rolagem vertical, e `ScrollView(.horizontal)` com `HStack` para rolagem lateral.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **Framework UI:** SwiftUI
* **Componentes Visuais:** `AsyncImage`, `NavigationStack`, `LinearGradient`, `ScrollView`.

## 🚀 Como Executar e Testar

1. Abra o arquivo no **Xcode**.
2. Certifique-se de que o seu Mac/Simulador tem **acesso à internet**, pois os pôsteres dos filmes são carregados via URLs do Wikipedia/Amazon.
3. Para testar rapidamente sem rodar o emulador inteiro, utilize o **Canvas (Preview)** do Xcode (atalho: `Option + Cmd + Enter`). A preview já conta com um mock (ex: *Inspetor Faustão e o Mallandro*) configurado para a `ShowView`.
4. Para simular a navegação entre telas, clique no ícone de "Play" (Live Preview) no Canvas ou rode o app no Simulador (`Cmd + R`).
