import SwiftUI
import UIKit

// Modelo e Extensão permanecem iguais
struct Monstro: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let name: String?
    let cr: Int?
    let size: String?
    let type: String?
    let CA: String?
    let HP: Int?
    let speed: String?
    let skill: String?
    let resistances: String?
    let immunities: String?
    let senses: String?
    let languages: String?
    let str: Int?
    let dex: Int?
    let con: Int?
    let int: Int?
    let sab: Int?
    let car: Int?
    let traits: String?
    let actions: String?
    let hdurl: String?
}

extension String {
    var htmlToSwiftUIString: AttributedString {
        guard let data = self.data(using: .utf8) else { return AttributedString(self) }
        do {
            let nsAttributedString = try NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
            return try AttributedString(nsAttributedString, including: \.uiKit)
        } catch {
            return AttributedString(self)
        }
    }
}

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var mostrarCriarMonstro = false
    @State private var mostrarCriarMonstroadv = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        if viewModel.monstros.isEmpty {
                            VStack(spacing: 15) {
                                Image(systemName: "folder.badge.questionmark")
                                    .font(.system(size: 60))
                                    .foregroundColor(.white)
                                
                                Text("Nenhum monstro encontrado.")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text("Clique nos botões acima para criar seu primeiro monstro!")
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.8))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.top, 100)
                            
                        } else {
                            ForEach(viewModel.monstros, id:\.self) { c in
                                NavigationLink(destination: ShowView(objeto: c)) {
                                    HStack {
                                        AsyncImage(url: URL(string: c.hdurl ?? "https://media.tenor.com/ngNha_kjdWwAAAAe/shitpost-dog.png")) { result in
                                            result.image?
                                                .resizable()
                                                .scaledToFit()
                                        }
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                        
                                        VStack(alignment: .leading) {
                                            Text(c.name ?? "Sem Nome").font(.headline).foregroundColor(.black)
                                            Text("CR: \(c.cr ?? 0)").font(.subheadline).foregroundColor(.gray)
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Monstros")
                
                // MARK: - Barra de Ferramentas (Toolbar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        HStack(spacing: 16) {
                            
                            Button(action: {
                                mostrarCriarMonstroadv = true
                            }) {
                                Image(systemName: "sparkles")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                            
                            Button(action: {
                                mostrarCriarMonstro = true
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                
                .sheet(isPresented: $mostrarCriarMonstro) {
                    CreateView(viewModel: viewModel)
                }
                .sheet(isPresented: $mostrarCriarMonstroadv) {
                    CreateAdvView(viewModel: viewModel)
                }
            }
        }
        .task {
            await viewModel.fetch()
        }
    }
}

#Preview("ContentView") {
    ContentView()
}
