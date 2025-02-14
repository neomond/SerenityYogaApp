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
    
    func toggleLike(for meditation: Meditation) {
        if let index = likedMeditations.firstIndex(where: { $0.id == meditation.id }) {
            likedMeditations.remove(at: index)
        } else {
            likedMeditations.append(meditation) 
        }
    }
    
    func isLiked(_ meditation: Meditation) -> Bool {
        likedMeditations.contains(where: { $0.id == meditation.id })
    }
}
