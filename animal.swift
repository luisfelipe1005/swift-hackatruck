//
//  fotos.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//


import SwiftUI

struct ContentView: View {
    
    @State var distancia: Double = 0
    @State var tempo: Double = 0
    @State var velocidade: Double = 0
    @State var animal: String = "???"
    @State var cor: String = "gray"
    
    func dynamicColor() -> Color {
 
        if(velocidade==0){
            return .gray
        }
        else if(velocidade<10){
            return .verdeclaro
        }
        else if(velocidade<40 ){
            return .azulclaro
        }
        else if(velocidade<80){
            return .laranjaclaro
        }
        else if(velocidade<100){
            return .amareloclaro
        }
        else{
            return .vermelhoclaro
        }
       }

    var body: some View {
        
        
        VStack() {
            Spacer()
            Text("Bem vindo").foregroundStyle(.black)
            Spacer()
            TextField(
                "Insira o tempo",
                value: $tempo,format: .number
            ).foregroundStyle(.orange).font(.largeTitle) .textInputAutocapitalization(.never).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
                .border(.secondary)
                .frame(width: 200)
            
            Spacer()
            TextField(
                "Insira o tempo",
                value: $distancia,format: .number
            ).foregroundStyle(.orange).font(.largeTitle) .textInputAutocapitalization(.never).padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
                .border(.secondary)
                .frame(width: 200)
            Spacer()
            Button("Calcule") {
                velocidade=tempo/distancia
                if(velocidade==0){
                    animal="???"
                }
                else if(velocidade<=10){
                    animal="tartaruga"
                }
                else if(velocidade<=40 ){
                    animal="macaco"
                }
                else if(velocidade<=80){
                    animal="ema"
                }
                else if(velocidade<=100){
                    animal="tigre"
                }
                else{
                    animal="carro"
                }
            }
            Spacer()
            Text("\(velocidade.formatted()) km/h").foregroundStyle(.black)
                .font(.title)
            
            Spacer()
            Image(animal)
                .resizable()
            
                .resizable().frame(width:400,height:300).clipShape(Circle()).padding()
            Spacer();
            ZStack{
                Rectangle().fill(.black).frame(width:300, height:200)
                
                VStack{
                    HStack{
                        Text("Tartaruga   (1-10)Km/h").foregroundStyle(.white)
                        
                        Circle().fill(.red).frame(width:20, height:20)
                    }
                    
                    HStack{
                        Text("Macaco (11-40)Km/h").foregroundStyle(.white)
                        
                        Circle().fill(.red).frame(width:20, height:20)
                    }
                    HStack{
                        Text("Ema (41-80)Km/h").foregroundStyle(.white)
                        
                        Circle().fill(.red).frame(width:20, height:20)
                    }
                    HStack{
                        Text("Tigre (81-100").foregroundStyle(.white)
                        
                        Circle().fill(.red).frame(width:20, height:20)
                    }
                    HStack{
                        Text("Carro de formula 1 (101-....)Km/h").foregroundStyle(.white)
                        
                        Circle().fill(.red).frame(width:20, height:20)
                    }
                }
                
            }
            
            
        }.background(dynamicColor())
  
    }
        
}

   

#Preview {
    ContentView()
}
