//
//  fotos.swift
//  teste
//
//  Created by Turma02-19 on 15/10/26.
//


import SwiftUI

struct PincelView: View {
    
    
    var body: some View {

            
            ZStack {
                
                Color.pink.ignoresSafeArea()
                VStack{
                    
                    Image(systemName: "paintbrush")
                    
                        .resizable()
                        .frame(width: 250, height: 200).font(.title)
                        .foregroundStyle(.pink)
                }.frame(width: 300, height: 300)
                .background(Color.black).clipShape(Circle())
                
            }
            
        }
    }
    



   

#Preview {
    PincelView()
}
