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
    
    @Published var likedPracticesVideos: [Session] = [] {
        didSet { saveFavorites() }
    }
    
    private let meditationKey   = "likedMeditations"
    private let meditateKey     = "likedMeditateTracks"
    private let practiceKey     = "likedPractices"
    private let sessionKey     = "likedSessions"
    
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
        print("Toggle like for: \(practice.title)")
        if let index = likedPractices.firstIndex(where: { $0.id == practice.id }) {
            print("Removing from favorites: \(practice.title)")
            likedPractices.remove(at: index)
        } else {
            print("Adding to favorites: \(practice.title)")
            likedPractices.append(practice)
        }
        saveFavorites()
    }

    func toggleLike(for session: Session) {
        if let index = likedPracticesVideos.firstIndex(where: { $0.id == session.id }) {
            likedPracticesVideos.remove(at: index)
        } else {
            likedPracticesVideos.append(session)
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
    
    func isLiked(_ session: Session) -> Bool {
        return likedPracticesVideos.contains(where: { $0.id == session.id })
    }
    
    private func saveFavorites() {
        do {
            let meditationData = try JSONEncoder().encode(likedMeditations)
            let meditateData = try JSONEncoder().encode(likedMeditateTracks)
            let practiceData = try JSONEncoder().encode(likedPractices)
            let sessionData = try JSONEncoder().encode(likedPracticesVideos)
            UserDefaults.standard.set(meditationData, forKey: meditationKey)
            UserDefaults.standard.set(meditateData, forKey: meditateKey)
            UserDefaults.standard.set(practiceData, forKey: practiceKey)
            UserDefaults.standard.set(sessionData, forKey: sessionKey)
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
        
        if let practiceData = UserDefaults.standard.data(forKey: practiceKey) {
                do {
                    let savedPractices = try JSONDecoder().decode([Practice].self, from: practiceData)
                    likedPractices = savedPractices
                    print("✅ Loaded \(likedPractices.count) favorite practices from UserDefaults")
                } catch {
                    print("❌ Error decoding practices: \(error)")
                }
            } else {
                print("⚠️ No saved favorite practices found in UserDefaults")
            }
        
        if let sessionData = UserDefaults.standard.data(forKey: sessionKey),
           let savedSessions = try? JSONDecoder().decode([Session].self, from: sessionData) {
            likedPracticesVideos = savedSessions
        }
        print("Favorites loaded: \(likedPractices.count) practices")
    }
}



