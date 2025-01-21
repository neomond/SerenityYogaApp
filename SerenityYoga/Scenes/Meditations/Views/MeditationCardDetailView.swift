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
     
    var body: some View {
        ZStack {
            // MARK: - Content ScrollView
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - Image Section with Buttons
                    ZStack(alignment: .top) {
                        Image("yogaasana1")
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
                        Text("10 meditations")
                            .font(.subheadline)
                            .foregroundColor(.primaryPurple)
                        
                        Text("Remember to Breathe")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text("Bring awareness back onto the menu. Reconnect with yourself.")
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
                        ForEach(1...15, id: \.self) { index in
                            SmallCardView(item: ContentCardModel(
                                title: "Session \(index)",
                                duration: "\(10 + index * 5) min",
                                imageName: "yogaasana1"
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
        
        .navigationDestination(isPresented: $showPlayerView) {
            MeditationPlayerView()
        }
        
        .scrollBounce(enabled: false)
        .edgesIgnoringSafeArea(.vertical)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MeditationCardDetailView()
}
