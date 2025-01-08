//
//  DashboardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedMood: MoodItem?
    @State private var showProfileView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                // MARK: - Gradient Background
                GradientBg(colors: [.primaryPurple, .mainPink])
                
                ScrollView {
                    VStack(spacing: 0) {
                        // MARK: - Top Icons View
                        IconsView { showProfileView = true }
                        .padding(.bottom, SizeMetrics.xlargePadding)
                        
                        // MARK: - Greeting Section View
                        GreetingView(name: "Nazrin")
                            .padding(.bottom, SizeMetrics.largePadding)
                        
                        // MARK: - Mood Selector View
                        MoodSelectorView { mood in
                            selectedMood = MoodItem(mood: mood)
                        }
                        .padding(.bottom, SizeMetrics.xlargePadding)
                        
                        // MARK: - Main Content View
                        VStack(spacing: SizeMetrics.xlargeSpacing) {
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
                        .padding(.top, SizeMetrics.xlargePadding)
                        .padding(.bottom, SizeMetrics.mediumPadding)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.white
                                .clipShape(RoundedCorner(radius: SizeMetrics.xlargeRadius, corners: [.topLeft, .topRight]))
                                .edgesIgnoringSafeArea(.bottom)
                        )
                    }
                }
                .scrollBounce(enabled: false)
                
                // MARK: - Space for Collapsible Tab Bar
                HStack {}
                    .frame(height: SizeMetrics.tabBarHeight)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
            }
            .edgesIgnoringSafeArea(.bottom)
            .sheet(item: $selectedMood) { moodItem in
                MoodDetailView(mood: moodItem.mood)
            }
            
            // MARK: - Navigation to ProfileView
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
        }
    }
}



#Preview {
    DashboardView()
}
