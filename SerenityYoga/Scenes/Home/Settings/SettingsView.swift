//
//  SettingsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 08.01.25.
//

import SwiftUI

struct SettingsView: View {
    @State private var isNotificationsEnabled = false
    
    var body: some View {
        NavigationStack {
            CustomNavigationBar(title: "Settings")
            
            // MARK: - Scroll View
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Profile")
                        .font(.headline)
                    
                    VStack(spacing: 8) {
                        NavigationLink(destination: PersonalInformationView()) {
                            SettingsRow(title: "Personal Information")
                        }
                        NavigationLink(destination: ActivityLvlView()) {
                            SettingsRow(title: "Activity level")
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    
                    Text("Notifications")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    NotificationsView(title: "Notifications", isOn: $isNotificationsEnabled)
                    
                    Text("Password")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    NavigationLink(destination: PersonalInformationView()) {
                        SettingsRow(title: "Change Password")
                    }
                    
                    Text("Support")
                        .font(.headline)
                        .padding(.top, 8)
                    NavigationLink(destination: SupportView()){
                        SettingsRow(title: "Contact Us")
                    }
                    
                    Text("About App")
                        .font(.headline)
                        .padding(.top, 8)
                    
                    VStack(spacing: 8) {
                        NavigationLink(destination: AboutAppView()) {
                            SettingsRow(title: "About App")
                        }
                        NavigationLink(destination: PrivacyPolicyView()) {
                            SettingsRow(title: "Privacy Policy")
                        }
                        NavigationLink(destination: AboutAppView()) {
                            SettingsRow(title: "Rate Us")
                        }
                        NavigationLink(destination: AboutAppView()) {
                            SettingsRow(title: "FAQs")
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
    }
}

struct SettingsRow: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
    
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}




