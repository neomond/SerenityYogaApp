//
//  ContentCardModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 30.01.25.
//

import Foundation

struct ContentCardModel: Identifiable {
    let id = UUID()
    let title: String
    let duration: DurationType
    let imageName: String
    
    enum DurationType {
        case string(String)         // MARK: - When duration is already a string
        case time(TimeInterval)     // MARK: - When duration is in seconds
        
        var formatted: String {
            switch self {
            case .string(let value):
                return value
            case .time(let seconds):
                let minutes = Int(seconds) / 60
                let remainingSeconds = Int(seconds) % 60
                return String(format: "%02d:%02d", minutes, remainingSeconds) /// "05:30"
            }
        }
    }
}
