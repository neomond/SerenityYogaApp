//
//  MeditationCardDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 21.01.25.
//

import SwiftUI

struct MeditationCardDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isLiked: Bool = false
    @State private var showPlayerView: Bool = false
    
    @ObservedObject var viewModel: MeditationViewModel
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        let meditate = viewModel.selectedMeditation
        
        ZStack {
            // MARK: - Content ScrollView
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - Image Section with Buttons
                    ZStack(alignment: .top) {
                        Image(meditate.image)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 250)
                            .clipped()
                            .ignoresSafeArea(edges: .top)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, .black.opacity(0.6)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Circle()
                                    .fill(Color.white.opacity(SizeMetrics.opacityThin))
                                    .frame(width: SizeMetrics.xmediumIcon,
                                           height: SizeMetrics.xmediumIcon)
                                    .overlay(
                                        Image(systemName: "chevron.left")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                    )
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                isLiked.toggle()
                                favoritesViewModel.toggleLike(for: meditate)
                            }) {
                                Circle()
                                    .fill(Color.white.opacity(SizeMetrics.opacityThin))
                                    .frame(width: SizeMetrics.xmediumIcon,
                                           height: SizeMetrics.xmediumIcon)
                                    .overlay(
                                        Image(systemName: favoritesViewModel.isLiked(meditate) ? "heart.fill" : "heart")
                                            .font(.system(size: SizeMetrics.extraSmallIcon))
                                            .foregroundColor(favoritesViewModel.isLiked(meditate) ? .primaryPurple : .white)
                                    )
                            }
                            .onAppear {
                                isLiked = favoritesViewModel.isLiked(meditate) 
                            }
                        }
                        .padding(.vertical, 40)
                        .padding(.horizontal)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(meditate.meditations.count) meditations")
                            .font(.subheadline)
                            .foregroundColor(.primaryPurple)
                        
                        Text(meditate.title)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text(meditate.description)
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                            .multilineTextAlignment(.leading)
                        
                        VStack {
                            Text("Meditations in this collection")
                                .padding(.top, 20)
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 12)
                    
                    // MARK: - Sessions Section
                    VStack(spacing: SizeMetrics.mediumPadding) {
                        ForEach(meditate.meditations) { meditateItem in
                            SmallCardView(
                                item: ContentCardModel(
                                    title: meditateItem.title,
                                    duration: .time(meditateItem.duration),
                                    imageName: meditateItem.imageName
                                ),
                                onListenTap: {
                                    viewModel.selectedMeditationItem = meditateItem
                                    showPlayerView = true
                                }
                            )
                            .padding(.leading, SizeMetrics.smallPadding)
                            
                            // MARK: - Light Gray Divider
                            Divider()
                                .background(Color.gray.opacity(SizeMetrics.opacityThin))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, SizeMetrics.mediumSpacing)
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                    )
                    
                }
            }
        }
        
        .fullScreenCover(isPresented: $showPlayerView) {
            if let selectedMeditate = viewModel.selectedMeditationItem {
                MeditationPlayerView(
                    favoritesViewModel: favoritesViewModel,  
                    meditation: selectedMeditate
                )
            }
        }
        
        
        .scrollBounce(enabled: false)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
    }
}

#Preview {
    let mockMeditation = Meditation(
        title: "Best Self",
        description: "Learn how to bring your best self forward in more moments of your life",
        duration: 70,
        image: "image-stones",
        meditations: [
            Meditate(
                title: "Deep Relaxation",
                duration: 150,
                imageName: "image-stones",
                description: "Relax deeply before sleep",
                track: "meditation1"
            )
        ]
    )
    
    let viewModel = MeditationViewModel(meditations: [mockMeditation])
    let favoritesVM = FavoritesViewModel()
    viewModel.selectedMeditation = mockMeditation
    
    return MeditationCardDetailView(viewModel: viewModel, favoritesViewModel: favoritesVM)
        
        .environmentObject(AudioManager())
}
