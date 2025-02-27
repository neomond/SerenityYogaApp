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
    @State private var showFavoritesView: Bool = false
    
    @StateObject var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                // MARK: - Gradient Background
                GradientBg(colors: [.primaryPurple, .mainPink])
                
                ScrollView {
                    VStack(spacing: 0) {
                        // MARK: - Top Icons View
                        IconsView( onProfileTapped:
                                    { showProfileView = true },
                                   onFavoritesTapped:
                                    { showFavoritesView = true },
                                   label: nil)
                        .padding(.bottom, SizeMetrics.xlargePadding)
                        
                        // MARK: - Greeting Section View
                        GreetingView(name: "Nazrin")
                            .padding(.bottom, SizeMetrics.largePadding)
                        
                        // MARK: - Mood Selector View
                        MoodSelectorView { moodString in
                            print("Selected Mood in Dashboard: \(moodString)")
                            viewModel.selectMood(moodString)
                        }
                        .padding(.bottom, SizeMetrics.xlargePadding)
                        
                        // MARK: - Main Content View
                        VStack(spacing: SizeMetrics.xlargeSpacing) {
                            ForEach(viewModel.fetchSections()) { section in
                                HorizontalContentSection(
                                    title: section.title,
                                    items: section.items,
                                    onViewAllTapped: {
                                        viewModel.selectCategory(section)
                                    }
                                )
                            }
                        }
                        .padding(.top, SizeMetrics.xlargePadding)
                        .padding(.bottom, SizeMetrics.mediumPadding)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.white
                                .cornerRadius(40, corners: [.topLeft, .topRight])
                                .edgesIgnoringSafeArea(.bottom)
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .scrollBounce(enabled: false)
                }
                
                // MARK: - Space for Collapsible Tab Bar
                HStack {}
                    .frame(height: SizeMetrics.tabBarHeight)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
            }
            .edgesIgnoringSafeArea(.bottom)
           
            // MARK: - Navigation to ProfileView
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
            
            // MARK: - Navigation to Favorites
            .navigationDestination(isPresented: $showFavoritesView) {
                FavoritesView(favoritesViewModel: viewModel.favoritesViewModel)
            }
            
            // MARK: - Navigation to Categories
            .navigationDestination(isPresented: $viewModel.showCategoryDetail) {
                if let selectedCategory = viewModel.selectedCategory {
                    CategoryDetailView(title: selectedCategory.title, items: selectedCategory.items)
                }
            }
            
            // MARK: - Navigation to MoodDetailView
            .navigationDestination(isPresented: $viewModel.showMoodDetail) {
                if let selectedMood = viewModel.selectedMood {
                    MoodDetailView(mood: selectedMood.mood)
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}
