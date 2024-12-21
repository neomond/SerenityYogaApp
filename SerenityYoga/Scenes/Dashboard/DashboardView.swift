//
//  DashboardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct DashboardView: View {
    @State private var isTabBarCollapsed = false
    @State private var selectedTab = 0
    
    let tabs = [
        TabItem(icon: "house", title: "Home"),
        TabItem(icon: "circle.grid.cross", title: "Explore"),
        TabItem(icon: "bookmark", title: "Saved"),
        TabItem(icon: "waveform", title: "Meditate")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // MARK: - Full-Screen Linear Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [.primaryPurple, .mainPink]),
                startPoint: .topLeading,
                endPoint: .topTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 0) {
                    // MARK: - Top Icons View
                    IconsView()
                        .padding(.bottom, SizeMetrics.xlargePadding)
                    
                    // MARK: - Greeting Section View
                    GreetingView(name: "Nazrin")
                        .padding(.bottom, SizeMetrics.largePadding)
                    
                    // MARK: - Mood Selector View
                    MoodSelectorView()
                        .padding(.bottom, SizeMetrics.xlargePadding)
                    
                    // MARK: - Main Content View
                    VStack(spacing: 24) {
                        HorizontalContentSection(
                            title: "Try this",
                            items: [
                                ContentCardModel(title: "Yoga Basic", duration: "25:00", imageName: "yogaImage"),
                                ContentCardModel(title: "Unwind", duration: "15:00", imageName: "yogaasana1")
                            ],
                            onViewAllTapped: {
                                print("Try this View All tapped")
                            }
                        )
                        
                        HorizontalContentSection(
                            title: "Meditate",
                            items: [
                                ContentCardModel(title: "Morning Meditation", duration: "10:00", imageName: "yogaasana2"),
                                ContentCardModel(title: "Guided Relaxation", duration: "19:00", imageName: "yogaasana3")
                            ],
                            onViewAllTapped: {
                                print("Meditate View All tapped")
                            }
                        )
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.white
                            .clipShape(RoundedCorner(radius: 36, corners: [.topLeft, .topRight]))
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }
            }
            .scrollBounce(enabled: false)
            
            // MARK: - Collapsible Tab Bar
            CollapsibleTabBar(
                isCollapsed: $isTabBarCollapsed,
                selectedTab: $selectedTab,
                tabs: tabs
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    DashboardView()
}
