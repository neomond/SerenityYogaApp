//
//  NameInputView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 18.12.24.
//

import SwiftUI

struct NameInputView: View {
    @Binding var name: String
    var onNext: () -> Void
    
    var body: some View {
            VStack(spacing: SizeMetrics.largeSpacing) {
                Image(.appLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: SizeMetrics.largeIcon, height: SizeMetrics.largeIcon)
                
                Text("Hey, What's your name?")
                    .font(SizeMetrics.Fonts.title2)
                    .padding(.bottom, SizeMetrics.smallPadding)
                
                AuthTextField(placeholder: "Name", text: $name, isSecure: false, showPassword: .constant(false))
                    .frame(height: SizeMetrics.textFieldHeight)
                
                Spacer()
                
                HStack {
                    AppButton(title: "Back") { /* Do Nothing */ }
                    AppButton(title: "Continue", action: onNext)
                }
                .padding(.bottom, SizeMetrics.largePadding)
            }
            .padding(SizeMetrics.horizontalPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
}

#Preview {
    @State var previewName: String = ""
    return NameInputView(name: $previewName,
                         onNext: { print("Name step completed: \(previewName)")} )
}
