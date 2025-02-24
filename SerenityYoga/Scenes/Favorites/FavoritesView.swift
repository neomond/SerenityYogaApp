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
                
                if favoritesViewModel.likedMeditations.isEmpty &&
                   favoritesViewModel.likedMeditateTracks.isEmpty &&
                   favoritesViewModel.likedPractices.isEmpty {
                    
                    Text("No favorites yet! ❤️")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                    
                } else {
                    ScrollView {
                        VStack(spacing: SizeMetrics.largePadding) {
                            
                            // MARK: - Favorite Practices (New Section)
                            if !favoritesViewModel.likedPractices.isEmpty {
                                Text("Favorite Practices 🧘‍♂️")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, SizeMetrics.largeSpacing)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: SizeMetrics.mediumSpacing) {
                                        ForEach(favoritesViewModel.likedPractices) { practice in
                                            PracticesCardView(
                                                viewModel: PracticesViewModel(),
                                                practice: practice,
                                                favoritesViewModel: favoritesViewModel
                                            )
                                            .frame(width: 300, height: 320)
                                        }
                                    }
                                    .padding(.horizontal, SizeMetrics.largeSpacing)
                                }
                            }
                            
                            // MARK: - Saved Meditation Collections
                            if !favoritesViewModel.likedMeditations.isEmpty {
                                Text("Meditation Collections 🫶")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, SizeMetrics.largeSpacing)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: SizeMetrics.mediumSpacing) {
                                        ForEach(favoritesViewModel.likedMeditations) { meditation in
                                            MeditationCardView(
                                                viewModel: MeditationViewModel(),
                                                meditation: meditation,
                                                favoritesViewModel: favoritesViewModel
                                            )
                                            .frame(width: 300, height: 320)
                                        }
                                    }
                                    .padding(.horizontal, SizeMetrics.largeSpacing)
                                }
                            }
                            
                            // MARK: - Saved Individual Meditation Tracks
                            if !favoritesViewModel.likedMeditateTracks.isEmpty {
                                Text("Saved Meditation Tracks 🎼 🎶")
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
                                    .padding(.horizontal, SizeMetrics.largeSpacing)
                                    
                                    Divider()
                                        .background(Color.gray.opacity(SizeMetrics.opacityThin))
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.top, SizeMetrics.smallPadding)
                    }
                    .scrollBounce(enabled: false)
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                }
            }
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
