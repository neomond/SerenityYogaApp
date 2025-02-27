//
//  MoodSelectorView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct MoodSelectorView: View {
    let onMoodSelected: (String) -> Void
    
    let moods = [
        ("🤯", "Stress"),
        ("🥵", "Anxiety"),
        ("😖", "Depression"),
        ("😱", "Shock"),
    ]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: SizeMetrics.smallPadding) {
                    ForEach(moods, id: \.1) { mood in
                        Button(action: {
                            print("Mood Selected: \(mood.1)")
                            onMoodSelected(mood.1)
                        }) {
                            HStack(spacing: SizeMetrics.xsSmallPadding) {
                                Text(mood.0)
                                    .font(.system(size: SizeMetrics.mediumPadding))
                                Text(mood.1)
                                    .font(.system(size: SizeMetrics.xmediumSpacing, weight: .semibold))
                            }
                            .padding(.horizontal, SizeMetrics.mediumPadding)
                            .padding(.vertical, SizeMetrics.verticalPadding)
                            .background(Color.white.opacity(SizeMetrics.opacityThin))
                            .foregroundColor(.white)
                            .cornerRadius(SizeMetrics.mRadius)
                        }
                    }
                }
                .padding(.horizontal, SizeMetrics.largePadding)
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
