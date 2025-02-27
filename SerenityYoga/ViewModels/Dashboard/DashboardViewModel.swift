//
//  DashboardViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 26.02.25.
//

import SwiftUI

enum Mood: String, CaseIterable, Identifiable {
    case happy, relaxed, energized, calm

    var id: String { self.rawValue }
}

struct MoodItem: Identifiable {
    let id = UUID()
    let mood: String
}


class DashboardViewModel: ObservableObject {
    @Published var selectedMood: MoodItem?
    @Published var showMoodDetail: Bool = false
    @Published var showProfileView: Bool = false
    @Published var showFavoritesView: Bool = false
    @Published var favoritesViewModel = FavoritesViewModel()
    @Published var sectionViewModel = HorizontalSectionViewModel()
    
    @Published var showCategoryDetail: Bool = false
    @Published var selectedCategory: HorizontalSectionViewModel.SectionData?

    func selectMood(_ mood: String) {
        selectedMood = MoodItem(mood: mood)
        showMoodDetail = true
    }

    func fetchSections() -> [HorizontalSectionViewModel.SectionData] {
        return sectionViewModel.sections
    }

    func selectCategory(_ category: HorizontalSectionViewModel.SectionData) {
        selectedCategory = category
        showCategoryDetail = true  
    }
}

