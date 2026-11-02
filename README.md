# 🚚💻 Portfólio de Projetos: HackaTruck MakerSpace (UFSM)

![Swift](https://img.shields.io/badge/Swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![ESP8266](https://img.shields.io/badge/ESP8266-E7352C?style=for-the-badge&logo=espressif&logoColor=white)
![Node-RED](https://img.shields.io/badge/Node--RED-8F0000?style=for-the-badge&logo=nodered&logoColor=white)
![C++](https://img.shields.io/badge/C%2B%2B-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)

Este repositório reúne todos os projetos práticos, desafios e estudos desenvolvidos durante as aulas do **HackaTruck MakerSpace**, projeto de capacitação profissional em desenvolvimento iOS e Internet das Coisas (IoT) realizado pelo **Instituto de Pesquisas Eldorado** na **Universidade Federal de Santa Maria (UFSM)**.

A estrutura deste portfólio reflete a evolução prática ao longo do curso: partindo da construção de interfaces declarativas com **SwiftUI**, avançando pelo consumo de APIs REST, geolocalização e frameworks nativos da Apple, até chegar à integração ponta a ponta com microcontroladores (**ESP8266**), sensores físicos e servidores em **Node-RED**.

---

## 🗂️ Catálogo de Projetos por Módulo

Os projetos foram divididos em quatro módulos temáticos de acordo com os conceitos abordados em aula:

### 🎨 Módulo 1: Fundamentos de UI, Estados e Navegação (SwiftUI)
Projetos focados na construção de layouts responsivos, manipulação de estados (`@State`) e roteamento entre telas (`NavigationStack`).

1. **🔲 Estudo de Layout: Cantos da Tela**
   * **Foco:** Posicionamento elástico sem coordenadas fixas.
   * **Destaques:** Uso combinado de `VStack`, `HStack` e `Spacer()` para ancorar formas geométricas nos quatro cantos de qualquer dispositivo.
2. **🍳 Componente UI: Card de Item (Airfryer)**
   * **Foco:** Criação de células reutilizáveis para listas e perfis.
   * **Destaques:** Recorte de imagens com `.clipShape(Circle())`, alinhamento horizontal/vertical e controle de frames.
3. **🐆 Calculadora de Velocidade (Animal Speed)**
   * **Foco:** Reatividade de interface e lógica condicional.
   * **Destaques:** Cálculo de velocidade média com inputs numéricos (`TextField`), alterando dinamicamente a cor de fundo da tela e exibindo o animal correspondente à faixa de velocidade (da Tartaruga ao Carro de F1).
4. **🎨 Navegação Temática e Passagem de Dados**
   * **Foco:** Fluxo de dados unidirecional entre telas.
   * **Destaques:** Captura de texto na tela principal e envio de parâmetros customizados (cor, texto e ícone do *SF Symbols*) via `NavigationLink` para estilizar a tela de destino.
5. **🎬 Catálogo de Filmes e Séries**
   * **Foco:** Listas dinâmicas, filtros e carregamento de mídia remota.
   * **Destaques:** Uso de `AsyncImage`, propriedades computadas com `.filter` (separando Filmes, Séries e Top IMDb) e combinação de rolagem vertical com carrossel horizontal (`ScrollView`).

---

### 🗺️ Módulo 2: Geolocalização e Frameworks Nativos
Exploração de recursos nativos do ecossistema Apple para criar experiências interativas.

6. **🌍 Mapa das Maravilhas do Mundo**
   * **Foco:** Integração do `MapKit` com SwiftUI.
   * **Destaques:** Renderização de marcadores (`Marker`) nas coordenadas reais das 7 Maravilhas do Mundo, controle de câmera animado (`MapCameraPosition`) via `Picker`, e exibição de detalhes em modais (`.sheet`) utilizando `@Binding`.

---

### 🌐 Módulo 3: Consumo de APIs REST, Persistência e Recursos Avançados
Aplicações baseadas na arquitetura **MVVM** (`@Observable`), concorrência moderna do Swift (`async/await`) e integração com bancos de dados NoSQL via Node-RED.

7. **🌌 NASA APOD Explorer (Fotos Astronômicas do Dia)**
   * **Foco:** Consumo de API pública externa (`science.nasa.gov`).
   * **Destaques:** Requisições `GET` assíncronas com `URLSession`, decodificação JSON (`Codable`) e uma extensão customizada para converter textos com tags HTML nativamente em `AttributedString`.
8. **🐉 Bestiário RPG (Fichas de Monstros D&D)**
   * **Foco:** Operações de leitura e escrita (GET e POST) em servidor local.
   * **Destaques:** Listagem de criaturas, visualização de *Stat Blocks* completos e formulário categorizado (`Form`) para criação e envio de novos monstros em JSON para o backend Node-RED/Cloudant.
9. **🍕 Cardápio Digital Inteligente com Tradução**
   * **Foco:** Agrupamento de dados e acessibilidade para usuários globais.
   * **Destaques:** Agrupamento automático de pratos por categoria com `Dictionary(grouping:by:)` e integração do framework nativo **Apple Translation** (`.translationPresentation`), permitindo traduzir os itens do cardápio com um toque.

---

### 📡 Módulo 4: Internet das Coisas (IoT) — Hardware & Mobile
Sistemas completos de ponta a ponta que conectam o mundo físico ao iPhone, unindo programação embarcada em **C++ (Arduino/ESP8266)** ao desenvolvimento iOS.

10. **🌡️ Sistema IoT de Monitoramento de Temperatura**
    * **Hardware:** Microcontrolador ESP8266 lendo dados reais de temperatura via protocolo I2C em um sensor **BMP280** e disparando requisições `HTTP POST` a cada 5 segundos para o servidor Node-RED.
    * **App iOS:** Consome a rota de leitura da API e exibe o histórico de temperaturas em cards modernos com estilização em gradiente.
11. **💧 Monitor de Umidade IoT em Tempo Real (WebSockets & Gráficos)**
    * **Hardware:** ESP8266 realizando leitura analógica (`A0`) do sensor de umidade e atuando como um servidor **WebSocket** (`WebSocketsServer` na porta 81), fazendo *broadcast* contínuo de pacotes JSON na rede local.
    * **App iOS:** Mantém conexão persistente de baixa latência via `URLSessionWebSocketTask` e `Combine`, animando um indicador visual de nível de água em tempo real e plotando o histórico de variações em um gráfico de barras nativo com **Swift Charts**.

---

## 🛠️ Stack Tecnológica e Ferramentas

| Categoria | Tecnologias Utilizadas |
| :--- | :--- |
| **Desenvolvimento iOS** | Swift, SwiftUI, Combine, Observation (`@Observable`), Swift Charts, MapKit, Translation API, UIKit |
| **Rede & Dados (Mobile)** | `URLSession` (`async/await`), `URLSessionWebSocketTask`, `JSONDecoder` / `JSONEncoder`, REST |
| **Hardware & IoT** | C++, NodeMCU (ESP8266), Sensor BMP280 (I2C), Sensor de Umidade Analógico |
| **Backend & Middleware** | Node-RED, WebSockets, Bancos NoSQL (CouchDB / Cloudant) |
| **IDEs & Ambiente** | Xcode, Arduino IDE, Simulador iOS |

---

## 🚀 Como Executar os Projetos

1. **Clone este repositório:**
   `git clone https://github.com/luisfelipe1005/swift-hackatruck.git`
2. **Projetos Mobile (Xcode):**
   * Navegue até a pasta do projeto desejado e abra o arquivo `.xcodeproj` no **Xcode**.
   * Nos projetos que consomem o **Node-RED** ou **ESP8266**, verifique o endereço IP configurado nos arquivos `ViewModel.swift` ou `SensorViewModel.swift` e ajuste para o IP da sua máquina/microcontrolador na rede local.
3. **Projetos de Hardware (ESP8266):**
   * Abra os códigos C++ (`.ino` / `.cpp`) na **Arduino IDE**.
   * Instale as bibliotecas necessárias no Gerenciador de Bibliotecas (`WebSockets` por Markus Sattler, `Adafruit BMP280 Library` e `Adafruit Unified Sensor`).
   * Configure o SSID e a senha da sua rede Wi-Fi antes de gravar o firmware na placa.

---

## 🎓 Agradecimentos e Instituição

Projetos desenvolvidos durante a passagem do laboratório móvel do **HackaTruck MakerSpace** pela **Universidade Federal de Santa Maria (UFSM)**, uma iniciativa patrocinada e executada pelo **Instituto de Pesquisas Eldorado** para fomentar a formação prática em tecnologias Apple e IoT nas universidades brasileiras.
