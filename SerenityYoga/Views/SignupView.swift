//
//  SignupView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.10.24.
//

import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .center) {
                
                LinearGradient(
                    gradient: Gradient(colors: [.primaryPurple, .mainPink]),
                    startPoint: .topLeading,
                    endPoint: .topTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    AuthHeaderView(
                        title: "Welcome!",
                        subtitle: "Already have an account?",
                        actionText: "Sign In",
                        actionDestination: AnyView(LoginView())
                    )
                    
                    VStack(spacing: 12) {
                       AuthTextField(placeholder: "Email", text: $email, isSecure: false, showPassword: .constant(false))
                        AuthTextField(placeholder: "Password", text: $password, isSecure: true, showPassword: $showPassword)
                        AuthTextField(placeholder: "Confirm Password", text: $confirmPassword, isSecure: true, showPassword: $showPassword)
                                              
                       
                        HStack {
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "checkmark.square.fill")
                                        .foregroundColor(.white)
                                        .background(Color.primaryPurple)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                        .frame(width: 24, height: 24)
                                    
                                    Text("I agree with Privacy&Policy")
                                        .foregroundColor(.black)
                                        .font(.footnote)
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer().frame(height: 30)
                    
                    VStack(spacing: 16) {
                        
                        AppButton(title: "Sign Up") {
                            print("Email: \(email), Password: \(password)")
                        }
                                        
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
                        Button(action: {
                        }) {
                            HStack(spacing: 0) {
                                Image(.googleIcon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                    
                                    Text("Login with Google")
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
                    Spacer()
                }
                
                .padding(.horizontal)
                .padding(.top, 45)
                .background(Color.white)
                .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    SignupView()
}
