//
//  RateUsViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

class RateUsViewModel: ObservableObject {
    @Published var rating: Int = 0
    @Published var feedback: String = ""
    @Published var isSubmitted: Bool = false
    
    func submitFeedback() {
        guard rating > 0 else {
            print("Please provide a rating before submitting.")
            return
        }
        print("Feedback submitted: \(rating) stars, \(feedback)")
        isSubmitted = true
    }
    
    func resetFeedback() {
        rating = 0
        feedback = ""
        isSubmitted = false
    }
}
