//
//  Practice.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 29.01.25.
//

import Foundation

struct Practice: Identifiable, Codable, Equatable  {
//    var id = UUID()
    var id: String { title }
    let title: String
    let description: String
    let duration: TimeInterval
    let image: String
    let sessions: [Session]
    
    static func == (lhs: Practice, rhs: Practice) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Session: Identifiable, Codable {
//    var id = UUID()
    var id: String { title }
    let title: String
    let duration: String
    let imageName: String
    let description: String
    let videoURL: String
}
