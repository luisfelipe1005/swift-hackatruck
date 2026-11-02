# 💧 Monitor de Umidade IoT (iOS & ESP8266)

Este projeto é um sistema IoT (Internet das Coisas) de ponta a ponta para monitoramento de umidade em tempo real. Ele é composto por um aplicativo iOS nativo construído com SwiftUI e um microcontrolador ESP8266 que faz a leitura do sensor e transmite os dados localmente via WebSockets.

## 🏗️ Arquitetura do Projeto

O sistema foi dividido em quatro partes principais, separando responsabilidades entre interface, visualização de dados, comunicação de rede e hardware:

### 📱 1. Interface Principal (`ContentView.swift`)
A tela principal do aplicativo iOS, responsável por exibir o status atual da umidade de forma visual e intuitiva.
* **Indicador Visual:** Utiliza formas geométricas (`RoundedRectangle`) para simular o nível de umidade preenchendo um recipiente, com animações suaves (`.easeInOut`) baseadas na porcentagem.
* **Processamento de Dados:** Converte o valor analógico do sensor (escala invertida de 0 a 1024) para uma porcentagem de 0% a 100%.
* **Avaliação de Status:** Classifica automaticamente o ambiente em três estados com base na leitura:
  * `< 30%`: Seco
  * `30% - 60%`: Normal
  * `> 60%`: Molhado
* **Navegação:** Roteamento integrado utilizando `NavigationStack` para acessar o histórico de leituras.

### 📊 2. Visualização de Gráficos (`GraphView.swift`)
Uma tela dedicada à visualização do histórico de dados coletados durante o uso do app.
* **SwiftUI Charts:** Utiliza o moderno framework `Charts` da Apple para renderizar um gráfico de barras (`BarMark`).
* **Histórico Dinâmico:** Mapeia o array de umidade armazenado na tela principal, exibindo a variação ao longo do tempo.

### 📡 3. Camada de Comunicação (`SensorViewModel.swift`)
O "cérebro" do aplicativo, responsável por manter a conexão ativa com o hardware em tempo real.
* **WebSockets Nativos:** Implementado usando `URLSessionWebSocketTask` para manter uma conexão bidirecional leve e contínua.
* **Parsing de JSON:** Recebe pacotes de texto do servidor, converte de `String` para `Data` e faz o parse seguro do JSON (ex: `{"umidade": 450}`) extraindo apenas os valores relevantes.
* **Reatividade:** Adota a arquitetura MVVM com `@Published` no Combine. Toda vez que um novo dado chega, a interface (`ContentView`) é atualizada automaticamente na thread principal (`DispatchQueue.main.async`).

### ⚙️ 4. Hardware e Servidor WebSockets (C++ / ESP8266)
O firmware do microcontrolador que coleta os dados físicos e os distribui na rede.
* **Leitura Analógica:** Lê os dados de umidade do solo ou ambiente através do pino `A0`.
* **Conexão Wi-Fi:** Conecta-se automaticamente à rede local predefinida (`HackaTruckIoT`).
* **Servidor WebSocket (`WebSocketsServer`):** Cria um servidor na porta `81` que faz o *broadcast* contínuo (a cada 2 segundos) de uma string JSON com a leitura mais recente para todos os clientes conectados.

## 🛠️ Tecnologias Utilizadas

* **Frontend (Mobile):** Swift, SwiftUI, Swift Charts, Combine.
* **Backend / Hardware:** C++, Arduino IDE, ESP8266.
* **Protocolos:** Wi-Fi, WebSockets, JSON.

## 🚀 Como Executar

1. **Hardware:** Grave o código `.cpp`/`.ino` no seu ESP8266 e ligue-o. O monitor serial informará o endereço IP obtido na rede `HackaTruckIoT`.
2. **Aplicativo iOS:** 
   * Abra o arquivo `SensorViewModel.swift`.
   * Altere a URL `ws://192.168.128.217:81` para o IP fornecido pelo ESP8266 no monitor serial.
   * Compile e rode no Simulador ou em um iPhone físico conectado à mesma rede Wi-Fi..
