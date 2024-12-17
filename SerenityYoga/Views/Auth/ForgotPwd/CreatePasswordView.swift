//
//  CreatePasswordView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 17.12.24.
//

import SwiftUI

struct CreatePasswordView: View {
    @Binding var newPassword: String
    @Binding var confirmPassword: String
    var onFinish: () -> Void
    
    
    var body: some View {
        VStack(spacing: 12) {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.bottom, 80)
            
            Text("Create Password").font(.title)
            Text("Create a new strong password")
                .foregroundColor(.gray).font(.callout)
                .padding(.bottom, 10)
            
            AuthTextField(
                placeholder: "Password",
                text: $newPassword,
                isSecure: true, // Set secure input to true
                showPassword: .constant(false) // Hide password toggle
            )
            .padding(.vertical)
            
            AuthTextField(
                placeholder: "Confirm Password",
                text: $confirmPassword,
                isSecure: true, // Set secure input to true
                showPassword: .constant(false) // Hide password toggle
            )
            
            
            AppButton(title: "Continue") {
                if newPassword == confirmPassword && !newPassword.isEmpty {
                    print("Passwords match, proceeding...")
                    onFinish()
                } else {
                    print("Passwords do not match!")
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
    }
}

#Preview {
    @State var previewNewPassword: String = ""
    @State var previewConfirmPassword: String = ""
    
    return CreatePasswordView(
        newPassword: $previewNewPassword,
        confirmPassword: $previewConfirmPassword,
        onFinish: { print("Reset Password button tapped") }
    )
}
