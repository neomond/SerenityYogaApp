//
//  FavoritesView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 30.01.25.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(title: "Favorites 🌱")
                    .padding(.horizontal, SizeMetrics.largePadding)
                
                ScrollView {
                    VStack(spacing: SizeMetrics.largePadding) {
                        ForEach(favoriteCategories) { category in
                            SectionView(category: category)
                        }
                    }
                    .padding(.top, SizeMetrics.smallPadding)
                    .padding(.horizontal, SizeMetrics.mediumSpacing)
                }
                .scrollBounce(enabled: false)
                .scrollIndicators(ScrollIndicatorVisibility.hidden)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FavoritesView()
}
