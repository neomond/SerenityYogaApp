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
    
    let meditate: Meditation
    
    var body: some View {
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
                            }) {
                                Circle()
                                    .fill(Color.white.opacity(SizeMetrics.opacityThin))
                                    .frame(width: SizeMetrics.xmediumIcon,
                                           height: SizeMetrics.xmediumIcon)
                                    .overlay(
                                        Image(systemName: isLiked ? "heart.fill" : "heart")
                                            .font(.system(size: SizeMetrics.extraSmallIcon))
                                            .foregroundColor(isLiked ? .primaryPurple : .white)
                                    )
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
                        ForEach(meditate.meditations) { meditate in
                            SmallCardView(item: ContentCardModel(
                                title: meditate.title,
                                duration: .time(meditate.duration),
                                imageName: meditate.imageName
                            ),
                                onListenTap: { showPlayerView = true }
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
        
        .fullScreenCover(isPresented: $showPlayerView){
            MeditationPlayerView(meditation: Meditate(title: "Best Self", duration: 80, imageName: "image-stones", description: "Learn how to bring your best self forward in more moments of your life", track: "image-stones"))
        }
        
        .scrollBounce(enabled: false)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
    }
}

#Preview {
    MeditationCardDetailView(meditate: Meditation(
        title: "Best Self",
        description: "Learn how to bring your best self forward in more moments of your life",
        duration: 70,
        track: "image-stones",
        image: "image-stones",
        meditations: [
            Meditate(
                title: "Best Self",
                duration: 70,
                imageName: "image-stones",
                description: "Learn how to bring your best self forward in more moments of your life",
                track: "image-stones")]))
    .environmentObject(AudioManager())
}
