//
//  PersonalDetailsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 18.12.24.
//

import SwiftUI

struct PersonalDetailsView: View {
    @Binding var age: Int
    @Binding var weight: String
    @Binding var height: String
    var onNext: () -> Void
    var onBack: () -> Void
    
    @State private var isAgePickerVisible: Bool = false
    
    var body: some View {
        VStack(spacing: SizeMetrics.mediumSpacing) {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(width: SizeMetrics.largeIcon, height: SizeMetrics.largeIcon)
            
            Text("Please, tell us more about yourself")
                .font(SizeMetrics.Fonts.title2)
                .padding(.bottom, SizeMetrics.mediumPadding)
            
            // Collapsible Age Picker
            VStack {
                Button(action: {
                    withAnimation {
                        isAgePickerVisible.toggle()
                    }
                }) {
                    HStack {
                        Text("Age: \(age)")
                            .foregroundColor(Color.secondaryGray)
                            .font(SizeMetrics.Fonts.body)
                        Spacer()
                        Image(systemName: isAgePickerVisible ? "chevron.up" : "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(SizeMetrics.mediumRadius)
                }
                
                if isAgePickerVisible {
                    Picker("Age", selection: $age) {
                        ForEach(10...100, id: \.self) { Text("\($0)") }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 150)
                    .clipped()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(SizeMetrics.mediumRadius)
                }
            }
            
            // Weight and Height Fields
            AuthTextField(placeholder: "Weight", text: $weight, isSecure: false, showPassword: .constant(false))
            AuthTextField(placeholder: "Height", text: $height, isSecure: false, showPassword: .constant(false))
            
            Spacer()
            
            // Back and Continue Buttons
            HStack {
                AppButton(title: "Back", action: onBack)
                AppButton(title: "Continue", action: onNext)
            }
            .padding(.top, SizeMetrics.largePadding)
            .padding(.bottom, SizeMetrics.largePadding)
        }
        .padding(SizeMetrics.horizontalPadding)
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

