//
//  ChangePwdView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.01.25.
//

import SwiftUI

struct ChangePwdView: View {
    @Binding var newPassword: String
    @Binding var confirmPassword: String

    var body: some View {
        VStack {
            CustomNavigationBar(title: "Change Password")
            
            CreatePasswordView(
                title: "Change Password",
                description: "Set a new strong password for your account.",
                buttonText: "Change Password",
                newPassword: $newPassword,
                confirmPassword: $confirmPassword
            ) {
                print("Password changed successfully!")
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
    }
}
