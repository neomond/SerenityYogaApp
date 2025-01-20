//
//  MeditationsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 20.01.25.
//

import SwiftUI

struct MeditationsView: View {
    @State private var showProfileView: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // MARK: - Gradient Background
                GradientBg(colors: [.mainPink, .primaryPurple])
                
                VStack(spacing: 0) {
                    // MARK: - Top Icons View
                    IconsView(
                        onProfileTapped: { showProfileView = true },
                        label: "Meditation 🧘‍♀️"
                    )
                    .padding(.bottom, SizeMetrics.largePadding)
                    
                    ScrollView {  
                            // MARK: - Meditation Collections
                            VStack(spacing: 24) {
                                MeditationCardView(
                                        image: "yogaImage",
                                        title: "Remember to Breathe",
                                        description: "Bring awareness back onto the menu. Reconnect with yourself.",
                                        meditationsCount: 10
                                    )
                                
                                MeditationCardView(
                                        image: "yogaasana1",
                                        title: "Remember to Breathe",
                                        description: "Bring awareness back onto the menu. Reconnect with yourself.",
                                        meditationsCount: 10
                                    )
                                
                                MeditationCardView(
                                        image: "yogaasana2",
                                        title: "Remember to Breathe",
                                        description: "Bring awareness back onto the menu. Reconnect with yourself.",
                                        meditationsCount: 10
                                    )
                            }
                        
                        .padding(.vertical, 38)
                        .frame(maxWidth: .infinity)
                    }
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
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
    MeditationsView()
}
