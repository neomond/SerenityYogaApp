//
//  PracticesPlayerView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 11.02.25.
//

import SwiftUI

struct PracticesPlayerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height * 0.6
    @GestureState private var dragOffset: CGFloat = 0
    @State private var isLiked: Bool = false
    @ObservedObject var favoritesViewModel: FavoritesViewModel

    let session: Session
    
    var body: some View {
        ZStack(alignment: .top) {
            // MARK: Blur View
            Rectangle()
                .background(Color.primaryPurple)
                .opacity(0.25)
                .ignoresSafeArea()
            
            // MARK: Top Nav Buttons (Dismiss and Like)
            VStack(spacing: 16) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThinSecond))
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
                        favoritesViewModel.toggleLike(for: session)
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThinSecond))
                            .frame(width: SizeMetrics.xmediumIcon,
                                   height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: favoritesViewModel.isLiked(session) ? "heart.fill" : "heart")
                                    .font(.system(size: SizeMetrics.extraSmallIcon))
                                    .foregroundColor(favoritesViewModel.isLiked(session) ? .primaryPurple : .white)
                            )
                    }
                }
                .padding(.horizontal)
                
                Spacer().frame(height: 150)
                
                // MARK: YouTube Player
                if let embedURL = YouTubeManager.shared.getEmbedURL(from: session.videoURL) {
                    YouTubePlayerView(videoURL: embedURL)
                        .aspectRatio(16/9, contentMode: .fit)
                        .shadow(radius: 5)
                } else {
                    Text("⚠️ Invalid YouTube URL")
                        .foregroundColor(.red)
                }
                
                Spacer()
            }
            
            // MARK: Draggable Bottom Sheet
            PracticesBottomSheet(
                offsetY: $offsetY,
                session: session
            )
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(edges: .bottom)
        }
        .onAppear {
            isLiked = favoritesViewModel.isLiked(session)
        }
    }
}

#Preview {
    let favoritesVM = FavoritesViewModel()
    
    return PracticesPlayerView(
        favoritesViewModel: favoritesVM,
        session: Session(
            title: "Sun Salutation",
            duration: "10 min",
            imageName: "yogaasana1",
            description: "Start your day with energy.",
            videoURL: "https://www.youtube.com/watch?v=abcd1234"
        )
    )
}
