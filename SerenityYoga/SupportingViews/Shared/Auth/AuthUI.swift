//
//  AuthUI.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 11.03.25.
//

import SwiftUI

struct AuthUI {
    static func socialSignInButton(icon: Image, text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 0) {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(text)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundStyle(Color.secondaryGray)
            }
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
    
    static func loadingOverlay(isLoading: Bool) -> some View {
        Group {
            if isLoading {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
    }
    
    static func orSeparator() -> some View {
        HStack {
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Text("Or With")
                .font(.footnote)
                .foregroundStyle(.gray)
            
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
    }
}
