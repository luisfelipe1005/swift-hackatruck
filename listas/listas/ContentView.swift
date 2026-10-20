import SwiftUI
struct Conteudo: Hashable {
let categoria: String
let nome: String
let capa: String
let ano: String
let genero: String
let pais: String
let imdb: Double
}
struct ContentView: View {
    
    
    @State var arrayConteudos: [Conteudo] = [
        Conteudo (categoria: "Série", nome: "Stranger Things", capa:
                    "https://upload.wikimedia.org/wikipedia/pt/2/29/Stranger_Things_Temporada_1_Poster.jpg",
                  ano: "2016", genero: "Terror", pais: "🇺🇸", imdb: 8.6),
        Conteudo (categoria: "Série", nome: "The Office", capa:
                    "https://upload.wikimedia.org/wikipedia/pt/2/2a/The_Office_temporada_1.jpg", ano: "2005",
                  genero: "Sitcom", pais: "🇺🇸", imdb: 9),
        Conteudo(categoria: "Filme", nome: "Inspetor Faustão e o Mallandro", capa: "https://upload.wikimedia.org/wikipedia/pt/e/e2/Inspetor_faust%C3%A3o_e_o_mallandro.jpg", ano: "1991", genero: "Comédia", pais: "🇧🇷", imdb: 2.3),
        Conteudo(categoria: "Série", nome: "Breaking Bad", capa: "https://m.media-amazon.com/images/M/MV5BMzU5ZGYzNmQtMTdhYy00OGRiLTg0NmQtYjVjNzliZTg1ZGE4XkEyXkFqcGc@._V1_.jpg", ano: "2008", genero: "Drama/Crime", pais: "🇺🇸", imdb: 9.5),
            Conteudo(categoria: "Série", nome: "Game of Thrones", capa: "https://m.media-amazon.com/images/M/MV5BNGYxOGJkMjItZjVkZC00OGEzLWExNjktOTZmNGZhZmRlMTk2XkEyXkFqcGc@._V1_QL75_UX190_CR0,0,190,281_.jpg", ano: "2011", genero: "Fantasia", pais: "🇺🇸", imdb: 9.2),
            Conteudo(categoria: "Série", nome: "Chernobyl", capa: "https://beam-images.warnermediacdn.com/BEAM_LWM_DELIVERABLES/396999a6-3fff-4af3-802b-10c46d10deff/86727c6a-d0cf-477e-adfe-8f5f01275993?host=wbd-images.prod-vod.h264.io&partner=beamcom&w=1024&w=1024", ano: "2019", genero: "Drama Histórico", pais: "🇺🇸", imdb: 9.3),
            Conteudo(categoria: "Série", nome: "Severance", capa: "https://m.media-amazon.com/images/M/MV5BZDI5YzJhODQtMzQyNy00YWNmLWIxMjUtNDBjNjA5YWRjMzExXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg", ano: "2022", genero: "Ficção/Suspense", pais: "🇺🇸", imdb: 8.7),
            
            Conteudo(categoria: "Filme", nome: "Sharknado", capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiZ3WzY6XhOEyONUkDKyDtn1OpRECXKCZn7PXa7Ow99RW7dJaXNIPbV3U&s=10", ano: "2013", genero: "Desastre/Trash", pais: "🇺🇸", imdb: 3.3),
            Conteudo(categoria: "Série", nome: "Os Mutantes: Caminhos do Coração", capa: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhQaFPfiBlaPTVBEjhlcsDT-DlWd1j9ehWCfw0XXyWRkGnsnhViYFB1ms&s=10", ano: "2008", genero: "Ficção/Trash", pais: "🇧🇷", imdb: 4.8),
            Conteudo(categoria: "Série", nome: "Riverdale", capa: "https://www.toyshow.com.br/colecionaveis/action-figures/quadro-poster-personagens-riverdale-wall-street-posters?srsltid=AU7gw4XDgXi7w-GGDP6lye91Rs0Ia9oZKL_f4hTswX348P3rJxJMpo_-", ano: "2017", genero: "Mistério/Teen", pais: "🇺🇸", imdb: 6.5),
            Conteudo(categoria: "Filme", nome: "Tudo Bem no Natal que Vem", capa: "https://upload.wikimedia.org/wikipedia/pt/8/8a/Tudo_Bem_no_Natal_Que_Vem.jpg?utm_source=pt.wikipedia.org&utm_campaign=index&utm_content=original", ano: "2020", genero: "Comédia", pais: "🇧🇷", imdb: 6.7)
    ]
    
    var series: [Conteudo] {
        arrayConteudos.filter { $0.categoria == "Série" }
        
    }
    var filmes: [Conteudo] {
        arrayConteudos.filter { $0.categoria == "Filme" }
    }
    
    var bons: [Conteudo] {
        arrayConteudos.filter { $0.imdb > 8 }
    }
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Text("Series")
                    VStack {
                        ForEach(series, id:\.self){c in
                            NavigationLink(destination: ShowView(nome: c.nome, categoria:c.categoria, genero:c.genero, pais:c.pais, imdb:c.imdb, capa:c.capa,
                                                                 ano:c.ano                                )) {
                                HStack{
                                    
                                    AsyncImage(url: URL(string: c.capa)){ result in
                                        result.image?
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: 50, height: 50)
                                    VStack{
                                        Text("\(c.nome)").font(.title)
                                        Text("\(c.ano)")
                                    }
                                    Spacer()
                                    Text("\(c.pais)")
                                }
                            }
                            
                            
                            
                        }.background(Color.white).border(.black)
                            .navigationTitle("List").frame(width: 350)
                        
                        
                        
                        Text("Filmes")
                        VStack {
                            ForEach(filmes, id:\.self){c in
                                NavigationLink(destination: ShowView(nome: c.nome, categoria:c.categoria, genero:c.genero, pais:c.pais, imdb:c.imdb, capa:c.capa,
                                                                     ano:c.ano                                )) {
                                    HStack{
                                        
                                        AsyncImage(url: URL(string: c.capa)){ result in
                                            result.image?
                                                .resizable()
                                                .scaledToFill()
                                        }
                                        .frame(width: 50, height: 50)
                                        VStack{
                                            Text("\(c.nome)").font(.title)
                                            Text("\(c.ano)")
                                        }
                                        Spacer()
                                        Text("\(c.pais)")
                                    }
                                }
                                
                            }
                            
                        }.background(Color.white).border(.black)
                            .navigationTitle("List").frame(width: 350, ).padding()
                            
                        
                        
                        
                        
                        Text("Bons")
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(bons, id:\.self){c in
                                    NavigationLink(destination: ShowView(nome: c.nome, categoria:c.categoria, genero:c.genero, pais:c.pais, imdb:c.imdb, capa:c.capa,
                                                                         ano:c.ano                                )) {
                                        HStack{
                                            
                                            AsyncImage(url: URL(string: c.capa)){ result in
                                                result.image?
                                                    .resizable()
                                                    .scaledToFill()
                                            }
                                            .frame(width: 100, height: 150)
                                            
                                            
                                        }
                                        
                                    }
                                }
                                
                              
                                
                                
                            }
                        }}
                }.background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color.black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()}
        }}
}

#Preview("ContentView") {
    ContentView()
}
