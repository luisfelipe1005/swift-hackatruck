import SwiftUI


struct ShowView: View {
    
    
    
    
    
    var cor: String = "pink"
    var icon: String = "paintbrush"
    var text: String = "teste"
    
    func dynamicColor() -> Color {
        
        if(cor=="pink"){
            return .pink
        }
        else   if(cor=="blue"){
            return .blue
        }
        else   if(cor=="gray"){
            return .gray
        }
        else {
            return .purple
        }
        
        
    }
    
    
    var body: some View {
        ZStack {
            dynamicColor().ignoresSafeArea()
            VStack{
                
                Spacer()
                VStack{
                    
                    Image(systemName: icon)
                    
                        .resizable()
                        .frame(width: 250, height: 200).font(.title)
                        .foregroundStyle(dynamicColor())
                }.frame(width: 300, height: 300)
                
                    .background(Color.black).clipShape(Circle())
                
                
                
                Spacer()
                Text("\(text)")
            }
        }
    }
    
}



#Preview {
    ShowView()
}
