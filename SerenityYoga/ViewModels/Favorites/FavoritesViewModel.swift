//
//  FavoritesViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.02.25.
//

import SwiftUI
import Combine

final class FavoritesViewModel: ObservableObject {
    @Published var likedMeditations: [Meditation] = []
    @Published var likedMeditateTracks: [Meditate] = []

    // MARK: persist data
    private let meditationKey = "likedMeditations"
        private let meditateKey = "likedMeditateTracks"

        init() {
            loadFavorites()
        }
    
    
    func toggleLike(for meditation: Meditation) {
        if let index = likedMeditations.firstIndex(where: { $0.id == meditation.id }) {
            likedMeditations.remove(at: index)
        } else {
            likedMeditations.append(meditation)
        }
        saveFavorites()
        objectWillChange.send()
    }

    func toggleLike(for meditate: Meditate) {
        if let index = likedMeditateTracks.firstIndex(where: { $0.id == meditate.id }) {
            likedMeditateTracks.remove(at: index)
        } else {
            likedMeditateTracks.append(meditate)
        }
        saveFavorites()
        objectWillChange.send()
    }

    func isLiked(_ meditate: Meditate) -> Bool {
        return likedMeditateTracks.contains(where: { $0.id == meditate.id })
    }
    
    func isLiked(_ meditation: Meditation) -> Bool {
        return likedMeditations.contains(where: { $0.id == meditation.id })
    }
    
    // MARK: - Save & Load Favorites
       private func saveFavorites() {
           if let meditationData = try? JSONEncoder().encode(likedMeditations) {
               UserDefaults.standard.set(meditationData, forKey: meditationKey)
           }
           if let meditateData = try? JSONEncoder().encode(likedMeditateTracks) {
               UserDefaults.standard.set(meditateData, forKey: meditateKey)
           }
       }
    
    private func loadFavorites() {
         if let meditationData = UserDefaults.standard.data(forKey: meditationKey),
            let savedMeditations = try? JSONDecoder().decode([Meditation].self, from: meditationData) {
             likedMeditations = savedMeditations
         }
         
         if let meditateData = UserDefaults.standard.data(forKey: meditateKey),
            let savedMeditateTracks = try? JSONDecoder().decode([Meditate].self, from: meditateData) {
             likedMeditateTracks = savedMeditateTracks
         }
     }
}

