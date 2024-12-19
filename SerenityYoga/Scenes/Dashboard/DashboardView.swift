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
                VStack {
                    
                    // MARK: - Icons View
                    IconsView()
                                        
                    // MARK: - Greeting Section
                    GreetingView(name: "Nazrin")
                    
                    // MARK: - Main Content Section
                    VStack {
                        Text("White Content Area")
                            .frame(maxWidth: .infinity, minHeight: 600) 
                            .background(Color.white)
                            .padding(.horizontal)
                            .background(Color.white)
                            .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                            .edgesIgnoringSafeArea(.bottom)
                            .shadow(radius: 5)
                    }
                }
            }

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
