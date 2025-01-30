//
//  Meditation.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 30.01.25.
//

import Foundation

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    let meditations: [Meditate]
    
    static let data = Meditation(
        title: "Best Self",
        description: "Learn how to bring your best self forward in more moments of your life",
        duration: 70,
        track: "image-stones",
        image: "yogaasana2",
        meditations: [
            Meditate(title: "Best Self", duration: 70, imageName: "image-stones", description: "image-stones", track: "image-stones"),
            Meditate(title: "Best Self", duration: 70, imageName: "image-stones", description: "image-stones", track: "image-stones")
            
        ])
}
