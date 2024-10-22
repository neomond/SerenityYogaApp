//
//  ForgotPasswordView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 22.10.24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                LinearGradient(
                    gradient: Gradient(colors: [.peachBg, .mangoBg]),
                    startPoint: .topLeading,
                    endPoint: .topTrailing
                )
                .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(spacing: 12) {
                        Image(.appLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding(.bottom, 80)
                        
                        Text("Forgot Password")
                            .font(.title)
                        
                        Text("Enter your email so we can send you a password")
                            .foregroundColor(.gray)
                            .font(.callout)
                            .padding(.bottom, 10)
                        
                        AuthTextField(placeholder: "Email", text: $email, isSecure: false, showPassword: .constant(false))
                            .padding(.vertical)
                        
                        AppButton(title: "Send a code", destination: AnyView(CheckEmailView())) {
                            print("Email: \(email)")
                        }
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.top, 45)
                .background(Color.white)
                .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
