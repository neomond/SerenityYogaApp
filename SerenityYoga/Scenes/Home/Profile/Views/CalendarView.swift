//
//  CalendarView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 07.01.25.
//

import SwiftUI

struct CalendarView: View {
    let daysInMonth = Array(1...31)
    let weekdays = ["M", "T", "W", "T", "F", "S", "S"]
    let selectedDates: [Int] = [12, 13, 18] /// Highlighted dates
    let today: Int = 19 /// Current day
    let startOffset = 0 /// Adjust to match the first weekday of the month (e.g., Sunday = 0)

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button(action: { }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Text("January 2023")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: { }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            
            /// Weekday headers
            HStack {
                ForEach(weekdays, id: \.self) { weekday in
                    Text(weekday)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
            }
            
            /// Calendar grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 16) {
                /// Empty spaces for the start of the month
                ForEach(0..<startOffset, id: \.self) { _ in
                    Text("") 
                }
                
                /// Days of the month
                ForEach(daysInMonth, id: \.self) { day in
                    ZStack {
                        /// Light gray background for today's date
                        if day == today {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: 36, height: 36)
                        }
                        
                        /// Highlight selected dates
                        if selectedDates.contains(day) {
                            Circle()
                                .fill(Color.primaryPurple)
                                .frame(width: 36, height: 36)
                        }
                        
                        Text("\(day)")
                            .foregroundColor(selectedDates.contains(day) ? .white : .black)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding()
    }
}

#Preview {
    CalendarView()
}
