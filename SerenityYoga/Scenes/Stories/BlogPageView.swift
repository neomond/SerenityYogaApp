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
   
    @StateObject private var viewModel = BlogViewModel()

    
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
                    .padding(.bottom, SizeMetrics.largePadding)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            
                            // MARK: - Blogs
                            HStack {
                                Text("Daily Stories")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                Spacer()
                                
                                NavigationLink(destination: AllBlogsView(viewModel: viewModel)) {
                                    Text("View All")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 8)
                            
                            // MARK: - Story Cards Section
                            VStack(spacing: 16) {
                                if let firstBlog = viewModel.blogs.first {
                                    BlogCardView(blog: firstBlog)
                                }
                                                            
                                QuoteCardView(
                                    title: "We can’t always change what’s happening around us, but we can change what happens within us.",
                                    author: "Andy Puddicombe"
                                )
                            }
                        }
                        .padding(.top, 28)
                        .frame(maxWidth: .infinity)
                    }
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
            .scrollBounce(enabled: false)
            .edgesIgnoringSafeArea(.bottom)
            
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
