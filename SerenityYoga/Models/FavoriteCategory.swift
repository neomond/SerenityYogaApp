//
//  FavoriteCategory.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 30.01.25.
//

import Foundation

struct FavoriteCategory: Identifiable {
    let id = UUID()
    let title: String
    let items: [ContentCardModel]
}

let favoriteCategories: [FavoriteCategory] = [
    FavoriteCategory(title: "Yoga", items: [
        ContentCardModel(title: "Yoga Basic", duration: .string("25:00"), imageName: "yogaImage"),
        ContentCardModel(title: "Unwind", duration: .string("15:00"), imageName: "yogaasana1")
    ]),
    FavoriteCategory(title: "Meditations", items: [
        ContentCardModel(title: "Morning Meditation", duration: .string("10:00"), imageName: "yogaasana2"),
        ContentCardModel(title: "Guided Relaxation", duration: .string("19:00"), imageName: "yogaasana3")
    ]),
    FavoriteCategory(title: "Articles", items: [
        ContentCardModel(title: "Mindfulness 101", duration: .string("5 min"), imageName: "yogaasana1"),
        ContentCardModel(title: "Deep Breathing", duration: .string("7 min"), imageName: "yogaasana2"),
        ContentCardModel(title: "Sleep Better", duration: .string("10 min"), imageName: "yogaasana3"),
        ContentCardModel(title: "Relaxation Tips", duration: .string("15 min"), imageName: "yogaImage")
    ])
]
