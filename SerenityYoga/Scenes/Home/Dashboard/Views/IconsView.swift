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
                .fill(Color.white.opacity(SizeMetrics.opacityThin))
                .frame(width: SizeMetrics.xmediumIcon, height: SizeMetrics.xmediumIcon)
                .overlay(
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: SizeMetrics.extraSmallIcon, height: SizeMetrics.extraSmallIcon)
                )
            Spacer()
            Circle()
                .fill(Color.white.opacity(SizeMetrics.opacityThin))
                .frame(width: SizeMetrics.xmediumIcon, height: SizeMetrics.xmediumIcon)
                .overlay(
                    Image(systemName: "bookmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: SizeMetrics.extraSmallIcon, height: SizeMetrics.extraSmallIcon)
                )
            
        }
        .padding(.horizontal, SizeMetrics.largePadding)
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
    .frame(height: SizeMetrics.tabBarHeight)
}

