//
//  MeditationCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 20.01.25.
//

import SwiftUI

struct MeditationCardView: View {
    let viewModel: MeditationViewModel
    let meditation: Meditation
    
    @ObservedObject var favoritesViewModel: FavoritesViewModel
        
    var body: some View {
        NavigationLink(
            destination: MeditationCardDetailView(viewModel: viewModel, favoritesViewModel: favoritesViewModel)
                .onAppear {
                    /// Update selectedMeditation when the card is tapped
                    viewModel.selectedMeditation = meditation
                }
        ) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image(meditation.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 190)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [.clear, .black.opacity(0.4)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .clipped()
                    
                    Button(action: {
                        favoritesViewModel.toggleLike(for: meditation)
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThin))
                            .frame(width: SizeMetrics.xmediumIcon,
                                   height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: favoritesViewModel.isLiked(meditation) ? "heart.fill" : "heart")
                                    .font(.system(size: SizeMetrics.extraSmallIcon))
                                    .foregroundColor(favoritesViewModel.isLiked(meditation) ? .primaryPurple : .white)
                            )
                    }
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(meditation.meditations.count) meditations")
                        .font(.subheadline)
                        .foregroundColor(.primaryPurple)
                    
                    Text(meditation.title)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(meditation.description)
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .padding(.horizontal)
        }
    }
}

#Preview {
    let mockMeditation = Meditation(
        title: "Mindful Journey",
        description: "Embark on a journey of mindfulness and inner peace.",
        duration: 90,
        image: "yogaasana2",
        meditations: [
            Meditate(
                title: "Breathe and Relax",
                duration: 120,
                imageName: "yogaasana2",
                description: "Focus on your breath to relax deeply.",
                track: "meditation1"
            )
        ]
    )
    
    let viewModel = MeditationViewModel(meditations: [mockMeditation])
    let favoritesViewModel = FavoritesViewModel()
    
    viewModel.selectedMeditation = mockMeditation
    
    return NavigationView {
        MeditationCardView(
            viewModel: viewModel,
            meditation: mockMeditation,
            favoritesViewModel: favoritesViewModel
        )
    }
    
    .environmentObject(AudioManager())
}
