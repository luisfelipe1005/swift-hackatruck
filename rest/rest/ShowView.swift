






import SwiftUI


struct ShowView: View {
    
    
    
    
    
    let date: String
        let title: String
    let explanation: String
    let alt: String
    let hdurl: String
    
    var explicacao: AttributedString {
            explanation.htmlToSwiftUIString
        }
    
    
    var body: some View {
            
            NavigationStack{
                ScrollView{
                    VStack{
                        
                        Spacer()
                        Spacer()
                        AsyncImage(url: URL(string: hdurl)){ result in
                            result.image?.resizable()
                                .scaledToFit() 
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        
                        Spacer()
                        Text("\(title)").font(.largeTitle)
                        
                        Spacer()
                        VStack{
                            Text(" \(alt)")
                            Text(" \(date)")
                            Text("\(explicacao)")
                        }
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
            
        }}



#Preview {
    ShowView(
        date: "🇧🇷",
                title: "Inspetor Faustão e o Mallandro",
                explanation: "Filme",
                alt: "generico",
                hdurl: "https://upload.wikimedia.org/wikipedia/pt/e/e2/Inspetor_faust%C3%A3o_e_o_mallandro.jpg"
            )
}
