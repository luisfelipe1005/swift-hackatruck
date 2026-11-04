# 👁️ Vision Identifier - App de Visão Computacional (iOS)

Este é um aplicativo iOS nativo construído com SwiftUI projetado para realizar análise de imagens locais utilizando Inteligência Artificial (Machine Learning) rodando diretamente no dispositivo (On-Device). O sistema permite ao usuário alternar entre duas redes neurais diferentes — **MobileNetV2** para classificação geral e **YOLOv3** para detecção de objetos — e exibe o resultado da predição juntamente com o grau de confiança (confiabilidade) da IA.

## 📱 Interface e Funcionalidades

O projeto é focado em uma tela principal de interação direta (`ContentView`), contendo os seguintes recursos:

### 1. Interface Principal
- **Layout Visual:** Construído com `ZStack` para sobreposição de elementos, com um fundo cinza que preenche toda a área segura (`ignoresSafeArea`).
- **Exibição da Imagem:** A imagem analisada (atualmente uma imagem estática chamada "macaco") é exibida no centro da tela com bordas brancas e cantos arredondados, oferecendo um aspecto de "polaroid" moderna.
- **Feedback em Tempo Real:** Um painel inferior exibe o resultado da classificação em texto claro, mudando dinamicamente de estados como "Pronto pra analisar", mensagens de erro ou o resultado final da IA.

### 2. Seletor Dinâmico de Modelos (Toggle)
- Um botão interativo no topo da tela permite ao usuário alternar instantaneamente o modelo de IA que será utilizado na próxima análise (variando o estado `@State` entre `Mobilenet` e `yolo`). O botão possui um visual moderno com gradiente azul.

### 3. Classificação com MobileNetV2
- **Foco:** Identificar qual é o tema central ou categoria principal da imagem inteira (Classificação de Imagem).
- **Processamento:** Utiliza o framework Vision para processar a imagem através de um `VNCoreMLRequest`.
- **Retorno:** Extrai o resultado com maior probabilidade (`VNClassificationObservation`) e formata o identificador junto com a porcentagem de confiança (ex: "Macaque (95.40%)").

### 4. Detecção de Objetos com YOLOv3
- **Foco:** Localizar e nomear objetos específicos dentro da imagem.
- **Processamento:** Ao contrário do MobileNet, o YOLO utiliza `VNRecognizedObjectObservation` para mapear áreas onde objetos foram detectados.
- **Retorno:** Captura o primeiro objeto detectado e seu rótulo principal (`labels.first`), exibindo-o na tela com sua respectiva porcentagem.

## ⚙️ Arquitetura e Processamento

- **Gerenciamento de Estado (`@State`):** O fluxo da tela é reativo. Variáveis de estado controlam a imagem selecionada, o rótulo de resultado (`classificationLabel`) e o modelo ativo.
- **Conversão de Imagem:** Transforma as imagens do formato UIKit (`UIImage`) para o formato Core Image (`CIImage`), que é a estrutura exigida pelo framework Vision.
- **Processamento Assíncrono:** 
  * A execução do modelo de Machine Learning (`handler.perform`) é feita em uma **Background Thread** (`DispatchQueue.global().async`), garantindo que o aplicativo não trave enquanto a IA "pensa".
  * A atualização do texto de resultado na tela (`classificationLabel`) é devolvida para a **Main Thread** (`DispatchQueue.main.async`), seguindo as boas práticas de desenvolvimento iOS.
- **Tratamento de Erros de IA:** O código possui robustos blocos `do-catch` e verificações `guard let` para lidar com falhas de carregamento de modelo, erros de conversão de imagem ou ausência de resultados.

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Swift
- **UI Framework:** SwiftUI
- **Machine Learning On-Device:** 
  - `CoreML` (Para instanciar os modelos treinados)
  - `Vision` (Para orquestrar o processamento de imagens e interpretar os resultados)
- **Modelos IA Utilizados:** `MobileNetV2` e `YOLOv3` (via MLModelConfiguration)

## 🚀 Como Executar e Testar

1. **Configuração do Xcode:**
   - Abra o projeto no **Xcode** (versão recomendada com suporte a SwiftUI e Swift 5+).
2. **Adicionando as Imagens (Assets):**
   - O código procura por uma imagem chamada `"macaco"`. Certifique-se de arrastar uma imagem com esse exato nome para a pasta `Assets.xcassets` do seu projeto.
3. **Adicionando os Modelos CoreML:**
   - Para que o código compile, você precisa adicionar os arquivos `.mlmodel` ao seu projeto. 
   - Baixe os modelos **MobileNetV2.mlmodel** e **YOLOv3.mlmodel** (geralmente encontrados no portal de Machine Learning da Apple ou repositórios open-source) e arraste-os para a barra de navegação (Project Navigator) do Xcode. O Xcode irá gerar as classes Swift automaticamente.
4. **Executando o App iOS:**
   - Selecione um Simulador ou um iPhone físico conectado.
   - Pressione `Cmd + R` para compilar e rodar. 
   - Alterne entre os modelos usando o botão superior e clique em **"identificar"** para ver a IA em ação!
