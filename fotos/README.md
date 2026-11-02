# 🍳 Componente UI: Card de Item (Airfryer)

Este repositório contém um componente visual simples e responsivo construído com SwiftUI. Ele serve como um estudo prático de layout horizontal e vertical, ideal para ser utilizado como uma linha em uma lista (List/ScrollView) ou como um card de perfil/produto.

## 📱 Estrutura do Layout

O componente (`ContentView.swift`) utiliza o sistema de pilhas (Stacks) do SwiftUI para organizar os elementos na tela de forma limpa:

* **HStack (Pilha Horizontal):** É o contêiner principal da tela. Ele alinha os elementos lado a lado (imagem à esquerda, textos à direita).
* **Espaçamento Dinâmico (`Spacer`):** Utilizado de forma estratégica antes, entre e depois dos elementos principais para distribuir o espaço vazio uniformemente, mantendo o conteúdo centralizado e responsivo em qualquer tamanho de tela.
* **Imagem Customizada:** Carrega um asset chamado `"airfryer"`. A imagem recebe os seguintes modificadores para um visual moderno:
  * `.resizable()` e `.frame(width: 100, height: 100)`: Para garantir que a imagem tenha um tamanho fixo e controlado.
  * `.clipShape(Circle())`: Corta a imagem em um formato perfeitamente circular, muito comum em avatares ou ícones de destaque.
* **VStack (Pilha Vertical):** Agrupa os textos `"teste"` e `"airfryer"` um em cima do outro, mantendo a organização das informações relacionadas ao lado da imagem.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **UI Framework:** SwiftUI
* **Componentes Visuais:** `HStack`, `VStack`, `Image`, `Text`, `Spacer`

## 🚀 Como Executar e Testar

1. Abra o arquivo `fotos.swift` (ou `ContentView.swift`) no **Xcode**.
2. **Importante:** Para que a imagem carregue corretamente e o layout fique igual ao projetado, você precisa adicionar uma imagem qualquer ao catálogo de assets do seu projeto (`Assets.xcassets`) e renomeá-la para `"airfryer"`.
3. Utilize o **Canvas (Preview)** do Xcode (atalho: `Option + Cmd + Enter`) para visualizar o componente em tempo real.
