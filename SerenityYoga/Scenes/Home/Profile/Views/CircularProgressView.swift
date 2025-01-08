//
//  CircularProgressView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.01.25.
//

import SwiftUI

struct CircularProgressView: View {
    @Binding var selectedDays: [String] // Shared state for selected days
    @Binding var totalDays: Int // Shared state for total selected days
    let isEditable: Bool
    let subtitleText: String // Dynamically set the subtitle text

    @State private var isSheetPresented: Bool = false

    var completedDays: Int {
//    MARK: - Replace
        return selectedDays.count
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                // Background Circle (track)
                Circle()
                    .trim(from: 0.15, to: 0.85)
                    .stroke(
                        Color.gray.opacity(0.1),
                        style: StrokeStyle(lineWidth: 24, lineCap: .round)
                    )
                    .rotationEffect(.degrees(90))
                
                // Foreground Circle (progress)
                Circle()
                    .trim(from: 0.15, to: CGFloat(0.15 + 0.7 * (Double(totalDays) / 7.0)))
                    .stroke(
                        Color.primaryPurple,
                        style: StrokeStyle(lineWidth: 24, lineCap: .round)
                    )
                    .rotationEffect(.degrees(90))
                
                // Center Text
                VStack {
                    Text("\(completedDays)") // Dynamically display completed days
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(subtitleText) // Dynamically display the subtitle
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 160, height: 160)
            
            // "Edit" Button
            if isEditable {
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    Text("Edit")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.primaryPurple)
                }
                .padding(.top, -10)
                .padding(.bottom, 28)
                .sheet(isPresented: $isSheetPresented) {
                    WeeklyGoalSheet(
                        selectedDays: $selectedDays,
                        totalDays: $totalDays
                    )
                }
            }
        }
    }
}

