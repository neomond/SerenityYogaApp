//
//  WeeklyGoalSheet.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.01.25.
//

import SwiftUI

struct WeeklyGoalSheet: View {
    @Binding var selectedDays: [String] // Selected days, e.g., ["Tue", "Wed"]
    @Binding var totalDays: Int // Total selected days
    
    @State private var currentDetent: PresentationDetent = .medium
    
    let allDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        VStack(spacing: 24) {
            // Header
            VStack(spacing: 8) {
                Text("Set your weekly goal!")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text("To keep you motivated, now you can set your personal goal for your week. Edit your goal anytime later.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            
            // Progress View
            ZStack {
                // Pass @Binding to CircularProgressView
                CircularProgressView(
                    selectedDays: $selectedDays,
                    totalDays: $totalDays,
                    isEditable: false,
                    subtitleText: "days / week"// Hide "Edit" button in bottom sheet
                )
                .frame(height: 200)
                
                VStack {
                    Text("\(totalDays)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("days / week")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            
            // Motivation Text
            HStack {
                Spacer()
                Text("🚀 Perfect")
                    .font(.subheadline)
                    .foregroundColor(.black)
                   
                Spacer()
            }
            .padding(.top, -10)
            .padding(.bottom, 28)
            
            // Day selection in 2 rows
            VStack(spacing: 12) {
                // First row (4 days)
                HStack(spacing: 8) {
                    ForEach(allDays.prefix(4), id: \.self) { day in
                        Button(action: {
                            toggleDaySelection(day: day)
                        }) {
                            Text(day)
                                .frame(maxWidth: 64, minHeight: 46)
                                .foregroundColor(selectedDays.contains(day) ? .white : .gray)
                                .background(selectedDays.contains(day) ? Color.primaryPurple : Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
                
                // Second row (3 days)
                HStack(spacing: 8) {
                    ForEach(allDays.suffix(3), id: \.self) { day in
                        Button(action: {
                            toggleDaySelection(day: day)
                        }) {
                            Text(day)
                                .frame(maxWidth: 64, minHeight: 46)
                                .foregroundColor(selectedDays.contains(day) ? .white : .gray)
                                .background(selectedDays.contains(day) ? Color.primaryPurple : Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // Done Button
            Button(action: {
                // Close the sheet or handle Done action
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 58)
                    .background(Color.primaryPurple)
                    .cornerRadius(30)
            }
            .padding(.horizontal)
        }
        .padding(.top, 20)
        .presentationDetents([.fraction(0.94), .large], selection: $currentDetent)
        .presentationDragIndicator(.hidden)
    }
    
    // Toggle selection for days
    private func toggleDaySelection(day: String) {
        if selectedDays.contains(day) {
            selectedDays.removeAll { $0 == day }
            totalDays -= 1
        } else {
            selectedDays.append(day)
            totalDays += 1
        }
    }
}

#Preview {
    WeeklyGoalSheet(selectedDays: .constant(["Tue", "Wed"]), totalDays: .constant(2))
}

