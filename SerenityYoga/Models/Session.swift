//
//  Session.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 29.01.25.
//

import Foundation

struct Session: Identifiable {
    let id = UUID()
    let title: String
    let duration: String
    let imageName: String
    let description: String
}

struct Meditate: Identifiable {
    let id = UUID()
    let title: String
    let duration: TimeInterval
    let imageName: String
    let description: String
    let track: String
}
