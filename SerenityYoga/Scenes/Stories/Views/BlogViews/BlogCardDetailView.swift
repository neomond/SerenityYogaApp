//
//  BlogCardDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 15.01.25.
//

import SwiftUI

struct BlogCardDetailView: View {
    let title: String
    let quote: String
    let description: String
    let image: String?
    let author: String?
    
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
                        if let image = image {
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
                                            .font(.system(size: 20))
                                            .foregroundColor(isLiked ? .primaryPurple : .white)
                                    )
                            }
                        }
                        .padding(.vertical, 40)
                        .padding(.horizontal)
                    }
                    
                    // MARK: - Blog Content Section
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        
                        if !quote.isEmpty {
                            Text(quote)
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
                        Text(description)
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
        title: "Self-love",
        quote: "Bring awareness back onto the menu. \nReconnect with yourself.",
        description:  """
Somewhere in our minds, removed from the day to day, there sits a judge. They watch what we do, study how we perform, examine the effect we have on others, track our successes and failures - and then, eventually, they pass a verdict. So consequential is this judgement, it colours our entire sense of ourselves. It determines our levels of confidence and self-compassion, it lends us a sense of whether we are worthwhile beings or conversely, should not really exist. The judge is in charge of what we call our self-esteem.

The verdict of the judge is more or less loving, more or less enthusiastic, but not according to any objective rule-book or statute. Two individuals can end up with wildly different levels of self-esteem even though they may have done much the same things. Certain judges simply seem more predisposed than others to lend us an essentially buoyant, warm, appreciative and generous view of ourselves. Others encourage us to be hugely critical, often disappointed and sometimes close to disgust.

The origins of the voice of the inner judge is simple to trace: it is an internalisation of the voice of people who were once outside us. We absorb the tones of contempt and indifference or charity and warmth that we will have heard across our formative years. Our heads are cavernous spaces and pretty much all of us have voices echoing within them. Sometimes, a voice is positive and benign, encouraging us to run those final few yards: 'you're nearly there, keep going, keep going'.

But more often, the inner voice is not very nice at all. It is defeatist and punitive, panic-ridden and humiliating. It doesn't represent anything like our best insights or most mature capacities.
""",
        image: "yogaImage",
        author: "Nazrin Atayeva"
    )
}

