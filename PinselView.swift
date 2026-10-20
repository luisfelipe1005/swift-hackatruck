//
//  fotos.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//


import SwiftUI

struct PinselView: View {
    
    
    var body: some View {
        
        ZStack {
            
            Color.blue.ignoresSafeArea()
            VStack{
                
                Image(systemName: "paintbrush.pointed")
                
                    .resizable()
                    .frame(width: 250, height: 200).font(.title)
                    .foregroundStyle(.blue)
            }.frame(width: 300, height: 300)
            .background(Color.black).clipShape(Circle())
            
            
            
          
        }
    }
}
        


   

#Preview {
    PinselView()
}
