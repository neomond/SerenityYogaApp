//
//  AboutAppView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct AboutAppView: View {
    @StateObject var viewModel = AboutAppViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(title: "About Us 🕊️")
                
                ScrollView {
                    VStack(spacing: SizeMetrics.xlargeSpacing) {
                        // MARK: - App Logo
                        Image(.appLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: SizeMetrics.xmediumImgSize,
                                   height: SizeMetrics.xmediumImgSize)
                            .clipShape(Circle())
                            .shadow(color: .primaryPurple.opacity(SizeMetrics.opacityThinSecond),
                                    radius: SizeMetrics.smallRadius)
                            .padding(.top, SizeMetrics.largePadding)
                        
                        // MARK: - App Description
                        Text("Serenity Yoga is designed to bring mindfulness, health, and balance into your life. With expertly crafted yoga sessions, progress tracking, and personalized plans, Serenity Yoga is your companion on the journey to wellness.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, SizeMetrics.mediumPadding)
                        
                        // MARK: - Features Section
                        VStack(alignment: .leading,
                               spacing: SizeMetrics.mediumSpacing) {
                            Text("Features")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            ForEach(viewModel.features, id: \.title) { feature in
                                FeatureRow(icon: feature.icon, title: feature.title)
                            }
                        }
                               .padding(.horizontal, SizeMetrics.mediumPadding)
                        
                        Spacer()
                        
                        // MARK: - Footer Section
                        VStack(spacing: SizeMetrics.smallSpacing) {
                            Text("Version \(viewModel.appVersion)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Text("Privacy Policy")
                                    .font(.footnote)
                                    .foregroundColor(.primaryPurple)
                                    .onTapGesture {
                                    }
                                
                                Spacer()
                                
                                Text("Terms of Service")
                                    .font(.footnote)
                                    .foregroundColor(.primaryPurple)
                                    .onTapGesture {
                                    }
                            }
                        }
                        .padding(.horizontal, SizeMetrics.mediumPadding)
                        .padding(.top, SizeMetrics.largePadding)
                    }
                }
                .scrollBounce(enabled: false)
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

struct FeatureRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: SizeMetrics.mediumSpacing) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: SizeMetrics.xlargeSpacing,
                       height: SizeMetrics.xlargeSpacing)
                .foregroundColor(.primaryPurple)
                .padding(SizeMetrics.smallPadding)
                .background(Color.primaryPurple.opacity(SizeMetrics.xsopacityThin))
                .clipShape(Circle())
            
            Text(title)
                .font(.body)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    AboutAppView()
}
