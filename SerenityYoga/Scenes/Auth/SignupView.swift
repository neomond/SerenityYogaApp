//
//  SignupView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.10.24.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authManager: AuthManager
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isLoading = false
    
    
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
                            signUp()
                            print("Email: \(email), Password: \(password)")
                            
                        }
                        .disabled(!isFormValid)
                        .opacity(isFormValid ? 1.0 : 0.6)
                        
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
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.bottom)
            }
            
            .overlay(
                Group {
                    if isLoading {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                    }
                }
            )
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    private var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty &&
        password == confirmPassword &&
        password.count >= 6 &&
        email.contains("@") &&
        email.contains(".")
    }
    
    
    private func signUp() {
        guard isFormValid else {
            alertTitle = "Invalid Form"
            alertMessage = "Please check all fields and try again."
            showAlert = true
            return
        }
        
        isLoading = true
        
        authManager.signUp(email: email, password: password) { success, error in
            isLoading = false
            
            if success {
                // Navigation will happen automatically if you set up ContentView correctly
                print("Successfully signed up!")
            } else if let error = error {
                alertTitle = "Sign Up Failed"
                alertMessage = error.localizedDescription
                showAlert = true
            }
        }
    }
}


#Preview {
    SignupView()
}
