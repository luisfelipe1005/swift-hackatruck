# 🚚💻 Portfólio de Projetos: HackaTruck MakerSpace (UFSM)

<p align="left">
  <img src="https://img.shields.io/badge/Swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white" alt="Swift" height="28">
  <img src="https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white" alt="SwiftUI" height="28">
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS" height="28">
  <img src="https://user-images.githubusercontent.com/45159366/132140795-bbb0ed1e-b1f7-4716-bc4d-8ebffde6fd00.png" alt="CoreML" height="28">
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase" height="28">
  <img src="https://img.shields.io/badge/ESP8266-E7352C?style=for-the-badge&logo=espressif&logoColor=white" alt="ESP8266" height="28">
  <img src="https://img.shields.io/badge/Node--RED-8F0000?style=for-the-badge&logo=nodered&logoColor=white" alt="Node-RED" height="28">
</p>

Este repositório reúne todos os projetos práticos, desafios e estudos desenvolvidos durante as aulas do **HackaTruck MakerSpace**, projeto de capacitação profissional em desenvolvimento iOS e Internet das Coisas (IoT) realizado pelo **Instituto de Pesquisas Eldorado** na **Universidade Federal de Santa Maria (UFSM)**.

A estrutura deste portfólio reflete a evolução prática ao longo do curso: partindo da construção de interfaces declarativas com **SwiftUI**, avançando por frameworks nativos de Machine Learning e Mídia (**CoreML, Vision, AVFoundation**), integrações de Inteligência Artificial (**Gemini**), até chegar à integração ponta a ponta com microcontroladores (**ESP8266**), sensores físicos e servidores em **Node-RED**.

---

## 🗂️ Catálogo de Projetos por Módulo

Os projetos foram divididos em quatro módulos temáticos de acordo com os conceitos abordados em aula.

### 🎨 Módulo 1: Fundamentos de UI, Estados e Navegação (SwiftUI)

Projetos focados na construção de layouts responsivos, manipulação de estados (`@State`) e roteamento entre telas (`NavigationStack`).

1. **🔲 Estudo de Layout: Cantos da Tela** — Posicionamento elástico sem coordenadas fixas (`Spacer`).
2. **🍳 Componente UI: Card de Item (Airfryer)** — Criação de células reutilizáveis e recorte de imagens.
3. **🐆 Calculadora de Velocidade** — Reatividade de interface e lógica condicional.
4. **🎨 Navegação Temática** — Fluxo de dados unidirecional entre telas via `NavigationLink`.
5. **🎬 Catálogo de Filmes e Séries** — Listas dinâmicas, filtros (`.filter`) e `AsyncImage`.

### 🧠 Módulo 2: Frameworks Nativos e Machine Learning On-Device

Exploração de recursos nativos do ecossistema Apple para criar experiências interativas e inteligentes.

6. **🌍 Mapa das Maravilhas do Mundo** — Integração do `MapKit` com marcadores dinâmicos.
7. **👁️ Vision Identifier (IA On-Device)** — Classificação de imagens e detecção de objetos utilizando redes neurais locais (`MobileNetV2` e `YOLOv3`) com `CoreML` e `Vision`.
8. **📚 Study Cast (Leitor OCR & TTS)** — Extração de textos de fotos (`VNRecognizeTextRequest`) e leitura em voz alta do conteúdo utilizando `AVFoundation`.

### 🌐 Módulo 3: Consumo de APIs REST, Persistência e IA Cloud

Integrações complexas utilizando **MVVM** (`@Observable`), concorrência moderna (`async/await`) e bancos de dados.

9. **🌌 NASA APOD Explorer** — Consumo da API pública da NASA com decodificação JSON.
10. **🐉 Bestiário RPG (Fichas e IA Generativa)** — Operações CRUD via Node-RED e geração de novos monstros via Engenharia de Prompt usando o **Google Gemini** (`FirebaseAI`).
11. **🍕 Cardápio Inteligente com Tradução** — Agrupamento de coleções e tradução nativa em tempo real com a *Translation API* da Apple.

### 📡 Módulo 4: Internet das Coisas (IoT) — Hardware & Mobile

Sistemas ponta a ponta que conectam o mundo físico ao iPhone utilizando C++ e Swift.

12. **🌡️ Sistema IoT de Monitoramento de Temperatura** — Sensor **BMP280 (I2C)** comunicando-se com Node-RED via POST, com os dados exibidos em cards modernos no iOS.
13. **💧 Monitor de Umidade em Tempo Real (WebSockets)** — Conexão de baixa latência transmitindo dados analógicos e renderizando gráficos nativos com **Swift Charts**.

---

## 🔍 Detalhes dos Projetos Avançados

<details>
<summary><strong>🐉 1. Bestiário RPG - App de Monstros com IA Generativa</strong> <em>(Clique para expandir)</em></summary>

<br>

Este é um aplicativo iOS nativo construído com SwiftUI, projetado para gerenciar e visualizar fichas de monstros de RPG (como D&D 5e e Tales of the Valiant). Ele permite aos usuários listar monstros, visualizar atributos e criar novas criaturas manualmente ou utilizando Inteligência Artificial (Google Gemini).

