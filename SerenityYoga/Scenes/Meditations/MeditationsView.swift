//
//  MeditationsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 20.01.25.
//

import SwiftUI

struct MeditationsView: View {
    @State private var showProfileView: Bool = false
    @StateObject var viewModel = MeditationViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // MARK: - Gradient Background
                GradientBg(colors: [.mainPink, .primaryPurple])
                
                VStack(spacing: 0) {
                    // MARK: - Top Icons View
                    IconsView(
                        onProfileTapped: { showProfileView = true }, onFavoritesTapped: {},
                        label: "Meditation 🧘‍♀️"
                    )
                    .padding(.bottom, SizeMetrics.largePadding)
                    
                    ScrollView {  
                            // MARK: - Meditation Collections
                            VStack(spacing: 24) {
                                ForEach(viewModel.meditations, id: \.id) { meditate in
                                    MeditationCardView(
                                        meditate: meditate,
                                        destination: {
                                            MeditationCardDetailView(meditate: meditate)
                                        }
                                    )
                                }
                            }
                        
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 32)
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }
                .frame(maxWidth: .infinity)
            }
            
            .scrollBounce(enabled: false)
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            .edgesIgnoringSafeArea(.bottom)
            
            
            // MARK: - Navigation to ProfileView
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
        }
    }
}

#Preview {
    MeditationsView(viewModel: MeditationViewModel.mock)
        .environmentObject(AudioManager())
}
