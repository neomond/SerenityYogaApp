//
//  MoodViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 27.02.25.
//

import SwiftUI

class MoodViewModel: ObservableObject {
    @Published var moodSessions: [ContentCardModel] = []
    
    func getMoodIcon(for mood: String) -> String {
        switch mood.lowercased() {
        case "stress": return "🤯"
        case "anxiety": return "🥵"
        case "depression": return "😖"
        case "shock": return "😱"
        case "calm": return "🧘‍♂️"
        default: return "🙂"
        }
    }
    
    func fetchSessions(for mood: String) {
        switch mood.lowercased() {
        case "stress":
            moodSessions = [
                ContentCardModel(title: "Deep Breathing", duration: .string("10 min"), imageName: "yogaasana1"),
                ContentCardModel(title: "Mindfulness Meditation", duration: .string("15 min"), imageName: "yogaasana2"),
                ContentCardModel(title: "Guided Relaxation", duration: .string("20 min"), imageName: "yogaasana3")
            ]
        case "anxiety":
            moodSessions = [
                ContentCardModel(title: "Gratitude Meditation", duration: .string("12 min"), imageName: "yogaasana1"),
                ContentCardModel(title: "Positive Affirmations", duration: .string("8 min"), imageName: "yogaasana2")
            ]
        case "depression":
            moodSessions = [
                ContentCardModel(title: "Evening Wind-Down", duration: .string("15 min"), imageName: "yogaasana3"),
                ContentCardModel(title: "Calm Breathing", duration: .string("10 min"), imageName: "yogaasana1")
            ]
        case "shock":
            moodSessions = [
                ContentCardModel(title: "Gratitude Meditation", duration: .string("12 min"), imageName: "yogaasana1")
            ]
        default:
            moodSessions = [
                ContentCardModel(title: "General Meditation", duration: .string("10 min"), imageName: "yogaasana2")
            ]
        }
    }
}

