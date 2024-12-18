//
//  AgePickerView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 18.12.24.
//

import SwiftUI

struct AgePickerView: View {
    @State private var isExpanded: Bool = false // Controls dropdown visibility
    @State private var selectedDate: Date = Date() // Stores the selected date

    var body: some View {
        VStack(spacing: 16) {
            // Dropdown Button
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text("Age")
                        .foregroundColor(.black)
                        .font(.headline)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }

            // DatePicker (Dropdown Content)
            if isExpanded {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.wheel) // Wheel style for scrollable columns
                .labelsHidden() // Hide the default label
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    AgePickerView()
}

