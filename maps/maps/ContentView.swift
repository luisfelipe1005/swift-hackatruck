import SwiftUI
import MapKit
struct Location: Hashable, Identifiable {
    let id = UUID()
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}


struct ContentView: View {
    
    @State var Lugarpick: Location = Location(
        nome: "Cristo Redentor",
        foto: "https://upload.wikimedia.org/wikipedia/commons/9/98/Cidade_Maravilhosa.jpg",
        descricao: "Cristo Redentor é uma estátua que retrata Jesus Cristo localizada no topo do morro do Corcovado, a 709 metros acima do nível do mar, dentro do Parque Nacional da Tijuca. Tem vista para parte considerável da cidade brasileira do Rio de Janeiro, sendo a frente da estátua voltada para a Baía de Guanabara e as costas para a Floresta da Tijuca.",
        latitude: -22.9520561,
        longitude: -43.2105388
    )
    @State var arrayConteudos: [Location] = [
        Location(
            nome: "Cristo Redentor",
            foto: "https://upload.wikimedia.org/wikipedia/commons/9/98/Cidade_Maravilhosa.jpg",
            descricao: "Cristo Redentor é uma estátua que retrata Jesus Cristo localizada no topo do morro do Corcovado, a 709 metros acima do nível do mar, dentro do Parque Nacional da Tijuca. Tem vista para parte considerável da cidade brasileira do Rio de Janeiro, sendo a frente da estátua voltada para a Baía de Guanabara e as costas para a Floresta da Tijuca.",
            latitude: -22.9520561,
            longitude: -43.2105388
        ),
        
        Location(
            nome: "Grande Muralha da China",
            foto: "https://upload.wikimedia.org/wikipedia/commons/2/23/The_Great_Wall_of_China_at_Jinshanling-edit.jpg",
            descricao: "A Grande Muralha da China é uma série de fortificações construídas ao longo das fronteiras históricas do norte da China para proteger e consolidar os territórios dos impérios chineses contra invasões. Estendendo-se por milhares de quilômetros, é a mais longa estrutura já construída pelo homem.",
            latitude: 40.4319077,
            longitude: 116.5703749
        ),
        
        Location(
            nome: "Petra",
            foto: "https://upload.wikimedia.org/wikipedia/commons/2/2f/Treasury_petra_crop.jpeg",
            descricao: "Petra é uma cidade histórica e arqueológica localizada no sul da Jordânia, originalmente conhecida pelos nabateus como Raqmu. É famosa mundialmente por sua arquitetura esculpida diretamente nas rochas de arenito e por seu antigo sistema de canalização de água, sendo também apelidada de 'Cidade Rosa'.",
            latitude: 30.3284544,
            longitude: 35.4443622
        ),
        
        Location(
            nome: "Coliseu",
            foto: "https://upload.wikimedia.org/wikipedia/commons/d/d8/Colosseum_in_Rome-April_2007-1-_copie_2B.jpg",
            descricao: "O Coliseu, também conhecido como Anfiteatro Flaviano, é um enorme anfiteatro oval localizado no centro da cidade de Roma, Itália. Construído de concreto e areia, é o maior anfiteatro do mundo e palco histórico de combates de gladiadores, espetáculos públicos e encenações de batalhas.",
            latitude: 41.8902102,
            longitude: 12.4922309
        ),
        
        Location(
            nome: "Chichén Itzá",
            foto: "https://upload.wikimedia.org/wikipedia/commons/5/51/Chichen_Itza_3.jpg",
            descricao: "Chichén Itzá foi uma grande cidade pré-colombiana construída pela civilização maia no final do período clássico, localizada no estado mexicano de Yucatán. O seu principal marco é o Templo de Kukulcán (El Castillo), uma pirâmide de degraus que demonstra os profundos conhecimentos astronômicos dos maias.",
            latitude: 20.6842849,
            longitude: -88.5677826
        ),
        
        Location(
            nome: "Machu Picchu",
            foto: "https://upload.wikimedia.org/wikipedia/commons/e/eb/Machu_Picchu%2C_Peru.jpg",
            descricao: "Machu Picchu, frequentemente chamada de 'Cidade Perdida dos Incas', é uma cidadela inca do século XV situada no alto da Cordilheira dos Andes, no Peru. Construída pelo imperador Pachacuti, é o símbolo mais famoso do Império Inca e destaca-se por suas impressionantes construções em pedra polida sem o uso de argamassa.",
            latitude: -13.1631412,
            longitude: -72.5449629
        ),
        
        Location(
            nome: "Taj Mahal",
            foto: "https://upload.wikimedia.org/wikipedia/commons/c/c8/Taj_Mahal_in_March_2004.jpg",
            descricao: "O Taj Mahal é um grandioso mausoléu situado em Agra, na Índia, construído inteiramente em mármore branco incrustado com pedras semipreciosas. Foi encomendado pelo imperador Shah Jahan em 1632 para abrigar o túmulo de sua esposa favorita, Mumtaz Mahal, sendo considerado a maior prova de amor do mundo.",
            latitude: 27.1751448,
            longitude: 78.0421422
        ),
    ]
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center:
                CLLocationCoordinate2D (latitude: -22.9520561, longitude: -43.2105388),
            span: MKCoordinateSpan (latitudeDelta: 1, longitudeDelta: 1)))
    
    @State private var localSelecionado: Location?
    
    @State private var mostrarSheet = false
    
    
    var body: some View {
        
        ZStack{
        VStack{
            Picker("Please choose a color", selection: $Lugarpick) {
                ForEach(arrayConteudos, id: \.self) { item in
                    Text("\(item.nome)")
                }.onChange(of: Lugarpick) { _, newValue in
                    mostrarSheet = true
                    withAnimation {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: newValue.latitude, longitude: newValue.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                            )
                        )
                    }
                    
                    
                }
                
            }
            
                
                
                Map(position: $position, selection: $localSelecionado){
                    ForEach(arrayConteudos, id: \.self) { conteudo in
                        Marker(
                            conteudo.nome,
                            coordinate: CLLocationCoordinate2D(
                                latitude: conteudo.latitude,
                                longitude: conteudo.longitude
                            )).tag(conteudo)
                    }
                    }.ignoresSafeArea()
                .sheet(item: $localSelecionado) { conteudo in
                    if let index = arrayConteudos.firstIndex(where: { $0.id == conteudo.id }) {
                        ShowView(arrayConteudo: $Lugarpick)
                    }
                }
            }
            
            
            
        }
    }
}

#Preview("ContentView") {
    
    ContentView()
}
