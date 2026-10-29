import SwiftUI
import Translation

struct Comida: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let nome: String?
    let preco: Double?
    let categoria: String?
    let hdurl: String?
}

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var comidasAgrupadas: [String: [Comida]] {
        Dictionary(grouping: viewModel.comidas, by: { $0.categoria ?? "Outros" })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ForEach(comidasAgrupadas.keys.sorted(), id: \.self) { categoria in
                    
                    Section(header: Text(categoria).font(.title2).bold().foregroundColor(.primary)) {
                        
                        let comidasDaCategoria = comidasAgrupadas[categoria] ?? []
                        
                        ForEach(comidasDaCategoria, id: \.self) { comida in
                            ComponentView(comida: comida)
                                .listRowInsets(EdgeInsets())
                            //                                    .listRowBackground(Color.clear)
                        }
                    }
                }
                .navigationTitle("Cardápio")
            }
        }
        .task {
            await viewModel.fetch()
            var j = 0
            for i in viewModel.comidas {
                if i.categoria == "Pizzas" {
                    j+=1
                }
            }
            print(j)
        }
    }
}

struct ComponentView: View {
    @State var mostrar: Bool = false
    let comida: Comida
    
    var body: some View {
        ZStack {
            HStack{
                HStack{
                    AsyncImage(url: URL(string: comida.hdurl ?? "https://media.tenor.com/ngNha_kjdWwAAAAe/shitpost-dog.png" )){ result in
                        result.image?
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 100, height: 100)
                }
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Item: \(comida.nome ?? "Desconhecido")")
                        .font(.headline)
                    
                    Text("R$ \(comida.preco ?? 0.0, specifier: "%.2f")")
                        .foregroundColor(.green)
                    
                    Button(action: {
                        mostrar = true
                    }) {
                        Image(systemName: "translate")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    .translationPresentation(isPresented: $mostrar, text: comida.nome ?? " ")
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
        }
        .background(Color.teal.opacity(0.3))
    }
}

#Preview {
    ContentView()
}
