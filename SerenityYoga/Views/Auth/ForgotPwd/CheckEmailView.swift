//
//  CheckEmailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 22.10.24.
//

import SwiftUI

struct CheckEmailView: View {
    var onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(width: SizeMetrics.largeIcon, height: SizeMetrics.largeIcon)
                .padding(.bottom, 80)
            
            Text("Check Email").font(.title)
            Text("We have sent you an email with a code")
                .foregroundColor(.gray).font(.callout)
                .padding(.bottom, 20)
            
            AppButton(title: "Check Email") {
                print("Check email tapped: ")
                onNext()
            }
            
            Spacer()
        }
    }
}

#Preview {
    CheckEmailView(onNext: { print("Continue button tapped") })
}
