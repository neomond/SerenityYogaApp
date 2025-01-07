//
//  CircularProgressView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.01.25.
//

import SwiftUI

struct CircularProgressView: View {
    /// Progress value between 0 and 1
    @State private var progress: Double = 0.25 /// Example: 25% progress
    @State private var selectedDays: [String] = [] // Selected days
       @State private var totalDays: Int = 0
    let completedDays: Int = 1
    @State private var isSheetPresented: Bool = false
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .trim(from: 0.15, to: 0.85)   /// Partial circle for the track
                    .stroke(
                        Color.gray.opacity(0.1),
                        style: StrokeStyle(lineWidth: 24, lineCap: .round)
                    )
                    .rotationEffect(.degrees(90)) /// Rotate to align with the foreground arc
                
                Circle()
                    .trim(from: 0.15, to: CGFloat(0.15 + 0.7 * progress))
                /// Match progress within the arc range
                    .stroke(
                        Color.primaryPurple,
                        style: StrokeStyle(lineWidth: 24, lineCap: .round)
                    )
                    .rotationEffect(.degrees(90)) /// Rotate to align with the track
                
                VStack {
                    Text("\(completedDays)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("/\(totalDays) days")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 160, height: 160)
            
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
                WeeklyGoalSheet(selectedDays: $selectedDays, totalDays: $totalDays)
            }
        }
    }
}

#Preview {
    CircularProgressView()
}
