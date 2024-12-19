//
//  ForgotPasswordFlowView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 17.12.24.
//

import SwiftUI

struct ForgotPasswordFlowView: View {
    
    enum Step {
        case forgotPassword, checkEmail, enterCode, createPassword
    }
    
    @State private var currentStep: Step = .forgotPassword
    @State private var email = ""
    @State private var code = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    @State private var codeError = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                LinearGradient ( gradient: Gradient(colors: [.peachBg, .mangoBg]),
                                 startPoint: .topLeading,
                                 endPoint: .topTrailing
                )
                .ignoresSafeArea(.all)
                
                VStack {
                    switch currentStep {
                    case .forgotPassword:
                        ForgotPasswordView(email: $email, onNext: {
                            currentStep = .checkEmail
                        })
                        
                    case .checkEmail:
                        CheckEmailView(onNext: {
                            currentStep = .enterCode
                        })
                    case .enterCode:
                        EnterCodeView(code: $code, codeError: $codeError, onNext: {
                            if code == "1234" {
                                codeError = false
                                currentStep = .createPassword
                            } else {
                                codeError = true
                            }
                        })
                    case .createPassword:
                        CreatePasswordView(newPassword: $newPassword, confirmPassword: $confirmPassword, onFinish: {
                            print("Password reset successfully!")
                        })                }
                }
                
                .frame(maxWidth: .infinity)
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
    ForgotPasswordFlowView()
}
