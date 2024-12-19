//
//  IconsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct IconsView: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 45, height: 45)
                .overlay(
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                )
            Spacer()
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 45, height: 45)
                .overlay(
                    Image(systemName: "bookmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                )
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ZStack {
        LinearGradient(
                   gradient: Gradient(colors: [.primaryPurple, .mainPink]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing
               )
               .edgesIgnoringSafeArea(.all)
        IconsView()
    }
    .frame(height: 120)
}

