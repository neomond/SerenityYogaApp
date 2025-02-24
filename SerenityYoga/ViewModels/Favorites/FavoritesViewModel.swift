//
//  FavoritesViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.02.25.
//

import SwiftUI
import Combine

final class FavoritesViewModel: ObservableObject {
    @Published var likedMeditations: [Meditation] = [] {
        didSet { saveFavorites() }
    }
    @Published var likedMeditateTracks: [Meditate] = [] {
        didSet { saveFavorites() }
    }
    
    @Published var likedPractices: [Practice] = [] {
        didSet { saveFavorites() }
    }
    
    private let meditationKey   = "likedMeditations"
    private let meditateKey     = "likedMeditateTracks"
    private let practiceKey     = "likedPractices"
    
    init() {
        loadFavorites()
    }
    
    func toggleLike(for meditation: Meditation) {
        if let index = likedMeditations.firstIndex(where: { $0.id == meditation.id }) {
            likedMeditations.remove(at: index)
        } else {
            likedMeditations.append(meditation)
        }
    }
    
    func toggleLike(for meditate: Meditate) {
        if let index = likedMeditateTracks.firstIndex(where: { $0.id == meditate.id }) {
            likedMeditateTracks.remove(at: index)
        } else {
            likedMeditateTracks.append(meditate)
        }
    }
    
    func toggleLike(for practice: Practice) {
        if let index = likedPractices.firstIndex(where: { $0.id == practice.id }) {
            likedPractices.remove(at: index)
        } else {
            likedPractices.append(practice)
        }
    }
    
    func isLiked(_ meditate: Meditate) -> Bool {
        return likedMeditateTracks.contains(where: { $0.id == meditate.id })
    }
    
    func isLiked(_ meditation: Meditation) -> Bool {
        return likedMeditations.contains(where: { $0.id == meditation.id })
    }
    
    func isLiked(_ practice: Practice) -> Bool {
        return likedPractices.contains(where: { $0.id == practice.id })
    }
    
    private func saveFavorites() {
        do {
            let meditationData = try JSONEncoder().encode(likedMeditations)
            let meditateData = try JSONEncoder().encode(likedMeditateTracks)
            let practiceData = try JSONEncoder().encode(likedPractices)
            UserDefaults.standard.set(meditationData, forKey: meditationKey)
            UserDefaults.standard.set(meditateData, forKey: meditateKey)
            UserDefaults.standard.set(practiceData, forKey: practiceKey)
        } catch {
            print("Error saving favorites:", error)
        }
    }
    
    func loadFavorites() {
        if let meditationData = UserDefaults.standard.data(forKey: meditationKey),
           let savedMeditations = try? JSONDecoder().decode([Meditation].self, from: meditationData) {
            likedMeditations = savedMeditations
        }
        
        if let meditateData = UserDefaults.standard.data(forKey: meditateKey),
           let savedMeditateTracks = try? JSONDecoder().decode([Meditate].self, from: meditateData) {
            likedMeditateTracks = savedMeditateTracks
        }
        
        if let practiceData = UserDefaults.standard.data(forKey: practiceKey),
           let savedPractices = try? JSONDecoder().decode([Practice].self, from: practiceData) {
            likedPractices = savedPractices
        }
    }
}



