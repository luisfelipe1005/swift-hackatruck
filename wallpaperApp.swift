//
//  fotos.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//


import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @State var username: String = ""
    var body: some View {
        ZStack {
            Image("wallpaper")
                .resizable()
                .scaledToFill()
            VStack() {
                Text("Bem vindo").foregroundStyle(.white)
                Spacer()
                TextField(
                        "Insira seu nome",
                        text: $username
                ).foregroundStyle(.orange).font(.largeTitle) .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .frame(width: 200)
                
                Spacer()
                Spacer()
                Button("Clique") {
                    showingAlert = true
                           }.font(.largeTitle)
                           .alert("Aviso Importante", isPresented: $showingAlert) {
                               Button("OK", role: .cancel) { }
                           } message: {
                               Text("Olà!  \(username)")
                           }
            }
            
            
            
            
        }}
    
}

#Preview {
    ContentView()
}
