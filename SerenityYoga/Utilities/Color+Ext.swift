//
//  ColorExtensions.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.10.24.
//

import SwiftUI

struct ColorManager {
    static let primary = Color("PrimaryColor")
    static let secondary = Color("TextSecondaryColor")
    static let tertiary = Color("InputColor")
    static let quaternary = Color("PrimaryPink")
}

// Or you can use an extension
// this will allow you to just type .primaryPurple and you wont have to use ColorManager.primaryPurple

extension Color {
    static let primaryPurple = Color("PrimaryColor")
    static let secondaryGray = Color("TextSecondaryColor")
    static let tertiaryInput = Color("InputColor")
    static let mainPink = Color("PrimaryPink")
}
