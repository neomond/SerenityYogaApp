//
//  AppButton.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.10.24.
//

import SwiftUI

enum ButtonStyleType {
    case primary
    case secondary
}

struct AppButton: View {
    var title: String
    var style: ButtonStyleType = .primary
    var destination: AnyView? = nil
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            action?()
        }) {
            if let destination = destination {
                NavigationLink(destination: destination) {
                    buttonContent
                }
            } else {
                buttonContent
            }
        }
    }
    
    // Button content with different styles
    @ViewBuilder
    private var buttonContent: some View {
        Text(title)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(style == .primary ? .white : .black) // Different text colors
            .background(style == .primary ? Color.primaryPurple : Color.clear) // Background
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(style == .secondary ? Color.gray : Color.clear, lineWidth: 2) // Border for secondary
            )
            .cornerRadius(25)
    }
}

#Preview {
    VStack(spacing: 20) {
        AppButton(title: "Primary Button", style: .primary, action: { print("Primary Button tapped") })
        AppButton(title: "Secondary Button", style: .secondary, action: { print("Secondary Button tapped") })
    }
    .padding()
}


