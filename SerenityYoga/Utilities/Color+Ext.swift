//
//  ColorExtensions.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.10.24.
//

import SwiftUI

struct ColorManager {
    static let primary = Color("VioletteColor")
    static let secondary = Color("TextSecondaryColor")
    static let tertiary = Color("InputColor")
    static let quaternary = Color("PrimaryPink")
    static let peachBg = Color("PeachColor")
    static let mangoBg = Color("MangoColor")
}

// Or you can use an extension
// this will allow you to just type .primaryPurple and you wont have to use ColorManager.primaryPurple

extension Color {
    static let primaryPurple = Color("VioletteColor")
    static let secondaryGray = Color("TextSecondaryColor")
    static let tertiaryInput = Color("InputColor")
    static let mainPink = Color("PrimaryPink")
    static let peachBg = Color("PeachColor")
    static let mangoBg = Color("MangoColor")
}
