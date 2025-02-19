//
//  MeditationViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 27.01.25.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    @Published var meditations: [Meditation]
    @Published var selectedMeditation: Meditation
    @Published var selectedMeditationItem: Meditate?
    
    init(meditations: [Meditation] = Meditation.mockData) {
        self.meditations = meditations
        self.selectedMeditation = meditations.first ?? Meditation.mockData.first!
    }
    
    static let mock = MeditationViewModel(meditations: Meditation.mockData)
}

    // MARK: - Mock Data for Previews
extension Meditation {
    static let mockData = [
        Meditation(
            title: "Inner Balance",
            description: "Discover how to stay centered and composed throughout your daily life.",
            duration: 70,
            image: "yogaasana1",
            meditations: [
                Meditate(
                    title: "Serene Breathing",
                    duration: 150,
                    imageName: "yogaasana1",
                    description: "Calm your mind and body with deep breathing exercises.",
                    track: "meditation1"),
                Meditate(
                    title: "Mindful Awareness",
                    duration: 70,
                    imageName: "yogaImage",
                    description: "Enhance your presence and clarity through mindfulness.",
                    track: "meditation1")
            ]
        ),
        Meditation(
            title: "Tranquility Flow",
            description: "Unwind and rejuvenate with guided relaxation sessions.",
            duration: 70,
            image: "yogaasana3",
            meditations: [
                Meditate(
                    title: "Evening Calm",
                    duration: 150,
                    imageName: "yogaasana2",
                    description: "Let go of the day's stress and ease into relaxation.",
                    track: "meditation1"),
                Meditate(
                    title: "Empowered Self",
                    duration: 70,
                    imageName: "image-stones",
                    description: "Cultivate confidence and inner strength through guided reflection.",
                    track: "meditation1")
            ]
        )
    ]
}
