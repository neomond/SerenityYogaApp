//
//  Meditation.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 30.01.25.
//

import Foundation

struct Meditation: Identifiable, Codable, Equatable {
//    var id = UUID()
//    var id: String { "\(title)-\(image)"}
    var id: String { title }
    let title: String
    let description: String
    let duration: TimeInterval
    let image: String
    let meditations: [Meditate]
    
    static func == (lhs: Meditation, rhs: Meditation) -> Bool {
            return lhs.id == rhs.id
        }
}

struct Meditate: Identifiable, Codable {
//    var id = UUID()
    var id: String { title }
    let title: String
    let duration: TimeInterval
    let imageName: String
    let description: String
    let track: String
}