- **Telas Principais:**
  - **Lista de Monstros:** Navegação dinâmica e `AsyncImage` para carregar avatares.
  - **Ficha de Detalhes:** Layout temático exibindo *Stat Blocks* completos (Atributos, CA, HP, Ações).
  - **Criação Manual:** Formulários em SwiftUI com validação de entrada de dados numéricos.
  - **Criação com IA (`FirebaseAI`):** Interface de chat que recebe uma ideia do usuário, cria um prompt estrito para o modelo `gemini-3.1-flash-lite`, faz o *parsing* da resposta com Regex para isolar o JSON gerado e salva automaticamente no banco.

- **Rede e Arquitetura:** Baseado em MVVM (`@Observable`), o app consome as rotas `/adicionar` (GET) e `/criar` (POST) de um servidor Node-RED / Cloudant.

</details>

<details>
<summary><strong>👁️ 2. Vision Identifier - Visão Computacional On-Device</strong> <em>(Clique para expandir)</em></summary>

<br>

App projetado para realizar análise de imagens locais utilizando Inteligência Artificial rodando diretamente no dispositivo (*On-Device*).

- **Múltiplas Redes Neurais:** Permite alternar via *Toggle* entre **MobileNetV2** (para classificar o contexto principal da imagem) e **YOLOv3** (para detectar e mapear objetos específicos).
- **Processamento (`Vision` + `CoreML`):**
  - Transforma `UIImage` em `CIImage`.
  - Envia requisições (`VNCoreMLRequest`) em *Background Threads* para não travar a interface.
  - Extrai as observações (`VNClassificationObservation` ou `VNRecognizedObjectObservation`) para exibir o resultado e o grau de confiança da IA.

</details>

<details>
<summary><strong>📚 3. Study Cast - OCR e Leitura em Voz Alta (TTS)</strong> <em>(Clique para expandir)</em></summary>

<br>

Focado em produtividade e acessibilidade, este app permite que o usuário extraia textos de cadernos, livros ou documentos e escute o conteúdo em voz alta.

- **Seleção Segura de Mídia (`PhotosUI`):** Utiliza o `PhotosPicker` nativo do iOS 16+ para acessar fotos de maneira segura sem requerer permissão total à galeria.
- **Extração de Texto (OCR):** Usa o framework `Vision` (`VNRecognizeTextRequest`) configurado para precisão máxima (`.accurate`), correção linguística nativa e suporte a múltiplos idiomas (`pt-BR`, `en-US`).
- **Síntese de Voz (`AVFoundation`):** Instancia um `AVSpeechSynthesizer` para transformar o texto capturado em áudio, com controle de idioma de narração e ajuste de velocidade de reprodução para facilitar o estudo.

</details>

---

## 🛠️ Stack Tecnológica e Ferramentas

| Categoria | Tecnologias Utilizadas |
| :--- | :--- |
| **Desenvolvimento iOS** | Swift, SwiftUI, Combine, Observation (`@Observable`), UIKit |
| **Machine Learning & IA** | CoreML, Vision, FirebaseAI (Google Gemini), Translation API |
| **Recursos Nativos (Mídia)** | AVFoundation (TTS), PhotosUI, MapKit, Swift Charts |
| **Rede & Dados (Mobile)** | `URLSession` (`async/await`), WebSockets, JSONDecoder/Encoder |
| **Hardware & IoT** | C++, NodeMCU (ESP8266), Sensores (BMP280 I2C, Umidade) |
| **Backend & Middleware** | Node-RED, CouchDB / IBM Cloudant |

---

## 🚀 Como Executar os Projetos

### 1. Clone este repositório

```bash
git clone https://github.com/luisfelipe1005/swift-hackatruck.git
```

### 2. Projetos Mobile (Xcode)

- Abra o arquivo `.xcodeproj` no **Xcode** (Requer iOS 16+ para alguns frameworks como PhotosUI).
- Para projetos **IoT / Servidor Local**: No arquivo `ViewModel.swift`, altere a URL de `127.0.0.1` para o **endereço IP** real da sua máquina na rede local caso vá testar em um iPhone físico.
- Para projetos com **CoreML**: Verifique se os arquivos `.mlmodel` (ex: YOLOv3, MobileNetV2) estão importados corretamente no projeto.

### 3. Projetos de Hardware (ESP8266)

- Abra os códigos `.cpp` / `.ino` na **Arduino IDE**.
- Configure o `WIFI_SSID` e `WIFI_PASSWORD`.
- Faça a instalação das bibliotecas requeridas via Library Manager antes do upload.

---

## 🎓 Agradecimentos e Instituição

Projetos desenvolvidos durante a passagem do laboratório móvel do **HackaTruck MakerSpace** pela **Universidade Federal de Santa Maria (UFSM)**, uma iniciativa patrocinada e executada pelo **Instituto de Pesquisas Eldorado** para fomentar a formação prática e tecnológica nas universidades brasileiras.
