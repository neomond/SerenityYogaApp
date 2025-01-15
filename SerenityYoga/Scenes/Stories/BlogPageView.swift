//
//  BlogPageView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.01.25.
//

import SwiftUI

struct BlogPageView: View {
    @State private var showProfileView: Bool = false
    @State private var isSheetPresented: Bool = false
    @State private var isAddStorySheetPresented: Bool = false
    @State private var selectedStory: Story?
    
    @State private var stories: [Story] = [
        Story(name: "Your Story", image: "system:add.circle.fill", isAddStory: true),
        Story(name: "Jeena", image: "yogaasana2", isAddStory: false),
        Story(name: "Emma", image: "yogaImage", isAddStory: false),
        Story(name: "Andy", image: "yogaImage", isAddStory: false),
        Story(name: "Sara", image: "system:person.circle", isAddStory: false)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // MARK: - Gradient Background
                GradientBg(colors: [.cornflowerblueBg, .skyblueBg, .blueBg])
                
                VStack(spacing: 0) {
                    // MARK: - Top Icons View
                    IconsView(
                        onProfileTapped: { showProfileView = true },
                        label: "Stories 🧡"
                    )
                    .padding(.bottom, SizeMetrics.xlargePadding)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            
                            // MARK: - Stories ScrollView
                            StoriesComponentView(stories: stories) { story in
                                if story.isAddStory {
                                    isAddStorySheetPresented = true
                                } else {
                                    selectedStory = story
                                    isSheetPresented = true
                                }
                            }
                            
                            HStack {
                                Text("Daily Stories")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                Spacer()
                                
                                NavigationLink(destination: AllBlogsView(stories: stories)) {
                                    Text("View All")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 8)
                            
                            // MARK: - Story Cards Section
                            VStack(spacing: 16) {
                                BlogCardView(
                                    image: "yogaImage",
                                    title: "Self-love",
                                    description: """
Somewhere in our minds, removed from the day to day, there sits a judge. They watch what we do, study how we perform, examine the effect we have on others, track our successes and failures - and then, eventually, they pass a verdict. So consequential is this judgement, it colours our entire sense of ourselves. It determines our levels of confidence and self-compassion, it lends us a sense of whether we are worthwhile beings or conversely, should not really exist. The judge is in charge of what we call our self-esteem.

The verdict of the judge is more or less loving, more or less enthusiastic, but not according to any objective rule-book or statute. Two individuals can end up with wildly different levels of self-esteem even though they may have done much the same things. Certain judges simply seem more predisposed than others to lend us an essentially buoyant, warm, appreciative and generous view of ourselves. Others encourage us to be hugely critical, often disappointed and sometimes close to disgust.

The origins of the voice of the inner judge is simple to trace: it is an internalisation of the voice of people who were once outside us. We absorb the tones of contempt and indifference or charity and warmth that we will have heard across our formative years. Our heads are cavernous spaces and pretty much all of us have voices echoing within them. Sometimes, a voice is positive and benign, encouraging us to run those final few yards: 'you're nearly there, keep going, keep going'.

But more often, the inner voice is not very nice at all. It is defeatist and punitive, panic-ridden and humiliating. It doesn't represent anything like our best insights or most mature capacities.
""",
                                    quote: "Bring awareness back onto the menu. \nReconnect with yourself."
                                )
                                
                                QuoteCardView(
                                    title: "We can’t always change what’s happening around us, but we can change what happens within us.",
                                    author: "Andy Puddicombe"
                                )
                            }
                        }
                        .padding(.top, 28)
                        .frame(maxWidth: .infinity)
                    }
                    .scrollBounce(enabled: false)
                    .background(
                        Color.white
                            .clipShape(RoundedCorner(
                                radius: SizeMetrics.xlargeRadius,
                                corners: [.topLeft, .topRight]))
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }
                .frame(maxWidth: .infinity)
            }
            .edgesIgnoringSafeArea(.bottom)
            
            // MARK: - Present Story
            .sheet(isPresented: $isSheetPresented) {
                if let story = selectedStory {
                    StoryDetailView(story: story)
                }
            }
            
            // MARK: - Add story
            .sheet(isPresented: $isAddStorySheetPresented) {
                AddStoryView { newStory in
                    stories.append(newStory)
                }
            }
            
            // MARK: - Navigation to ProfileView
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
        }
    }
}

#Preview {
    BlogPageView()
}
