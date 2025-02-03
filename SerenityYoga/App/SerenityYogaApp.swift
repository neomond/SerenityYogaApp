//
//  SerenityYogaApp.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 04.10.24.
//

import SwiftUI

@main
struct SerenityYogaApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
