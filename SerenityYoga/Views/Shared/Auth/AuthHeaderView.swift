//
//  AuthHeaderView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.10.24.
//

import SwiftUI

struct AuthHeaderView: View {
    let title: String
    let subtitle: String
    let actionText: String
    let actionDestination: AnyView?
    
    var body: some View {
        VStack(spacing: 12) {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.top, 10)
            
            Text(title)
                .font(.title)
            
            Text(subtitle)
                .foregroundColor(.gray)
            
            NavigationLink(destination: actionDestination) {
                Text(actionText)
                    .foregroundColor(.primaryPurple)
                    .fontWeight(.medium)
            }
        }
        .padding(.bottom, 25)
    }
}

#Preview {
    AuthHeaderView(title: "Test", subtitle: "Test", actionText: "Test", actionDestination: nil)
}
