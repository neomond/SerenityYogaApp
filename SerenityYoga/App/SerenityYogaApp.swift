//
//  SerenityYogaApp.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 04.10.24.
//

import SwiftUI
import Firebase
import FirebaseAppCheck

@main
struct SerenityYogaApp: App {
    
    @StateObject private var authManager = AuthManager()
    @StateObject var audioManager = AudioManager()
    
    init() {
        #if DEBUG
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        #else
        /// Use App Attest for production (iOS 14+)
        let providerFactory = AppAttestProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        #endif
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
                .environmentObject(audioManager)
        }
    }
}

//Email: nazrinatayeva@gmail.com
