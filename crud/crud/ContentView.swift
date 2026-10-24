import SwiftUI
import UIKit

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
    
    var body: some View {
        
        
        ZStack(){
            Color.red.ignoresSafeArea()
            NavigationStack{
                ScrollView{
                    VStack{
                        VStack {
                            ForEach(viewModel.monstros, id:\.self){c in
                                
                                
                                NavigationLink(destination: ShowView(objeto: c)) {
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: c.hdurl ?? "https://media.tenor.com/ngNha_kjdWwAAAAe/shitpost-dog.png" )){ result in
                                            result.image?
                                                .resizable()
                                                .scaledToFit()
                                        }
                                        .frame(width: 50, height: 50)
                                        VStack{
                                            Text("\(c.name ?? "teste")").font(.title)
                                                                                        Text("\(c.cr ?? 0) ")
                                            
                                        }
                                    }
                                }
                                
                                
                                
                            }.background(Color.white).border(.black)
                                .navigationTitle("Monstros").frame(width: 350)
                            
                            
                            
                                .toolbar {
                                                    ToolbarItem(placement: .navigationBarTrailing) {
                                                        Button(action: {
                                                            mostrarCriarMonstro = true
                                                        }) {
                                                            Image(systemName: "plus.circle.fill")
                                                                .font(.title2)
                                                                .foregroundColor(.white)
                                                        }
                                                    }
                                                }
                                                
                                                .sheet(isPresented: $mostrarCriarMonstro) {
                                                  
                                                    CreateView(viewModel: viewModel)
                                                }
                            
                            
                            
                            
                            
                            
                            
                        }
                        .ignoresSafeArea()}
                }}
        }.task{
            await viewModel.fetch()
        }
    }
}
#Preview("ContentView") {
    ContentView()
}
