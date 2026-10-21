






import SwiftUI


struct ShowView: View {
    
    
    
    @Binding var arrayConteudo: Location
    
    
    
    
    var body: some View {
        ZStack(){
            
            Color.yellow.ignoresSafeArea()
            
            VStack{
                Spacer()
                AsyncImage(url: URL(string: arrayConteudo.foto)){ result in
                    result.image?
                        .resizable()
                        .scaledToFill().overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }.frame(width: 300, height: 200)
                
                Spacer()
                Text("\(arrayConteudo.nome)")
                
                ZStack{
                    Rectangle()
                        .fill(Color.brown)
                        .frame(width: 300, height: 500)
                    Text("\(arrayConteudo.descricao)").frame(width: 300, height: 500)
                    
                }
            }
            
            
        }
        
    }
    
}


#Preview {
    let locationExemplo = Location(
        nome: "Cristo Redentor",
        foto: "https://upload.wikimedia.org/wikipedia/commons/9/98/Cidade_Maravilhosa.jpg",
        descricao: "Cristo Redentor é uma estátua que retrata Jesus Cristo localizada no topo do morro do Corcovado, a 709 metros acima do nível do mar, dentro do Parque Nacional da Tijuca. Tem vista para parte considerável da cidade brasileira do Rio de Janeiro, sendo a frente da estátua voltada para a Baía de Guanabara e as costas para a Floresta da Tijuca.",
        latitude: -22.9520561,
        longitude: -43.2105388
        )
        
        ShowView(arrayConteudo: .constant(locationExemplo))
}
