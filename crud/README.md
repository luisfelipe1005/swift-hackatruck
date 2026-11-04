# 🐉 Bestiário RPG - App de Monstros (iOS)

Este é um aplicativo iOS nativo construído com SwiftUI projetado para gerenciar e visualizar fichas de monstros de RPG (como D&D 5e e Tales of the Valiant). Ele permite aos usuários listar monstros existentes, visualizar seus atributos e habilidades em detalhes, e criar novas criaturas tanto manualmente quanto utilizando Inteligência Artificial, enviando-as para um servidor local (Node-RED / Banco de Dados).

## 📱 Telas e Funcionalidades

O projeto é dividido em quatro views principais e uma forte camada de dados:

### 1. Lista de Monstros (`ContentView.swift`)
A tela inicial do aplicativo que exibe todas as criaturas cadastradas.
- **Navegação Dinâmica:** Utiliza `NavigationStack` e `NavigationLink` para rotear o usuário para a tela de detalhes de cada monstro.
- **Imagens Assíncronas:** Usa `AsyncImage` para carregar avatares dos monstros a partir de URLs (`hdurl`), com uma imagem de *fallback* (shitpost-dog) caso a URL seja nula.
- **Design:** Apresenta os monstros em cards simples com bordas pretas sobre um fundo branco, em contraste com o fundo vermelho da tela principal.

### 2. Tela de Detalhes (`ShowView.swift`)
Uma tela focada em exibir a "Ficha do Monstro" (Stat Block) completa.
- **Layout Temático:** Fundo em `LinearGradient` de branco para preto. A imagem do monstro ganha destaque com cantos arredondados e sombras.
- **Atributos (Stats):** Exibe informações vitais de combate como Classe de Armadura (CA), Vida (HP), Desafio (CR), Velocidade, além dos 6 atributos base (FOR, DES, CON, INT, SAB, CAR).
- **Habilidades:** Mostra os Sentidos, Idiomas, Imunidades, Resistências, Traços Especiais (`traits`) e Ações (`actions`).

### 3. Criação Manual de Monstros (`CreateView.swift`)
Um formulário completo (`Form`) em SwiftUI para a inserção de novos monstros no banco de dados.
- **Categorização em Seções:** Os campos estão divididos logicamente em "Informações Básicas", "Combate", "Atributos Base", "Defesas/Sentidos" e "Habilidades".
- **Validação de Entrada:** Campos puramente numéricos (como HP, CR e atributos) forçam a abertura do teclado numérico (`.keyboardType(.numberPad)`).
- **Texto Longo:** Campos de Habilidades (Traços e Ações) utilizam o eixo vertical (`axis: .vertical`) com limite de linhas, permitindo que o usuário digite textos longos confortavelmente.

### 4. Criação Avançada com IA (`CreateAdvView.swift`)
Uma tela inovadora com interface de chat que utiliza o **Google Gemini** para gerar monstros de RPG instantaneamente a partir de uma ideia em texto.
- **Inteligência Artificial:** Integração com o FirebaseAI utilizando o modelo leve e rápido `gemini-3.1-flash-lite`.
- **Engenharia de Prompt:** O app envia um prompt estrito em background, instruindo a IA a agir como um assistente de criação de monstros e retornar *exclusivamente* um JSON estruturado.
- **Parsing e Salvamento Inteligente:** O aplicativo recebe a resposta, faz uma limpeza agressiva utilizando Regex para isolar o bloco JSON, decodifica diretamente para o modelo `Monstro` e adiciona ao banco de dados via ViewModel.

## ⚙️ Arquitetura e Comunicação de Dados

- **Modelo (`Monstro`):** Estrutura em conformidade com `Codable` e `Hashable`. Compatível com bancos de dados NoSQL (como CouchDB/Cloudant) por incluir `_id` e `_rev`.
- **Gerenciamento de Estado (`ViewModel`):** Construído com a nova macro `@Observable` do Swift 5.9. Mantém a lista de monstros e coordena as chamadas de rede.
- **Rede (`Service`):**
  * **GET (`fetchMonstros`):** Consome a rota local `http://127.0.0.1:1880/adicionar` (via `async/await`) e decodifica o JSON para popular a lista.
  * **POST (`createMonstro`):** Transforma um objeto `Monstro` em JSON e o envia via POST para a rota `http://127.0.0.1:1880/criar`.
- **Extensão Útil:** Inclui uma extensão de `String` (`htmlToSwiftUIString`) capaz de renderizar strings contendo tags HTML em `AttributedString` nativo do UIKit/SwiftUI.

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Swift
- **UI Framework:** SwiftUI
- **Arquitetura:** MVVM (Model-View-ViewModel) com `@Observable`
- **Rede:** `URLSession` nativo, REST API, JSONDecoder/JSONEncoder
- **Inteligência Artificial:** FirebaseAI / Gemini API (Google AI)
- **Backend Esperado:** Node-RED operando localmente na porta 1880 (provavelmente conectado a um Cloudant/CouchDB).

## 🚀 Como Executar e Testar

1. **Configuração do Backend (Node-RED):**
   * Certifique-se de que seu fluxo do Node-RED esteja rodando na porta `1880`.
   * Verifique as rotas configuradas. *(Nota: Atualmente o app faz o GET no `/adicionar` e o POST no `/criar`. Confirme se essas rotas coincidem exatamente com o seu Node-RED).*
2. **Configuração da Inteligência Artificial (FirebaseAI):**
   * Para que a funcionalidade da tela `CreateAdvView` funcione, o projeto precisa estar devidamente configurado com o Firebase e possuir acesso à API do Google AI/Gemini.
3. **Executando o App iOS:**
   * Abra o projeto no **Xcode**.
   * Se for rodar no **Simulador**, o IP `127.0.0.1` (localhost) funcionará perfeitamente.
   * **⚠️ Atenção (Dispositivo Físico):** Se for rodar em um iPhone real, você **deve** alterar as URLs no arquivo `ViewModel.swift` de `127.0.0.1` para o endereço de rede IP local da máquina onde o Node-RED está rodando (ex: `192.168.1.15`).
4. Compile (Cmd + R) e crie seus próprios monstros!
