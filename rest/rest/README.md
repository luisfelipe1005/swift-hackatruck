# 🌌 NASA APOD Explorer (Fotos Astronômicas do Dia)

Este é um aplicativo iOS nativo desenvolvido com SwiftUI que consome a API oficial da NASA para listar e exibir as impressionantes Fotos Astronômicas do Dia (APOD). O usuário pode rolar por um feed de descobertas espaciais e tocar em qualquer item para ver a imagem em alta definição junto com sua explicação científica.

## 📱 Telas e Funcionalidades

O aplicativo possui um fluxo de navegação mestre-detalhe (Master-Detail):

### 1. Feed Espacial (`ContentView.swift`)
A tela inicial exibe uma lista vertical contendo os registros fotográficos da NASA dentro de um período específico.
* **Consumo de API:** Faz uma requisição GET assíncrona ao carregar a tela (`.task`) para buscar os dados JSON.
* **Componentes Visuais:** Utiliza cards estilizados com borda preta sobre fundo branco, contendo uma miniatura da imagem (`AsyncImage`), o título da foto e a data do registro.
* **Navegação:** Cada card é um `NavigationLink` que passa os dados da foto selecionada para a tela de detalhes.

### 2. Detalhes da Imagem (`ShowView.swift`)
Uma tela imersiva dedicada a exibir as informações completas do registro astronômico.
* **Layout Imersivo:** Fundo em `LinearGradient` (branco para preto) dando um clima espacial e destacando a foto.
* **Imagem em Alta Resolução:** A imagem principal (`hdurl`) é carregada com cantos arredondados e sombra (`.shadow`).
* **Tratamento de Texto HTML:** As explicações (`explanation`) da NASA frequentemente vêm com tags HTML embarcadas. O aplicativo processa e renderiza esse HTML nativamente na interface!

## ⚙️ Arquitetura e Soluções Técnicas

O projeto foi estruturado seguindo o padrão **MVVM** e recursos modernos do Swift:

* **Modelo (`Foto`):** Uma `Struct` em conformidade com `Codable` e `Hashable` para facilitar o *parsing* do JSON da API e a iteração na interface.
* **ViewModel (`ViewModel`):** Utiliza a nova macro `@Observable` (Swift 5.9+) para gerenciar o array de fotos e notificar a `ContentView` automaticamente sobre atualizações. Define também as datas inicial e final da busca.
* **Camada de Rede (`Service`):** Isola a lógica do `URLSession`, utilizando `async/await` para buscar e decodificar os dados de forma assíncrona, evitando o travamento da thread principal (UI).
* **Extensão de String (`htmlToSwiftUIString`):** Uma poderosa extensão que converte Strings contendo marcações HTML em `AttributedString` usando `NSAttributedString.DocumentType.html`, garantindo que links, negritos e itálicos vindos da NASA sejam exibidos corretamente no SwiftUI.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **Interface UI:** SwiftUI (`NavigationStack`, `AsyncImage`, `LinearGradient`)
* **Arquitetura:** MVVM, Observation (`@Observable`)
* **Rede e Concorrência:** REST API, `async/await`, `URLSession`

## 🚀 Como Executar e Testar

1. Abra o arquivo no **Xcode**.
2. **Conexão de Rede:** Certifique-se de estar conectado à internet, pois o aplicativo buscará os dados diretamente do endpoint `science.nasa.gov` e baixará as imagens em tempo real.
3. Para mudar o período das fotos exibidas, você pode alterar as variáveis `datainicial` (ex: "140901") e `datafinal` (ex: "140930") no topo do arquivo do `ViewModel`. *(O formato usado pela API neste caso é YYMMDD).*
4. Compile e execute no **Simulador (Cmd + R)** ou via **Canvas (Preview)**.
