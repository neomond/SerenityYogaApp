//
//  Practice.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 29.01.25.
//

import Foundation

struct Practice: Identifiable, Codable  {
//    var id = UUID()
    var id: String { title }
    let title: String
    let description: String
    let duration: TimeInterval
    let image: String
    let sessions: [Session]
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
