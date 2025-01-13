//
//  SettingsViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var isNotificationsEnabled: Bool = false
    @Published var newPassword: String = ""
    @Published var confirmPassword: String = ""
    @Published var selectedActivity: String = "Very Active (daily exercise)"
    
    let activities = [
        "Very Active (daily exercise)",
        "Active (exercise 3 times a week)",
        "Intermittent (exercise once a week)",
        "Not at all"
    ]
    
    lazy var activityLevelViewModel: ChangeActivityLevelViewModel = {
        ChangeActivityLevelViewModel(selectedActivity: selectedActivity, 
                                     activities: activities)
    }()
    
    func saveActivityLevel() {
        print("Activity level saved: \(selectedActivity)")
    }
    
    func savePassword() {
        if newPassword == confirmPassword && !newPassword.isEmpty {
            print("Password changed successfully!")
        } else {
            print("Passwords do not match or are empty!")
        }
    }
}
