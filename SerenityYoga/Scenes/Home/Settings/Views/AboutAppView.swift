//
//  AboutAppView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationBar(title: "About Us 🕊️")
                
                ScrollView {
                    VStack(spacing: 20) {
                        // MARK: - App Logo
                        Image(.appLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(color: .primaryPurple.opacity(0.5), radius: 5)
                            .padding(.top, 20)
                        
                        // MARK: - App Description
                        Text("Serenity Yoga is designed to bring mindfulness, health, and balance into your life. With expertly crafted yoga sessions, progress tracking, and personalized plans, Serenity Yoga is your companion on the journey to wellness.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                        
                        // MARK: - Features Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Features")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            FeatureRow(icon: "figure.yoga", title: "Personalized Yoga Plans")
                            FeatureRow(icon: "heart.text.square", title: "Track Your Progress")
                            FeatureRow(icon: "music.note", title: "Relaxing Music and Sounds")
                            FeatureRow(icon: "star", title: "Premium Content for Subscribers")
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer()
                        
                        // MARK: - Footer Section
                        VStack(spacing: 8) {
                            Text("Version 1.0.0")
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
                        .padding(.horizontal, 16)
                        .padding(.top, 20)
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
        HStack(spacing: 12) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(.primaryPurple)
                .padding(8)
                .background(Color.primaryPurple.opacity(0.1))
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
