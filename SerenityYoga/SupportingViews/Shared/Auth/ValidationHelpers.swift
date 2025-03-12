//
//  ValidationHelpers.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 11.03.25.
//

import SwiftUI

struct ValidationHelpers {
    // Email validation
    static func isValidEmail(_ email: String) -> Bool {
        !email.isEmpty && email.contains("@") && email.contains(".")
    }
    
    // Password validation
    static func isValidPassword(_ password: String) -> Bool {
        !password.isEmpty && password.count >= 6
    }
    
    // Password confirmation validation
    static func doPasswordsMatch(_ password: String, _ confirmPassword: String) -> Bool {
        password == confirmPassword
    }
    
    // Complete login form validation
    static func isLoginFormValid(email: String, password: String) -> Bool {
        isValidEmail(email) && !password.isEmpty
    }
    
    // Complete signup form validation
    static func isSignupFormValid(email: String, password: String, confirmPassword: String) -> Bool {
        isValidEmail(email) &&
        isValidPassword(password) &&
        doPasswordsMatch(password, confirmPassword)
    }
}
