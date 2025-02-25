//
//  MeditationsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 20.01.25.
//

import SwiftUI

struct MeditationsView: View {
    @State private var showProfileView: Bool = false
    @State private var showFavoritesView: Bool = false
    
    @StateObject var viewModel          = MeditationViewModel()
    @StateObject var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // MARK: - Gradient Background
                GradientBg(colors: [.mainPink, .primaryPurple])
                
                VStack(spacing: 0) {
                    // MARK: - Top Icons View
                    IconsView(
                        onProfileTapped:    { showProfileView   = true },
                        onFavoritesTapped:  { showFavoritesView = true },
                        label: "Meditation 🧘‍♀️"
                    )
                    .padding(.bottom, SizeMetrics.largePadding)
                    
                    ScrollView {
                        // MARK: - Meditation Collections
                        VStack(spacing: 24) {
                            ForEach(viewModel.meditations, id: \.id) { meditation in
                                MeditationCardView(
                                    viewModel:           viewModel,
                                    meditation:          meditation,
                                    favoritesViewModel:  favoritesViewModel
                                )
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, SizeMetrics.largeSpacing)
                    }
                    .padding(.vertical, 32)
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }
                .frame(maxWidth: .infinity)
            }
            
            .scrollBounce(enabled: false)
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            .edgesIgnoringSafeArea(.bottom)
            
            .onAppear {
                favoritesViewModel.loadFavorites()
            }
            .onChange(of: favoritesViewModel.likedMeditations) { _ in
                print("Favorites updated! Syncing UI...")
            }
            
            // MARK: - Navigation to ProfileView
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
            
            // MARK: - Navigation to Favorites
            .navigationDestination(isPresented: $showFavoritesView) {
                FavoritesView(favoritesViewModel: favoritesViewModel)
            }
        }
    }
}

#Preview {
    let viewModel = MeditationViewModel.mock
    let favoritesViewModel = FavoritesViewModel()
    
    return NavigationStack {
        MeditationsView(
            viewModel: viewModel,
            favoritesViewModel: favoritesViewModel)
    }
    .environmentObject(AudioManager())
}
