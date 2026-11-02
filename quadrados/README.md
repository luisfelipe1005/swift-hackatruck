# 🔲 Estudo de Layout: Cantos da Tela (Stacks & Spacers)

Este repositório contém um projeto básico em SwiftUI focado no estudo de distribuição espacial. O objetivo do código é demonstrar como posicionar elementos perfeitamente nos quatro cantos da tela utilizando o sistema de pilhas (Stacks) e espaçadores (`Spacer`) nativos do SwiftUI, sem o uso de coordenadas fixas.

## 📱 Estrutura do Layout

O layout é desenhado para ser totalmente responsivo, adaptando-se a qualquer tamanho de tela (iPhone, iPad, Mac) graças ao uso inteligente das Stacks. O resultado visual são quatro quadrados coloridos distribuídos nos quatro cantos da tela.

### Como funciona?
* **O Contêiner Principal (`VStack`):** Organiza os elementos de cima para baixo.
* **As Pilhas Horizontais (`HStack`):** Duas pilhas horizontais atuam como as "linhas" superior e inferior da tela.
* **O Poder do `Spacer()`:**
  * **Nas HStacks:** O `Spacer()` colocado entre dois retângulos empurra um para a extrema esquerda e o outro para a extrema direita.
  * **Na VStack:** O `Spacer()` colocado entre as duas HStacks empurra a primeira para o topo absoluto da tela e a segunda para a base absoluta.
* **Formas Geométricas (`Rectangle`):** Foram utilizados retângulos de tamanho fixo (`.frame(width:100, height:100)`) preenchidos com cores primárias (.red, .green, .blue, .yellow) para facilitar a visualização do posicionamento.
* **Margem (`.padding()`):** Aplicado no final da `VStack` para garantir que os quadrados não toquem exatamente as bordas do aparelho, respeitando a área de segurança (Safe Area).

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **UI Framework:** SwiftUI
* **Componentes Essenciais:** `VStack`, `HStack`, `Spacer`, `Rectangle`

## 🚀 Como Executar e Testar

1. Abra o arquivo `ContentView.swift` no **Xcode**.
2. Este projeto não possui imagens ou dependências externas, basta rodar!
3. Utilize o **Canvas (Preview)** do Xcode (atalho: `Option + Cmd + Enter`) para ver o resultado instantaneamente.
4. **Dica de Teste:** Tente alterar o dispositivo no simulador (ex: de um iPhone para um iPad). Você notará que, independente da resolução, os quatro quadrados sempre se manterão perfeitamente ancorados nos cantos, graças à elasticidade do `Spacer()`.
