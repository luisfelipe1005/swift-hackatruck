# 🐆 Calculadora de Velocidade (Animal Speed)

Este é um aplicativo iOS simples e interativo construído com SwiftUI. O aplicativo permite que o usuário calcule a velocidade média com base na distância e no tempo informados, e exibe dinamicamente um animal correspondente àquela faixa de velocidade, além de alterar a cor de fundo da interface.

## 📱 Funcionalidades

O aplicativo possui uma única tela (`ContentView.swift`) com as seguintes funcionalidades:

### 1. Entrada de Dados (Inputs)
* **Tempo:** Campo de texto (`TextField`) para o usuário inserir o tempo percorrido.
* **Distância:** Campo de texto (`TextField`) para o usuário inserir a distância percorrida.
* Os campos de texto utilizam o formato `.number` e possuem um design customizado com fundo cinza translúcido e bordas arredondadas.

### 2. Cálculo de Velocidade
* Um botão **"Calcule"** executa a fórmula de velocidade média: `Velocidade = Tempo / Distância`. *(Nota: Para calcular Km/h corretamente em física, a fórmula padrão é Distância / Tempo. Certifique-se de que os inputs do usuário reflitam essa lógica).*
* O resultado da velocidade é exibido na tela formatado como `[valor] km/h`.

### 3. Feedback Visual Dinâmico
Com base no resultado do cálculo da velocidade, o aplicativo reage de duas formas:
* **Imagem do Animal:** Atualiza a imagem centralizada na tela para representar o quão rápido o objeto está se movendo.
  * `0 km/h`: "???" (Imagem indefinida/padrão)
  * `1 - 10 km/h`: Tartaruga
  * `11 - 40 km/h`: Macaco
  * `41 - 80 km/h`: Ema
  * `81 - 100 km/h`: Tigre
  * `> 100 km/h`: Carro de Fórmula 1
* **Cor de Fundo:** A função `dynamicColor()` altera a cor de fundo de toda a tela (`VStack`) de acordo com a faixa de velocidade, variando entre cinza (parado) até vermelho claro (muito rápido), passando por verde, azul, laranja e amarelo.

### 4. Legenda Informativa
* Na parte inferior da tela, um painel preto (`ZStack`) exibe uma legenda clara relacionando cada faixa de velocidade ao seu respectivo animal, auxiliando o entendimento do usuário.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **Framework UI:** SwiftUI
* **Gerenciamento de Estado:** `@State` para atualização reativa da interface (distância, tempo, velocidade, nome da imagem e cor).

## 🚀 Como Executar

1. Abra o arquivo `fotos.swift` no **Xcode**.
2. Certifique-se de que as imagens correspondentes aos nomes (`tartaruga`, `macaco`, `ema`, `tigre`, `carro`, `???`) e as cores customizadas (`.verdeclaro`, `.azulclaro`, etc.) estejam adicionadas no arquivo `Assets.xcassets` do seu projeto.
3. Utilize o Canvas (Preview) do Xcode para visualizar a interface em tempo real, ou selecione um simulador de iPhone e clique no botão de "Play" (Run).
