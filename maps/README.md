# 🗺️ Mapa das Maravilhas do Mundo (MapKit & SwiftUI)

Este é um aplicativo iOS interativo construído com SwiftUI e o framework nativo **MapKit**. O aplicativo permite que o usuário explore diversas maravilhas do mundo (como Cristo Redentor, Machu Picchu, Coliseu, etc.), navegando dinamicamente por um mapa global e acessando informações detalhadas sobre cada local.

## 📱 Funcionalidades

O aplicativo oferece uma experiência fluida baseada em geolocalização e transições de câmera:

### 1. Mapa Interativo (`ContentView.swift`)
* **Navegação com Picker:** Um menu suspenso (`Picker`) no topo da tela permite ao usuário selecionar uma das maravilhas. Ao escolher um novo local, a câmera do mapa viaja suavemente (`withAnimation`) até as coordenadas exatas daquele ponto.
* **Marcadores (Markers):** O mapa renderiza `Marker`s interativos baseados em um array de dados (`arrayConteudos`).
* **Integração com `CLLocationCoordinate2D`:** Utiliza as coordenadas de latitude e longitude reais de cada monumento para posicioná-los precisamente no globo.

### 2. Tela de Detalhes (`ShowView.swift`)
Ao tocar em um marcador no mapa, um modal (`.sheet`) sobe exibindo a ficha completa do local.
* **Layout Temático:** Fundo amarelo vibrante com uma caixa de texto marrom, destacando a descrição.
* **Imagem Assíncrona:** A foto real do monumento é carregada da internet usando `AsyncImage` e recebe um acabamento refinado com `.overlay` de bordas arredondadas pretas.
* **Comunicação de Dados:** Utiliza `@Binding` para receber e atualizar o estado do local selecionado na tela principal.

## ⚙️ Estrutura de Dados e Código

* **Modelo `Location`:** Uma `Struct` em conformidade com `Identifiable` e `Hashable`. Ela armazena o `UUID`, nome, URL da foto, descrição e as coordenadas geográficas (latitude e longitude) de cada ponto de interesse.
* **Gerenciamento de Câmera:** O estado da câmera do mapa é controlado pela variável `@State var position = MapCameraPosition.region(...)`, que define o centro do mapa e o nível de zoom (`MKCoordinateSpan`).

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **UI Framework:** SwiftUI
* **Framework de Mapa:** MapKit (Apple)
* **Tipos de Dados Geográficos:** CoreLocation (`CLLocationCoordinate2D`, `MKCoordinateRegion`, `MKCoordinateSpan`)

## 🚀 Como Executar e Testar

1. Abra o arquivo no **Xcode**.
2. **Requisito de Internet:** O simulador ou dispositivo físico precisa de conexão com a internet por dois motivos:
   * Para baixar as texturas/tiles do mapa da Apple (MapKit).
   * Para baixar as fotos dos monumentos hospedadas na Wikipedia (via `AsyncImage`).
3. Para uma experiência completa de animação do mapa, recomenda-se rodar no **Simulador (Cmd + R)** ou em um iPhone físico, em vez de usar apenas o Canvas (Preview).
4. No aplicativo, teste selecionar um local pelo `Picker` para ver a animação da câmera, e depois toque em um "balão" (marcador) vermelho no mapa para abrir a tela de detalhes.
