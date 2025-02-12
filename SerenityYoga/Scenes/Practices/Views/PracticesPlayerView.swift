//
//  PracticesPlayerView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 11.02.25.
//

import SwiftUI

struct PracticesPlayerView: View {
    let videoURL: String
    @Environment(\.dismiss) var dismiss
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height * 0.6
    @GestureState private var dragOffset: CGFloat = 0
    @State private var isLiked: Bool = false
    
    
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
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThinSecond))
                            .frame(width: SizeMetrics.xmediumIcon,
                                   height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .font(.system(size: SizeMetrics.extraSmallIcon))
                                    .foregroundColor(isLiked ? .primaryPurple : .white)
                            )
                    }
                }
                .padding(.horizontal)
                
                Spacer().frame(height: 150)
                
                // MARK: YouTube Player
                YouTubePlayerView(videoURL: videoURL)
                    .aspectRatio(16/9, contentMode: .fit)
                    .shadow(radius: 5)
                
                Spacer()
            }
            
            // MARK: Draggable Bottom Sheet
            PracticesBottomSheet(offsetY: $offsetY)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    PracticesPlayerView(videoURL: "https://www.youtube.com/watch?v=M7lc1UVf-VE")
}
