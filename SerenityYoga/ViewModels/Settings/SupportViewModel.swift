//
//  SupportViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

class SupportViewModel: ObservableObject {
    @Published var comment: String = ""
    
    func saveComment() {
        guard !comment.isEmpty else {
            print("Comment is empty!")
            return
        }
        print("Saved comment: \(comment)")
    }
}
