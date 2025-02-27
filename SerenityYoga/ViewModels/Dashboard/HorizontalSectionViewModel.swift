//
//  HorizontalSectionViewModel.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 26.02.25.
//

import SwiftUI

class HorizontalSectionViewModel: ObservableObject {
    struct SectionData: Identifiable, Hashable {
        let id = UUID()
        let title: String
        var items: [ContentCardModel]
        
        static func == (lhs: SectionData, rhs: SectionData) -> Bool {
            return lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }

    @Published var sections: [SectionData] = [
        SectionData(
            title: "Try this",
            items: [
                ContentCardModel(title: "Yoga Basic", duration: .string("25:00"), imageName: "yogaImage"),
                ContentCardModel(title: "Unwind", duration: .string("15:00"), imageName: "yogaasana1"),
                ContentCardModel(title: "Unwind", duration: .string("20:00"), imageName: "yogaasana2")
            ]
        ),
        SectionData(
            title: "Meditate",
            items: [
                ContentCardModel(title: "Morning Meditation", duration: .string("10:00"), imageName: "yogaasana2"),
                ContentCardModel(title: "Guided Relaxation", duration: .string("19:00"), imageName: "yogaasana3"),
                ContentCardModel(title: "Unwind", duration: .string("12:00"), imageName: "yogaasana1")
            ]
        )
    ]
}
