//
//  Practice.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 29.01.25.
//

import Foundation

struct Practice {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let image: String
    let sessions: [Session]

    // MARK: - Mock single practice data
    static let data = Practice(
        title: "Morning Yoga",
        description: "Learn how to bring your best self forward in more moments of your life",
        duration: 1500,
        image: "yogaasana1",
        sessions: [
            Session(title: "Sun Salutation", duration: "10 min", imageName: "yogaasana1", description: "Start your day with energy."),
            Session(title: "Breathing Exercises", duration: "15 min", imageName: "yogaasana2", description: "Focus on your breath."),
            Session(title: "Final Relaxation", duration: "20 min", imageName: "yogaasana3", description: "Cool down and relax.")
        ]
    )
}

struct Session: Identifiable {
    let id = UUID()
    let title: String
    let duration: String
    let imageName: String
    let description: String
}
