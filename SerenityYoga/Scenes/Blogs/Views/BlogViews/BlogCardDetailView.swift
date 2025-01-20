//
//  BlogCardDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 15.01.25.
//

import SwiftUI

struct BlogCardDetailView: View {
    
    let blog: Blog
    
    @Environment(\.dismiss) var dismiss
    @State private var isLiked: Bool = false
    
    @State private var likeCount: Int = 29
    
    var body: some View {
        ZStack {
            // MARK: - Content ScrollView
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - Image Section with Buttons
                    ZStack(alignment: .top) {
                        if let image = blog.image {
                            Image(image)
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
                        }
                        
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
                    
                    // MARK: - Blog Content Section
                    VStack(alignment: .leading) {
                        Text(blog.title)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        
                        if !blog.quote.isEmpty {
                            Text(blog.quote)
                                .font(.body)
                                .padding(.bottom, 8)
                        }
                        
                        HStack {
                            Button(action: {
                                isLiked.toggle()
                                if isLiked {
                                    likeCount += 1
                                } else {
                                    likeCount -= 1
                                }
                            }) {
                                HStack {
                                    Image(systemName: isLiked ? "heart.fill" : "heart")
                                        .font(.system(size: 20))
                                        .foregroundColor(isLiked ? .primaryPurple : .black)
                                    
                                    Text("\(likeCount)")
                                        .foregroundColor(isLiked ? .primaryPurple : .black)
                                }
                            }
                            .buttonStyle(.plain)
                        }                    }
                    .padding(.horizontal)
                    
                    // MARK: - Additional Description Section
                    VStack(spacing: 10) {
                        Text(blog.description)
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 100)
            }
            
            // MARK: - Feedback Component
            VStack {
                Spacer()
                FeedbackComponent()
            }
        }
        .scrollBounce(enabled: false)
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    BlogCardDetailView(
        blog: Blog(
            title: "Self-love",
            quote: "Bring awareness back onto the menu. \nReconnect with yourself.",
            description: """
            Somewhere in our minds, removed from the day to day, there sits a judge. They watch what we do, study how we perform, examine the effect we have on others, track our successes and failures - and then, eventually, they pass a verdict.
            """,
            image: "yogaImage",
            author: "Nazrin Atayeva"
        )
    )
}
