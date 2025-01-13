//
//  FAQsViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

// MARK: - expandedQuestion: Keeps track of the currently expanded question.
//       - faqData: Stores the list of questions and answers.

class FAQsViewModel: ObservableObject {
    @Published var expandedQuestion: Int? = nil
    let faqData: [(question: String, answer: String)]
    
    init(faqData: [(question: String, answer: String)]) {
        self.faqData = faqData
    }
}
