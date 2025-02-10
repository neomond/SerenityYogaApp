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
    let image: String
    let meditations: [Meditate]
}

struct Meditate: Identifiable {
    let id = UUID()
    let title: String
    let duration: TimeInterval
    let imageName: String
    let description: String
    let track: String
}
