//
//  PracticesView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 28.01.25.
//

import SwiftUI

struct PracticesView: View {
    @State private var showProfileView: Bool = false
    @State private var showFavoritesView: Bool = false
    
    @StateObject 
    var viewModel          = PracticesViewModel()
    
    @StateObject 
    var favoritesViewModel = FavoritesViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // MARK: - Gradient Background
                GradientBg(colors: [.mangoBg, .peachBg, .yellowprimaryBg])
                
                VStack(spacing: 0){
                    // MARK: - Top Icons View
                    IconsView(
                        onProfileTapped:    { showProfileView   = true },
                        onFavoritesTapped:  { showFavoritesView = true},
                        label: "Practices 🌟")
                    .padding(.bottom, SizeMetrics.largePadding)
                    
                    ScrollView {
                        // MARK: Practices Collections
                        VStack(spacing: 24) {
                            ForEach(viewModel.practices, id: \.id){ practice in
                                PracticesCardView(
                                    viewModel:           viewModel,
                                    practice:            practice,
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
            
            // MARK: - Navigation to ProfileView
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
            
            // MARK: - Navigation to FavoritesView
            .navigationDestination(isPresented: $showFavoritesView) {
                FavoritesView(favoritesViewModel: favoritesViewModel)
            }
        }
    }
}

#Preview {
    let vm = PracticesViewModel.mock
    let favoritesVm = FavoritesViewModel()
    
    return NavigationStack {
        PracticesView(
            viewModel: vm,
            favoritesViewModel: favoritesVm)
    }
}
