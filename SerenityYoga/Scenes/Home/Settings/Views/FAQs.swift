//
//  FAQs.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.01.25.
//

import SwiftUI

struct FAQs: View {
    
    @StateObject var viewModel = FAQsViewModel(faqData: [
        ("What is Serenity Yoga?", "Serenity Yoga is an app designed to help you practice yoga, track your progress, and achieve your fitness goals."),
        ("How do I reset my password?", "To reset your password, go to Settings > Change Password, and follow the instructions."),
        ("How do I contact support?", "You can contact support by navigating to the Support section in Settings and leaving us a message."),
        ("Is Serenity Yoga free?", "The app offers both free and premium subscription plans. Premium users get access to additional features and personalized workouts."),
        ("Can I cancel my subscription?", "Yes, you can cancel your subscription at any time from your account settings in the App Store or Google Play Store.")
    ])
    
    var body: some View {
        NavigationStack {
            VStack(spacing: SizeMetrics.largeSpacing) {
                CustomNavigationBar(title: "FAQs 💬")
                
                ScrollView {
                    VStack(spacing: SizeMetrics.mediumPadding) {
                        ForEach(viewModel.faqData.indices, id: \.self) { index in
                            DisclosureGroup(
                                isExpanded: Binding(
                                    get: { viewModel.expandedQuestion == index },
                                    set: { viewModel.expandedQuestion = $0 ? index : nil }
                                )
                            ) {
                                Text(viewModel.faqData[index].answer)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, SizeMetrics.xsSmallPadding)
                            } label: {
                                Text(viewModel.faqData[index].question)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            .accentColor(.primaryPurple)
                            .padding()
                            .background(Color.gray.opacity(SizeMetrics.xsopacityThin))
                            .cornerRadius(SizeMetrics.smallRadius)
                            .animation(.easeInOut, value: viewModel.expandedQuestion)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    FAQs()
}
