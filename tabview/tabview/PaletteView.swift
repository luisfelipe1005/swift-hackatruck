//
//  fotos.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//


import SwiftUI

struct PaletteView: View {
    
   
    var body: some View {
        
        ZStack {
            
            Color.gray.ignoresSafeArea()
            
            VStack{
                
                Image(systemName: "paintpalette")
                
                    .resizable()
                    .frame(width: 250, height: 200).font(.title)
                    .foregroundStyle(.gray)
            }.frame(width: 300, height: 300)
            .background(Color.black).clipShape(Circle())
            
        }
        
 
    }
    }
    
        


   

#Preview {
    PaletteView()
}
