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
                        
                        AuthUI.orSeparator()
                        
                        // Social sign-in
                        AuthUI.socialSignInButton(
                            icon: Image(.googleIcon),
                            text: "Login with Google") {
                            //MARK: - Google sign-in would be implemented here
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
        ValidationHelpers.isSignupFormValid(
            email: email,
            password: password,
            confirmPassword: confirmPassword
        )
    }
    
    private func signUp() {
        guard isFormValid else {
            AlertHelpers.showFormValidationAlert(
                showAlert: $showAlert,
                alertTitle: $alertTitle,
                alertMessage: $alertMessage,
                isSignUp: true
            )
            return
        }
        
        isLoading = true
        
        authManager.signUp(email: email, password: password) { success, error in
            isLoading = false
            
            if success {
                print("Successfully signed up!")
            } else if let error = error {
                AlertHelpers.showAuthErrorAlert(
                    showAlert: $showAlert,
                    alertTitle: $alertTitle,
                    alertMessage: $alertMessage,
                    error: error,
                    isSignUp: true
                )
            }
        }
    }
}


#Preview {
    SignupView()
        .environmentObject(AuthManager())
}
