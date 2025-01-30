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
    static let blueBg = Color("BluePrimaryColor")
    static let skyblueBg = Color("SkyBlueColor")
    static let cornflowerblueBg = Color("CornFlowerColor")
    static let lavenderBg = Color("LavenderColor")
    static let coralpeachBg = Color("CoralPeachColor")
    static let yellowprimaryBg = Color("YellowBgColor")
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
    static let blueBg = Color("BluePrimaryColor")
    static let skyblueBg = Color("SkyBlueColor")
    static let cornflowerblueBg = Color("CornFlowerColor")
    static let lavenderBg = Color("LavenderColor")
    static let coralpeachBg = Color("CoralPeachColor")
    static let yellowprimaryBg = Color("YellowBgColor")
}
