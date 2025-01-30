//
//  PracticesViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 28.01.25.
//

import Foundation

final class PracticesViewModel: ObservableObject {
    @Published var practices: [Practice]

    init(practices: [Practice] = [Practice.data]) {
        self.practices = practices
    }

    // MARK: - Mock Data for Previews
    static let mock = PracticesViewModel(practices: [
        Practice(
            title: "Morning Yoga",
            description: "Learn how to bring your best self forward in more moments of your life",
            duration: 1500,
            image: "yogaasana1",
            sessions: [
                Session(title: "Sun Salutation", duration: "10 min", imageName: "yogaasana1", description: "Start your day with energy."),
                Session(title: "Breathing Exercises", duration: "15 min", imageName: "yogaasana2", description: "Focus on your breath."),
                Session(title: "Final Relaxation", duration: "20 min", imageName: "yogaasana3", description: "Cool down and relax.")
            ]
        ),
        Practice(
            title: "Evening Meditation",
            description: "Calm your mind and relax before bed",
            duration: 1200,
            image: "yogaasana2",
            sessions: [
                Session(title: "Mindful Breathing", duration: "12 min", imageName: "yogaasana1", description: "Improve focus and relaxation."),
                Session(title: "Deep Relaxation", duration: "18 min", imageName: "yogaasana2", description: "Release tension before sleep."),
                Session(title: "Sleep Preparation", duration: "25 min", imageName: "yogaasana3", description: "Prepare your mind for deep rest.")
            ]
        ),
        
        Practice(
            title: "Pilates for Beginners",
            description: "Strengthen your core and improve flexibility.",
            duration: 1800,
            image: "yogaasana3",
            sessions: [
                Session(title: "Core Activation", duration: "10 min", imageName: "yogaasana2", description: "Engage your core muscles."),
                Session(title: "Full-Body Flow", duration: "20 min", imageName: "yogaasana1", description: "Work on strength and flexibility."),
                Session(title: "Stretching Routine", duration: "15 min", imageName: "yogaasana3", description: "Relax and improve mobility.")
            ]
        )
    ])
}
