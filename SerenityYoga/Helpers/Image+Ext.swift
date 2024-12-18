//
//  ImageExtensions.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.10.24.
//

import SwiftUI

struct ImageManager {
    static let applogo = Image("AppLogo")
    static let googleicon = Image("GoogleIcon")
    static let onboardingImg = Image("OnboardingImg")
    static let onboardingImg1 = Image("Onboarding")
}

// Or you can use an extension
// this will allow you to just type .primaryPurple and you wont have to use ColorManager.primaryPurple

extension Image {
    static let appLogo = Image("AppLogo")
    static let googleIcon = Image("GoogleIcon")
    static let onboardingImg = Image("OnboardingImg")
    static let onboardingImg1 = Image("Onboarding")
}
