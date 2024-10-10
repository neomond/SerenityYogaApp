//
//  AppButton.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.10.24.
//

import SwiftUI

struct AppButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            action()
        }) {
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.primaryPurple)
                .cornerRadius(25)
        }
    }
}

#Preview {
    AppButton(title: "Test Button", action: { print("Button tapped!")})
}
