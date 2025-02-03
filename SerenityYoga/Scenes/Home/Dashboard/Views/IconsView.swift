//
//  IconsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct IconsView: View {
    let onProfileTapped: () -> Void
    let onFavoritesTapped: () -> Void
    let label: String?
    
    var body: some View {
        HStack {
            Button(action: onProfileTapped) {
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
            }
            
            Spacer()
            
            // MARK: - Optional label in the center
            if let label = label {
                Text(label)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Spacer()
            
            Button(action: onFavoritesTapped) {
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
        IconsView(onProfileTapped: { },
                  onFavoritesTapped: { }, label: "Meow")
    }
    .frame(height: SizeMetrics.tabBarHeight)
}

