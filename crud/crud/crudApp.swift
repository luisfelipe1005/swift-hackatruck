//
//  crud_geminiApp.swift
//  crud+gemini
//
//  Created by Turma02-19 on 03/11/26.
//

import SwiftUI
import Firebase

@main
struct crudApp: App {
    init() {
    let provider = AppCheckDebugProviderFactory()
    AppCheck.setAppCheckProviderFactory(provider)
    FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
