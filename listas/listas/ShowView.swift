






import SwiftUI


struct ShowView: View {
    
    
    
    
    
    var nome: String
    var categoria: String
    var genero: String
    var pais: String
    var imdb: Double
    var capa: String
    var ano: String
    
    
    
    
    var body: some View {
        ZStack {
            
            VStack{
                
                Spacer()
                Spacer()
                AsyncImage(url: URL(string: capa)){ result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }.frame(width: 300, height: 200)
                
                
                
                
                
                
                
                
                
                
                
                
                
                Spacer()
                Text("\(nome)").font(.largeTitle)
                
                Spacer()
                VStack{
                    Text("Categoria: \(categoria)")
                    Text("Ano: \(ano)")
                    Text("Genero \(genero)")
                    Text("pais \(pais)")
                }
                Spacer()
                Text("IMBd: \(imdb.formatted())").font(.largeTitle)
            }
        }.background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.black]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .ignoresSafeArea()
    }
    
    
}


#Preview {
    ShowView(
                nome: "Inspetor Faustão e o Mallandro",
                categoria: "Filme",
                genero: "Comédia",
                pais: "🇧🇷",
                imdb: 2.3,
                capa: "https://upload.wikimedia.org/wikipedia/pt/e/e2/Inspetor_faust%C3%A3o_e_o_mallandro.jpg", ano: "1995"
            )
}
