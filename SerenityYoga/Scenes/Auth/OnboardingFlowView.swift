//
//  OnboardingFlowView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 18.12.24.
//

import SwiftUI

struct OnboardingFlowView: View {
    
    enum Step {
        case nameInput, activityLevel, personalDetails, waitingScreen
    }
    
    @State private var currentStep: Step = .nameInput
    
    @State private var name: String = ""
    @State private var selectedActivity: String = "Very Active"
    @State private var age: Int = 24
    @State private var weight: String = ""
    @State private var height: String = ""
    
    let activities = ["Very Active (daily exercise)",
                      "Active (exercise 3 times a week)",
                      "Intermittent (exercise once a week)",
                      "Not at all"]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                if currentStep != .waitingScreen {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .blueBg,
                            .skyblueBg,
                            .cornflowerblueBg]),
                        startPoint: .topLeading,
                        endPoint: .topTrailing
                    )
                    .ignoresSafeArea(.all)
                }
                
                // MARK: - Content
                if currentStep == .waitingScreen {
                    WaitingScreenView()
                } else {
                    VStack {
                        switch currentStep {
                        case .nameInput:
                            NameInputView(name: $name, onNext: {
                                currentStep = .activityLevel
                            })
                        case .activityLevel:
                            ActivityLevelView(
                                selectedActivity: $selectedActivity,
                                activities: activities,
                                onNext: {
                                    currentStep = .personalDetails
                                },
                                onBack: {
                                    currentStep = .nameInput
                                })
                        case .personalDetails:
                            PersonalDetailsView(
                                age: $age,
                                weight: $weight,
                                height: $height,
                                onNext: {
                                    currentStep = .waitingScreen
                                },
                                onBack: {
                                    currentStep = .activityLevel
                                })
                        default: EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                    .background(Color.white) 
                    .cornerRadius(40, corners: [.topLeft, .topRight])
                    .animation(.easeInOut, value: currentStep)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnboardingFlowView()
}

