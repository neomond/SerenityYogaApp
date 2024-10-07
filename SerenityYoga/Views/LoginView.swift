//
//  LoginView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 04.10.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
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
                    Image(.appLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(.top, 10)
                    VStack(spacing: 12) {
                        Text("Welcome!")
                            .font(.title)
                        
                        Text("Don't have an account yet?")
                            .foregroundColor(.gray)
                        
                        Button(action: {}) {
                            NavigationLink(destination: SignupView()) {
                                Text("Sign Up")
                                    .foregroundColor(.primaryPurple)
                                    .fontWeight(.medium)
                            }
                        }
                    }
                    .padding(.bottom, 25)
                    
                    VStack(spacing: 12) {
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color.tertiaryInput)
                            .cornerRadius(10)
                        
                        ZStack {
                            if showPassword {
                                TextField("Password", text: $password)
                                    .padding(.trailing, 40)
                            } else {
                                SecureField("Password", text: $password)
                                    .textContentType(.password)
                                    .padding(.trailing, 40)
                            }
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundStyle(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding()
                        .background(Color.tertiaryInput)
                        .cornerRadius(10)
                        
                        Text("Forgot Password?")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.footnote)
                    }
                    
                    Spacer().frame(height: 30)
                    
                    VStack(spacing: 16) {
                        Button(action: {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            print("Email: \(email), Password: \(password)")
                        }) {
                            Text("Sign In")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.primaryPurple)
                        .cornerRadius(25)
                        
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
                            }                        }
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

// Custom shape for rounding specific corners
struct RoundedCorner: Shape {
    var radius: CGFloat = 30
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    LoginView()
}



