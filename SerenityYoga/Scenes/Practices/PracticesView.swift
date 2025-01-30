//
//  PracticesView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 28.01.25.
//

import SwiftUI

struct PracticesView: View {
    @State private var showProfileView: Bool = false
    @StateObject var viewModel = PracticesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // MARK: - Gradient Background
                GradientBg(colors: [.mangoBg, .peachBg, .yellowprimaryBg])
                
                VStack(spacing: 0){
                    // MARK: - Top Icons View
                    IconsView(onProfileTapped: { showProfileView = true },
                              label: "Practices 🌟")
                    .padding(.bottom, SizeMetrics.largePadding)
                    
                    ScrollView {
                        // MARK: Practices Collections
                        VStack(spacing: 24) {
                            ForEach(viewModel.practices, id: \.id){ practice in
                                PracticesCardView(
                                    practice: practice,
                                    destination: {
                                        PracticeCardDetailView(practice: practice)
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
            }
            
            .scrollBounce(enabled: false)
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            .edgesIgnoringSafeArea(.bottom)
            
            // MARK: Navigation to ProfileView
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
        }
    }
}

#Preview {
    PracticesView(viewModel: PracticesViewModel.mock)
}
