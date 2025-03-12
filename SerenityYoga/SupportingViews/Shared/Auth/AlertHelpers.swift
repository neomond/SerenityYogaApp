//
//  AlertHelpers.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 11.03.25.
//

import SwiftUI

struct AlertHelpers {
    static func showFormValidationAlert(
        showAlert: Binding<Bool>,
        alertTitle: Binding<String>,
        alertMessage: Binding<String>,
        isSignUp: Bool = false
    ) {
        alertTitle.wrappedValue = "Invalid Form"
        alertMessage.wrappedValue = isSignUp ?
            "Please check all fields and try again." :
            "Please enter a valid email and password."
        showAlert.wrappedValue = true
    }
    
    static func showAuthErrorAlert(
        showAlert: Binding<Bool>,
        alertTitle: Binding<String>,
        alertMessage: Binding<String>,
        error: Error,
        isSignUp: Bool = false
    ) {
        alertTitle.wrappedValue = isSignUp ? "Sign Up Failed" : "Sign In Failed"
        alertMessage.wrappedValue = error.localizedDescription
        showAlert.wrappedValue = true
    }
}
