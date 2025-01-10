//
//  FAQs.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.01.25.
//

import SwiftUI

struct FAQs: View {
    @State private var expandedQuestion: Int? = nil
    
    // Sample FAQ data
    let faqData: [(question: String, answer: String)] = [
        ("What is Serenity Yoga?", "Serenity Yoga is an app designed to help you practice yoga, track your progress, and achieve your fitness goals."),
        ("How do I reset my password?", "To reset your password, go to Settings > Change Password, and follow the instructions."),
        ("How do I contact support?", "You can contact support by navigating to the Support section in Settings and leaving us a message."),
        ("Is Serenity Yoga free?", "The app offers both free and premium subscription plans. Premium users get access to additional features and personalized workouts."),
        ("Can I cancel my subscription?", "Yes, you can cancel your subscription at any time from your account settings in the App Store or Google Play Store.")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                CustomNavigationBar(title: "FAQs 💬")
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(faqData.indices, id: \.self) { index in
                            DisclosureGroup(
                                isExpanded: Binding(
                                    get: { expandedQuestion == index },
                                    set: { expandedQuestion = $0 ? index : nil }
                                )
                            ) {
                                Text(faqData[index].answer)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 4)
                            } label: {
                                Text(faqData[index].question)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            .accentColor(.primaryPurple)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .animation(.easeInOut, value: expandedQuestion)
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
