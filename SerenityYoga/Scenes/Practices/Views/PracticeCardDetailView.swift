//
//  PracticeCardDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 28.01.25.
//

import SwiftUI

struct PracticeCardDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isLiked: Bool = false
    @State private var showYTPlayerView: Bool = false
    
    @ObservedObject var viewModel: PracticesViewModel
    
    
    var body: some View {
        let practice = viewModel.selectedPractice
        
        ZStack {
            // MARK: - Content ScrollView
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - Image Section with Buttons
                    ZStack(alignment: .top) {
                        Image(practice.image)
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
                        Text("\(practice.sessions.count) sessions")
                            .font(.subheadline)
                            .foregroundColor(.primaryPurple)
                        
                        Text(practice.title)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text(practice.description)
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
                        ForEach(practice.sessions) { session in
                            SmallCardView(item: ContentCardModel(
                                title: session.title,
                                duration: .string(session.duration),
                                imageName: session.imageName
                            ),
                                onListenTap: { showYTPlayerView = true }
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
        
        .fullScreenCover(isPresented: $showYTPlayerView) {
            if let selectedSession = practice.sessions.first {
                PracticesPlayerView(videoURL: selectedSession.videoURL)
            }
        }
        
        .scrollBounce(enabled: false)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    let mockPractices = Practice(
        title: "Morning yoga",
        description: "Learn how to bring your best self forward in more moments of your life",
        duration: 1500,
        image: "yogaasana1",
        sessions: [
            Session(
                title: "Sun Salutation",
                duration: "10 min",
                imageName: "yogaasana1",
                description: "Learn how to bring your best self forward in more moments of your life",
                videoURL: "https://www.youtube.com/watch?v=abcd1234"
            ),
            Session(
                title: "Final Relaxation",
                duration: "20 min",
                imageName: "yogaasana3",
                description: "Cool down and relax.",
                videoURL: "https://www.youtube.com/watch?v=qwerty90"
            )
        ]
    )
    
    let viewModel = PracticesViewModel(practices: [mockPractices])
    return PracticeCardDetailView(viewModel: viewModel)
}
