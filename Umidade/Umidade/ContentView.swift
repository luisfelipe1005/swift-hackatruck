//
//  ContentView.swift
//  Umidade
//
//  Created by Turma02-19 on 27/10/26.
//

import SwiftUI


struct ContentView: View {
    @State var growthvalue: Int = 1
    @State var porcentagem: Int = 0
    @State var  umidade: [Int] = []
    @State private var showWelcomeView = false
    @State var avaliacao="seco"
    @StateObject private var UmidadeAtual = SensorViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Image(avaliacao)
                    .resizable().scaledToFit()
                ZStack(alignment: .bottom) {
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 60, height: 200)
                                    
                                   
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue)
                                        .frame(width: 60, height: CGFloat(porcentagem) * 2)
                                }
                                .animation(.easeInOut, value: porcentagem)
                                Spacer()
                Text(" \(porcentagem)%")
                Button("Ir para a Próxima Página") {
                    showWelcomeView = true
                }
                
                
                
            }
            .padding()
            
            .onAppear {
                UmidadeAtual.conectar()
            }
            .navigationDestination(isPresented: $showWelcomeView) {
                GraphView(umidade: umidade)
            }
            .onChange(of: UmidadeAtual.umidade) { novoValor in
                
                
                porcentagem = ((1024-novoValor) * 100) / 1024
                growthvalue = 1 + porcentagem/100
                
                umidade.append(porcentagem)
                print("Nova porcentagem: \(porcentagem)%")
                if(porcentagem<30){ avaliacao="seco"
                }
                else if(porcentagem>30 && porcentagem<60)
                {avaliacao="normal"}
                else{ avaliacao="molhado"
                }}
        }
    }
    }
    


#Preview {
    ContentView()
}
