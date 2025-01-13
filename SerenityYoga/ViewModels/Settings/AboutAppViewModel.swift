//
//  AboutAppViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 13.01.25.
//

import SwiftUI

class AboutAppViewModel: ObservableObject {
    @Published var appVersion: String = "1.0.0"
    @Published var features: [(icon: String, title: String)] = [
        (icon: "figure.yoga", title:"Personalized Yoga Plans"),
        (icon: "heart.text.square", title:"Track Your Progress"),
        (icon: "music.note", title:"Relaxing Music and Sounds"),
        (icon: "star", title:"Premium Content for Subscribers")
    ]
    
    func fetchAppData() {
        /// Logic to fetch app data dynamically (e.g., from a server)
    }
}

