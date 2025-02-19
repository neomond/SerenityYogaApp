//
//  FavoritesView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 30.01.25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(title: "Favorites 🌱")
                    .padding(.horizontal, SizeMetrics.largePadding)
                
                if favoritesViewModel.likedMeditations.isEmpty && favoritesViewModel.likedMeditateTracks.isEmpty {
                    Text("No favorites yet! ❤️")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                    
                } else {
                    ScrollView {
                        VStack(spacing: SizeMetrics.largePadding) {
                            
                            // MARK: - Saved Meditation Collections
                            if !favoritesViewModel.likedMeditations.isEmpty {
                                Text("Meditation Collections")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, SizeMetrics.mediumSpacing)
                                
                                ForEach(favoritesViewModel.likedMeditations) { meditation in
                                    MeditationCardView(
                                        viewModel: MeditationViewModel(),
                                        meditation: meditation,
                                        favoritesViewModel: favoritesViewModel
                                    )
                                }
                            }
                            
                            // MARK: - Saved Individual Meditation Tracks
                            if !favoritesViewModel.likedMeditateTracks.isEmpty {
                                Text("Saved Meditation Tracks")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, SizeMetrics.mediumSpacing)
                                    .padding(.top, 20)
                                
                                ForEach(favoritesViewModel.likedMeditateTracks) { meditate in
                                    SmallCardView(
                                        item: ContentCardModel(
                                            title: meditate.title,
                                            duration: .time(meditate.duration),
                                            imageName: meditate.imageName
                                        ),
                                        onListenTap: {}
                                    )
                                    .padding(.leading, SizeMetrics.smallPadding)
                                    
                                    Divider()
                                        .background(Color.gray.opacity(SizeMetrics.opacityThin))
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.top, SizeMetrics.smallPadding)
                        .padding(.horizontal, SizeMetrics.mediumSpacing)
                    }
                    .scrollBounce(enabled: false)
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                }
            }
        }
        .onAppear {
            favoritesViewModel.objectWillChange.send()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    let mockFavoritesViewModel = FavoritesViewModel()

    return NavigationStack {
        FavoritesView(favoritesViewModel: mockFavoritesViewModel)
    }
}
