//
//  NotificationsViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

class NotificationsViewModel: ObservableObject {
    @Published var isNotificationsEnabled: Bool = false
    
    func toggleNotifications() {
        print("Notifications toggled: \(isNotificationsEnabled)")
    }
}
