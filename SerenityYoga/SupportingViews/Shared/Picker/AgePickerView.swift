//
//  AgePickerView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 18.12.24.
//

import SwiftUI

struct AgePickerViewWrapper: View {
    @Binding var age: Int
    @State private var isExpanded: Bool = false
    @State private var selectedDate: Date = Calendar.current.date(byAdding: .year, value: -24, to: Date())!

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text("Age: \(Calendar.current.dateComponents([.year], from: selectedDate, to: Date()).year ?? 24)")
                        .foregroundColor(.secondaryGray)
                        .font(SizeMetrics.Fonts.body)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(SizeMetrics.mediumRadius)
            }
            
            if isExpanded {
                HStack(alignment: .center) {
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        in: ...Date(),
                        displayedComponents: .date
                    )
                    .datePickerStyle(.wheel)
                    .labelsHidden() // Hide default labels
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 150)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(SizeMetrics.mediumRadius)
                .onChange(of: selectedDate) { _ in
                    // Update the binding age
                    age = Calendar.current.dateComponents([.year], from: selectedDate, to: Date()).year ?? 24
                }
            }
            
        }
    }
}

#Preview {
    @State var previewAge: Int = 24
    @State var previewWeight: String = ""
    @State var previewHeight: String = ""
    
    return PersonalDetailsView(
        age: $previewAge,
        weight: $previewWeight,
        height: $previewHeight,
        onNext: {
            print("Details step completed: Age: \(previewAge), Weight: \(previewWeight), Height: \(previewHeight)")
        },
        onBack: {
            print("Back button tapped")
        }
    )
}


