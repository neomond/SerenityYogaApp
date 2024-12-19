//
//  ForgotPasswordView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 22.10.24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Binding var email: String
    var onNext: () -> Void
    
    var body: some View {
        
        VStack(spacing: SizeMetrics.mediumSpacing) {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(width: SizeMetrics.largeIcon, height: SizeMetrics.largeIcon)
                .padding(.bottom, SizeMetrics.extraLargeSpacing)
            
            Text("Forgot Password")
                .font(SizeMetrics.Fonts.title)
            
            Text("Enter your email so we can send you a password")
                .foregroundColor(.gray)
                .font(SizeMetrics.Fonts.subtitle)
                .padding(.bottom, SizeMetrics.smallPadding)
            
            AuthTextField(placeholder: "Email", text: $email, isSecure: false, showPassword: .constant(false))
                .padding(.vertical)
            
            AppButton(title: "Send a code") {
                print("Email: \(email)")
                onNext()
            }
            Spacer()
        }
    }
}

#Preview {
    @State var previewEmail: String = ""
    return ForgotPasswordView(email: $previewEmail, onNext: {
        print("Next button tapped")
    })
}
