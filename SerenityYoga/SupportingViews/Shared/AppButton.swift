//
//  AppButton.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.10.24.
//

import SwiftUI

struct AppButton: View {
    var title: String
    var destination: AnyView? = nil
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            action?()
        }) {
            if let destination = destination {
                NavigationLink(destination: destination) {
                    Text(title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.primaryPurple)
                        .cornerRadius(25)
                }
            } else {
                Text(title)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.primaryPurple)
                    .cornerRadius(25)
            }
        }
    }
}

#Preview {
    AppButton(title: "Test Button", action: { print("Button tapped!") })
}

