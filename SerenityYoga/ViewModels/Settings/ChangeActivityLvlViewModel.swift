//
//  ChangeActivityLvlViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

class ChangeActivityLevelViewModel: ObservableObject {
    @Published var selectedActivity: String
    let activities: [String]
    
    init(selectedActivity: String, activities: [String]) {
        self.selectedActivity = selectedActivity
        self.activities = activities
    }
    
    func saveActivityLevel() {
        print("Activity level saved: \(selectedActivity)")
    }
}

