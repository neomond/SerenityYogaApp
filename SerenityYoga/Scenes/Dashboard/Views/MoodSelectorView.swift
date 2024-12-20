//
//  MoodSelectorView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct MoodSelectorView: View {
    @State private var selectedMood: String? = nil
    
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
                        selectedMood = mood.1
                        print("\(mood.1) selected")
                    }) {
                        HStack(spacing: 4) {
                            Text(mood.0)
                                .font(.system(size: 16))
                            Text(mood.1)
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(
                            selectedMood == mood.1 ? Color.white.opacity(0.3) : Color.white.opacity(0.2)
                        )
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
        MoodSelectorView()
    }
    .frame(height: 120)
}
