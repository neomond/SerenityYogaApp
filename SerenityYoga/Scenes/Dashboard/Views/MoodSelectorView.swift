//
//  MoodSelectorView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct MoodSelectorView: View {
    @State private var selectedMood: String? = nil
    let onMoodSelected: (String) -> Void
    
    let moods = [
        ("🤯", "Stress"),
        ("🥵", "Anxiety"),
        ("😖", "Depression"),
        ("😱", "Shock"),
    ]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(moods, id: \.1) { mood in
                        Button(action: {
                            onMoodSelected(mood.1) // Trigger the callback
                        }) {
                            HStack(spacing: 4) {
                                Text(mood.0)
                                    .font(.system(size: 16))
                                Text(mood.1)
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(26)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
}


#Preview {
    ZStack {
        LinearGradient(
            gradient: Gradient(colors: [.primaryPurple, .mainPink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        MoodSelectorView { mood in
               print("Selected Mood: \(mood)")
           }
    }
    .frame(height: 120)
}
