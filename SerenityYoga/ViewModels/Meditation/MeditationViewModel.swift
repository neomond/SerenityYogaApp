//
//  MeditationViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 27.01.25.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    @Published var meditations: [Meditation]
    
    init(meditations: [Meditation] = []) {
        self.meditations = meditations
    }
    
    // MARK: - Mock Data for Previews
    static let mock = MeditationViewModel(meditations: [
        Meditation(
            title: "Best Self",
            description: "Learn how to bring your best self forward in more moments of your life",
            duration: 70,
            track: "yogaasana2",
            image: "yogaasana2",
            meditations: [
                Meditate(
                    title: "Deep Relaxation",
                    duration: 150,
                    imageName: "yogaasana1",
                    description: "Release tension before sleep.",
                    track: "image-stones"),
                Meditate(
                    title: "Best Self",
                    duration: 70,
                    imageName: "image-stones",
                    description: "Learn how to bring your best self forward in more moments of your life",
                    track: "image-stones")
            ]
        ),
        Meditation(
            title: "Best Self",
            description: "Learn how to bring your best self forward in more moments of your life",
            duration: 70,
            track: "yogaasana3",
            image: "yogaasana3",
            meditations: [
                Meditate(
                    title: "Deep Relaxation",
                    duration: 150,
                    imageName: "yogaasana1",
                    description: "Release tension before sleep.",
                    track: "image-stones"),
                Meditate(
                    title: "Best Self",
                    duration: 70,
                    imageName: "image-stones",
                    description: "Learn how to bring your best self forward in more moments of your life",
                    track: "image-stones")
            ]
        )
    ])
}
