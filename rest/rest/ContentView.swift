import SwiftUI
import UIKit

struct Foto: Codable, Hashable {
let post_id: Int
let date: String?
    let title: String?
let explanation: String?
let alt: String?
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
    
    
    
    var body: some View {
        
        
        ZStack(){
            Color.red.ignoresSafeArea()
            
            
            
            
            NavigationStack{
                ScrollView{
                    VStack{
                        VStack {
                            ForEach(viewModel.fotos, id:\.self){c in
                                
                                
                                NavigationLink(destination: ShowView(date:c.date ?? "221026", title: c.title ?? "teste",  explanation: c.explanation ?? "eu to testando o rest em swift", alt:c.alt ?? "isso ta enchendo o saco", hdurl:c.hdurl ?? "https://media.tenor.com/ngNha_kjdWwAAAAe/shitpost-dog.png"                                )) {
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: c.hdurl ?? "https://media.tenor.com/ngNha_kjdWwAAAAe/shitpost-dog.png" )){ result in
                                            result.image?
                                                .resizable()
                                                .scaledToFit()
                                        }
                                        .frame(width: 50, height: 50)
                                        VStack{
                                            Text("\(c.title ?? "teste")").font(.title)
                                            Text("\(c.date ?? "big louis") ")
                                        }
                                    }
                                }
                                
                                
                                
                            }.background(Color.white).border(.black)
                                .navigationTitle("List").frame(width: 350)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
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
