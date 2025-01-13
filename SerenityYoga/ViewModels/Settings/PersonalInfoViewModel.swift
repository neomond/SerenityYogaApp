//
//  PersonalInfoViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

class PersonalInfoViewModel: ObservableObject {
    @Published var email: String = "nazrinatayeva@example.com"
    @Published var name: String = "Nazrin"
    @Published var age: String = "24"
    @Published var weight: String = "55kg"
    
    func savePersonalInfo() {
        print("Saved! Email: \(email), Name: \(name), Age: \(age), Weight: \(weight)")
    }
}
