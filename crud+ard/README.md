# 🌡️ Sistema IoT de Monitoramento de Temperatura

Este projeto é uma solução IoT ponta a ponta para medir, armazenar e visualizar a temperatura ambiente. O sistema é composto por um microcontrolador ESP8266 lendo dados de um sensor BMP280, que envia as informações via HTTP POST para um servidor central (Node-RED). Por fim, um aplicativo iOS nativo consome e exibe esses dados em uma interface moderna.

## 🏗️ Arquitetura do Projeto

O código foi dividido em módulos claros, separando a responsabilidade de hardware, comunicação de rede e interface de usuário:

### 📱 1. Interface iOS (`ContentView.swift` e Modelos)
A aplicação iOS foi desenvolvida utilizando SwiftUI com um foco em design limpo e reatividade.
* **Modelo `Temperatura`:** Estrutura `Codable` que mapeia os dados vindos do banco de dados. Os campos `_id` e `_rev` indicam compatibilidade com bancos NoSQL (como CouchDB/Cloudant).
* **Interface Visual (`ContentView`):** Utiliza um fundo em `LinearGradient` vermelho para transmitir a ideia de temperatura. As leituras são exibidas em uma `ScrollView` com cards estilizados, contendo sombras, ícones do SF Symbols (`thermometer.medium`) e tipografia moderna.

### ⚙️ 2. Gerenciamento de Estado e Rede (`ViewModel.swift` e `Service.swift`)
A camada lógica do aplicativo mobile adota conceitos modernos do ecossistema Apple:
* **ViewModel:** Utiliza a nova macro `@Observable` para gerenciar a lista de temperaturas. Ele executa a função de busca assíncrona assim que a tela carrega (`.task`).
* **Service:** Isola a comunicação de rede. Utiliza `async/await` e `URLSession` para buscar os dados via requisição GET na rota `/pegar`, e decodifica o JSON automaticamente. Também possui estrutura preparada para fazer requisições POST caso o app precise enviar dados no futuro.

### 🔌 3. Hardware e Firmware (C++ / ESP8266)
O "nó" de coleta de dados do projeto, responsável pela interação com o mundo físico.
* **Sensor BMP280:** Utiliza a biblioteca da Adafruit para ler a temperatura ambiente via protocolo I2C. O código inclui tratamentos de erro caso o sensor falhe na inicialização.
* **Conectividade Wi-Fi:** Conecta-se de forma robusta à rede `HackaTruckIoT`, com verificação constante de status.
* **Cliente HTTP:** A cada 5 segundos, o ESP8266 realiza uma leitura do sensor e envia um pacote via POST HTTP (`application/x-www-form-urlencoded`) para a rota `/adicionar` do servidor. O status da requisição é monitorado via Monitor Serial.

## 🛠️ Tecnologias Utilizadas

* **Frontend (Mobile):** Swift, SwiftUI, Observation Framework (`@Observable`).
* **Hardware/Microcontrolador:** C++, Arduino IDE, NodeMCU (ESP8266).
* **Componentes Físicos:** Sensor de Pressão/Temperatura BMP280.
* **Rede e Comunicação:** HTTP, REST (GET/POST), JSON, Wi-Fi.

## 🚀 Como Executar

### Configurando o Hardware (ESP8266)
1. Conecte o sensor BMP280 ao ESP8266 (SDA no D2, SCL no D1).
2. Instale as bibliotecas `Adafruit BMP280 Library` e `Adafruit Unified Sensor` na Arduino IDE.
3. Altere o endereço IP na variável `URL` para apontar para o seu servidor.
4. Faça o upload do código e abra o Monitor Serial (115200 baud) para verificar o envio dos dados.

### Configurando o Aplicativo iOS
1. Abra o projeto no Xcode.
2. No arquivo `ViewModel.swift`, certifique-se de que a `url` aponte para o IP correto do seu servidor (o dispositivo iOS deve estar na mesma rede local).
3. Compile o projeto e execute no Simulador ou em um iPhone físico.
