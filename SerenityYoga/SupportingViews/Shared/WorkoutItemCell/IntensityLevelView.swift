//
//  IntensityLevelView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 12.02.25.
//

import SwiftUI

struct IntensityLevelView: View {
    @State private var selectedLevel: Int = 0  // 0 - Low, 1 - Medium, 2 - High
    
    let levels = ["Low Intensity", "Medium Intensity", "High Intensity"]

    var body: some View {
        HStack(spacing: 6) {
            
            // MARK: - Vertical Divider
                      Rectangle()
                          .fill(Color.gray.opacity(0.2)) // Light gray color
                          .frame(width: 1.5, height: 20)   // Adjust height for your design
                          .padding(.horizontal, 12)
            
            // MARK: - Circles for Intensity Levels
            ForEach(0..<3) { index in
                Circle()
                    .fill(index == selectedLevel ? Color.primaryPurple : Color.gray.opacity(0.3))
                    .frame(width: 8, height: 8)
                    .onTapGesture {
                        withAnimation {
                            selectedLevel = index
                        }
                    }
            }
            
            // MARK: - Intensity Label
            Text(levels[selectedLevel])
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.leading, 4)
        }
    }
}
