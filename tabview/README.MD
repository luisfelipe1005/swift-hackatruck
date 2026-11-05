# 🎨 UI Showcase: Navegação com TabView no SwiftUI

Este projeto é um protótipo de interface de usuário (UI) focado em demonstrar a estrutura de navegação por abas (`TabView`) nativa do iOS. Com uma temática lúdica de "ferramentas de pintura e cores", o aplicativo ilustra como compor telas ricas e responsivas utilizando os componentes de layout fundamentais do SwiftUI.

## 🏗️ Estrutura do Projeto

O código é focado na construção de layouts declarativos, separando o aplicativo em múltiplas *Views* que são acessadas através de uma barra de navegação inferior:

### 📱 1. Navegação Principal (`ContentView`)
O coração do aplicativo.
- **`TabView`:** Controla a navegação principal, abrigando quatro abas distintas.
- **`tabItem` e `Label`:** Cada aba recebe um rótulo de texto e um ícone correspondente do catálogo oficial da Apple (SF Symbols), garantindo uma integração perfeita com o design do sistema iOS.

### 🖌️ 2. Telas de Destaque Visual (`PincelView`, `PinselView`, `PaletteView`)
Telas criadas para focar no uso de cores, sobreposições e manipulação de formas.
- **`ZStack`:** Utilizado para criar fundos imersivos de tela inteira (`Color.pink`, `Color.blue`, `Color.gray`) que ignoram as margens seguras (`.ignoresSafeArea()`).
- **Composição Visual:** Os ícones (`SF Symbols`) recebem destaque central com tamanho ampliado (`.resizable()`).
- **Máscaras e Formas (`.clipShape`):** Um fundo preto é aplicado ao redor dos ícones e cortado em formato perfeitamente circular (`Circle()`), demonstrando como manipular a geometria dos elementos.

### 📋 3. Exibição de Dados (`ListView`)
Uma tela focada em estruturação de dados em formato de lista.
- **`NavigationStack` & `navigationTitle`:** Adiciona uma barra de navegação superior padrão do iOS, preparando a tela para possíveis transições.
- **`List` & `HStack`:** Demonstra como construir linhas customizadas (`HStack`) separando o texto (à esquerda) do ícone (à direita) usando um `Spacer()`, resultando em um layout limpo e organizado.

## 🛠️ Tecnologias e Conceitos Utilizados

- **Linguagem:** Swift.
- **Framework de UI:** SwiftUI.
- **Sistema de Ícones:** SF Symbols (`paintbrush`, `paintbrush.pointed`, `paintpalette`, `list.bullet`).
- **Conceitos de Layout:** Pilhas Z/V/H (ZStack, VStack, HStack), TabView, Modificadores de Forma e Cor.

## 🚀 Como Executar

### Configurando o Aplicativo iOS
1. Faça o clone do repositório ou copie o código fonte.
2. Abra o **Xcode** e crie um novo projeto "App" em SwiftUI.
3. Substitua o conteúdo do arquivo `ContentView.swift` pelo código fornecido (todas as structs podem ficar no mesmo arquivo para testes, ou separadas em arquivos distintos como `ListView.swift`, `PaletteView.swift`, etc.).
4. Compile o projeto (⌘ + R) e execute no Simulador do iOS ou no Canvas de Preview lateral.
