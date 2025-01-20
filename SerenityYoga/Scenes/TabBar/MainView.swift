//
//  MainView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 23.12.24.
//

import SwiftUI

struct MainView: View {
    @State private var isTabBarCollapsed = false
    @State private var selectedTab: Int = 0
    @State private var selectedMood: MoodItem?

    let tabs = [
        TabItem(icon: "house", title: "Home"),
        TabItem(icon: "bubbles.and.sparkles", title: "Practice"),
        TabItem(icon: "book.pages", title: "Stories"),
        TabItem(icon: "waveform", title: "Meditate")
    ]

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                // MARK: - Content Based on Selected Tab
                Group {
                    switch selectedTab {
                    case 0:
                        DashboardView()
                    case 1:
                        DashboardView()
                    case 2:
                        BlogPageView()
                    case 3:
                        MeditationsView()
                    default:
                        Text("Invalid Tab")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)

                // MARK: - Collapsible Tab Bar
                CollapsibleTabBar(
                    isCollapsed: $isTabBarCollapsed,
                    selectedTab: $selectedTab,
                    tabs: tabs
                )
            }
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    MainView()
}

