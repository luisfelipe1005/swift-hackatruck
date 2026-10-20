//
//  fotos.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(){
            Spacer()
            Image("airfryer")
                .resizable().frame(width:100,height:100)
                .clipShape(Circle()).padding()
            Spacer()
            VStack(){
                Text("teste")
                Text("airfryer")
            }
            Spacer()
            
        }
                
            
        }
    
}

#Preview {
    ContentView()
}
