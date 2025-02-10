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
            title: "Best Self",
            description: "Learn how to bring your best self forward in more moments of your life",
            duration: 70,
            image: "yogaasana1",
            meditations: [
                Meditate(
                    title: "Deep Relaxation",
                    duration: 150,
                    imageName: "yogaasana1",
                    description: "Release tension before sleep.",
                    track: "meditation1"),
                Meditate(
                    title: "Best Self",
                    duration: 70,
                    imageName: "yogaImage",
                    description: "Learn how to bring your best self forward in more moments of your life",
                    track: "meditation1")
            ]
        ),
        Meditation(
            title: "Best Self",
            description: "Learn how to bring your best self forward in more moments of your life",
            duration: 70,
            image: "yogaasana3",
            meditations: [
                Meditate(
                    title: "Deep Relaxation",
                    duration: 150,
                    imageName: "yogaasana2",
                    description: "Release tension before sleep.",
                    track: "meditation1"),
                Meditate(
                    title: "Best Self",
                    duration: 70,
                    imageName: "image-stones",
                    description: "Learn how to bring your best self forward in more moments of your life",
                    track: "meditation1")
            ]
        )
    ]
}
