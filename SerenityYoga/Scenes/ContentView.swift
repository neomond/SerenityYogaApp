//
//  ContentView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 04.10.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignupView()
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager())
        .environmentObject(AudioManager())
    
}
