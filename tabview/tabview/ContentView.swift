//
//  ContentView.swift
//  tabview
//
//  Created by Turma02-19 on 19/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PincelView()
                .tabItem {
                    Label("rosa", systemImage: "paintbrush")
                }
            
            PinselView()
                .tabItem {
                    Label("Azul", systemImage: "paintbrush.pointed")
                }
            
            PaletteView()
                .tabItem {
                    Label("Cinza", systemImage: "paintpalette")
                }
            ListView()
                .tabItem {
                    Label("lista", systemImage: "list.bullet")
                }
        }
    }
}
