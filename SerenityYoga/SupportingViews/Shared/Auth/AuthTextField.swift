//
//  AuthTextField.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.10.24.
//

import SwiftUI


struct AuthTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool
    @Binding var showPassword: Bool
    
    var body: some View {
        ZStack {
            if isSecure && !showPassword {
                SecureField(placeholder, text: $text)
                    .textContentType(.password)
                    .padding(.trailing, 40)
            } else {
                TextField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .padding(.trailing, 40)
            }
            
            if isSecure {
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding()
        .background(Color.tertiaryInput)
        .cornerRadius(10)
    }
}


#Preview {
    @State var text = ""
    @State var showPassword = false
    return AuthTextField(placeholder: "Enter your password",
                  text: $text, isSecure: true,
                  showPassword: $showPassword)
}
