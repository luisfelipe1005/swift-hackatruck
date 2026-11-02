# 🎨 Navegação Temática & Passagem de Dados (SwiftUI)

Este é um aplicativo iOS simples e interativo construído com SwiftUI, focado em demonstrar o fluxo de navegação (`NavigationStack`) e a passagem de estados (`@State`) entre diferentes telas. O usuário digita um texto e escolhe um "tema" (ícone e cor); a tela seguinte se adapta dinamicamente às escolhas feitas.

## 📱 Telas e Funcionalidades

O aplicativo possui um fluxo direto de duas telas:

### 1. Tela Inicial (`ContentView.swift`)
A tela de entrada onde o usuário interage e faz suas seleções.
* **Entrada de Texto:** Um `TextField` com estilo arredondado (`.roundedBorder`) captura a entrada do usuário e a armazena em uma variável de estado (`@State var content`).
* **Grade de Temas:** Abaixo do campo de texto, botões grandes e coloridos são dispostos usando `HStack`s. Cada botão é um `NavigationLink` customizado.
* **Design dos Botões:** Compostos por um `RoundedRectangle` colorido em background, sobreposto (`.overlay`) por ícones vetoriais nativos da Apple (**SF Symbols**), como `paintbrush`, `paintbrush.pointed`, `paintpalette` e `list.bullet`.

### 2. Tela de Detalhes (`ShowView.swift`)
A tela de destino, que é renderizada dinamicamente com base no botão clicado na tela anterior.
* **Fundo Dinâmico:** O background da tela (`ZStack`) ignora as margens de segurança (`.ignoresSafeArea()`) e assume a cor exata escolhida pelo usuário.
* **Mapeamento de Cores:** Uma função inteligente `dynamicColor()` recebe o nome da cor em formato de `String` (ex: "pink") e o converte no respectivo objeto `Color` do SwiftUI.
* **Destaque Visual:** O ícone selecionado é exibido grande no centro da tela dentro de um círculo preto (`.clipShape(Circle())`). O ícone em si recebe a mesma cor do fundo, criando um contraste visual interessante.
* **Exibição do Texto:** O texto que o usuário digitou na primeira tela é exibido na parte inferior da tela, provando o sucesso da passagem de parâmetros.

## ⚙️ Arquitetura e Fluxo de Dados

Este projeto ilustra perfeitamente como trafegar dados unidirecionalmente em SwiftUI:
1. O texto é salvo na propriedade `@State var content`.
2. Ao tocar em um `NavigationLink`, os atributos estáticos do botão (cor e ícone) e o atributo dinâmico (`content`) são injetados diretamente no inicializador da `ShowView`.
3. A `ShowView` recebe esses dados como propriedades normais (`var cor`, `var icon`, `var text`) e reconstrói sua interface baseada neles.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **UI Framework:** SwiftUI
* **Navegação:** `NavigationStack`, `NavigationLink`
* **Iconografia:** SF Symbols nativos (`Image(systemName:)`)

## 🚀 Como Executar e Testar

1. Abra o arquivo no **Xcode**.
2. O código não possui dependências externas. O uso de imagens baseia-se puramente nos *SF Symbols*, que já vêm integrados ao ambiente de desenvolvimento da Apple.
3. No **Canvas (Preview)** (`Option + Cmd + Enter`), visualize a `ContentView`.
4. Digite uma palavra qualquer no campo de texto (ex: "Olá, SwiftUI!").
5. Clique em qualquer um dos quadrados coloridos. Você será levado para a próxima tela, que estará personalizada com a cor, o ícone e o texto escolhidos!
