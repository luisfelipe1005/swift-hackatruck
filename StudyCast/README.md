# 📚 Study Cast: Leitor e Reconhecedor de Texto (OCR)

Este projeto é um aplicativo iOS nativo focado em produtividade, estudo e acessibilidade. O "Study Cast" permite que os usuários selecionem imagens da galeria (como fotos de cadernos, livros ou documentos), extraiam os textos automaticamente usando Visão Computacional (OCR) e escutem o conteúdo lido em voz alta através de síntese de voz.

## 🏗️ Arquitetura do Projeto

O código foi construído utilizando as APIs nativas da Apple, separando a responsabilidade de seleção de mídia, processamento de inteligência artificial e interface de usuário:

### 📱 1. Interface e Experiência do Usuário (`ContentView.swift` e `PhotosUI`)
A aplicação iOS foi desenvolvida utilizando SwiftUI com um foco em design escuro (Dark Mode) e usabilidade direta.
- **Seleção de Fotos (`PhotosPicker`):** Utiliza o framework moderno `PhotosUI` para garantir privacidade e segurança, permitindo que o usuário escolha imagens da galeria sem precisar dar acesso total ao rolo da câmera.
- **Interface Visual:** Utiliza um `ZStack` com fundo preto para uma imersão maior. A tela exibe dinamicamente a imagem selecionada, o texto extraído e botões estilizados com gradientes para acionar as funções de leitura e escuta.

### 🧠 2. Processamento de Imagem e OCR (Framework `Vision`)
A camada lógica de extração de texto utiliza o poderoso motor de Machine Learning nativo do iOS:
- **`VNRecognizeTextRequest`:** Faz a varredura da imagem convertida (`CGImage`) em busca de caracteres.
- **Configurações de Precisão:** O OCR está configurado para o nível máximo de acurácia (`.accurate`), utilizando correção de linguagem automática e suportando simultaneamente os idiomas Português do Brasil (`pt-BR`) e Inglês (`en-US`).
- **Assincronicidade:** O processamento pesado da imagem é jogado para uma *thread* global secundária (`DispatchQueue.global(qos: .userInitiated)`), garantindo que o aplicativo não congele enquanto "lê" a foto, retornando o resultado para a *Main Thread* de forma segura.

### 🗣️ 3. Acessibilidade e Leitura em Voz Alta (Framework `AVFoundation`)
O aplicativo transforma textos estáticos em áudio, facilitando o consumo do conteúdo:
- **`AVSpeechSynthesizer`:** Instância responsável por gerenciar a fila de reprodução de áudio.
- **`AVSpeechUtterance`:** Configura o texto a ser falado, definindo a voz regional para Português do Brasil (`pt-BR`) e ajustando a velocidade de leitura (`rate` de 0.45) para garantir clareza e compreensão durante os estudos.

## 🛠️ Tecnologias Utilizadas

- **Frontend (Mobile):** Swift, SwiftUI.
- **Processamento de Imagem (OCR):** Vision Framework.
- **Síntese de Voz (TTS):** AVFoundation.
- **Gerenciamento de Mídia:** PhotosUI.

## 🚀 Como Executar

### Configurando o Aplicativo iOS
1. Faça o clone do repositório e abra o projeto no **Xcode**.
2. Certifique-se de que o *Deployment Target* (versão mínima do iOS) esteja configurado para o **iOS 16.0** ou superior (requisito do `PhotosPicker`).
3. Compile o projeto e execute no Simulador ou em um iPhone/iPad físico.
4. Ao abrir o app, clique em **"Pegar da Galeria"**, selecione uma imagem contendo texto, clique em **"Identificar Texto"** para gerar a transcrição e, em seguida, em **"Escutar Texto"** para ouvir a leitura.
