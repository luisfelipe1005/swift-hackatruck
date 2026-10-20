//
//  ContentView.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            HStack(){
                Rectangle().fill(.red).frame(width:100, height:100)
                Spacer()
                Rectangle().fill(.green).frame(width:100, height:100)
                
            }
            Spacer()
            HStack(){
                Rectangle().fill(.blue).frame(width:100, height:100)
                Spacer()
                Rectangle().fill(.yellow).frame(width:100, height:100)
               
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
