//
//  fotos.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//


import SwiftUI

struct ListView: View {
    
    
    
    var body: some View {
        NavigationStack{
            List {
                            HStack {
                                Text("Rosa")
                                Spacer()
                                Image(systemName: "paintbrush")
                            }
                            HStack {
                                Text("azul")
                                Spacer()
                                Image(systemName: "paintbrush.pointed")
                            }
                            HStack {
                                Text("cinza")
                                Spacer()
                                Image(systemName: "paintpalette")
                            }
                        }
                
                .navigationTitle("List")
            }
            
        
    }
    
}
#Preview {
    ListView()
}
