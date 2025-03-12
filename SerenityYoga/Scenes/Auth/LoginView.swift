//
//  LoginView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 04.10.24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    
    @State private var email = ""
    @State private var password = ""
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
                        subtitle: "Do not have an account?",
                        actionText: "Sign Up",
                        actionDestination: AnyView(SignupView())
                    )
                    
                    VStack(spacing: 12) {
                        AuthTextField(placeholder: "Email", text: $email, isSecure: false, showPassword: .constant(false))
                        
                        AuthTextField(placeholder: "Password", text: $password, isSecure: true, showPassword: $showPassword)
                        
                        NavigationLink(destination: ForgotPasswordFlowView()) {
                            Text("Forgot Password?")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.footnote)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer().frame(height: 30)
                    
                    VStack(spacing: 16) {
                        
                        AppButton(title: "Sign In") {
                            signIn()
                            print("Email: \(email), Password: \(password)")
                        }
                        .disabled(!isFormValid)
                        .opacity(isFormValid ? 1.0 : 0.6)
                        
                        AuthUI.orSeparator()
                        
                        // Social sign-in
                        AuthUI.socialSignInButton(
                            icon: Image(.googleIcon),
                            text: "Login with Google") {
                                
                            }
                    }
                    Spacer()
                }
                
                .padding(.horizontal)
                .padding(.top, 45)
                .background(Color.white)
                .cornerRadius(40, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.bottom)
            }
            .overlay(AuthUI.loadingOverlay(isLoading: isLoading))
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
        ValidationHelpers.isLoginFormValid(email: email, password: password)
    }
    
    private func signIn() {
        guard isFormValid else {
            AlertHelpers.showFormValidationAlert(
                showAlert: $showAlert,
                alertTitle: $alertTitle,
                alertMessage: $alertMessage
            )
            return
        }
        
        isLoading = true
        print("Attempting to sign in with email: \(email)")
        
        authManager.signIn(email: email, password: password) { success, error in
            isLoading = false
            
            if success {
                print("Successfully signed in!")
            } else if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                AlertHelpers.showAuthErrorAlert(
                    showAlert: $showAlert,
                    alertTitle: $alertTitle,
                    alertMessage: $alertMessage,
                    error: error
                )
            }
        }
    }
    
}

#Preview {
    LoginView()
        .environmentObject(AuthManager())
}
