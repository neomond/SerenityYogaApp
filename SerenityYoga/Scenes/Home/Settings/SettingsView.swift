//
//  SettingsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 08.01.25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            CustomNavigationBar(title: "Settings ⚙️")
            
            // MARK: - Scroll View
            ScrollView {
                VStack(alignment: .leading, spacing: SizeMetrics.mediumPadding) {
                    Text("Profile")
                        .font(.headline)
                    
                    VStack(spacing: SizeMetrics.smallPadding) {
                        NavigationLink(destination: PersonalInfoView()) {
                            SettingsRow(title: "Personal Information")
                        }
                        NavigationLink(destination: ChangeActivityLevelView(viewModel: viewModel.activityLevelViewModel)) {
                            SettingsRow(title: "Activity level")
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(SizeMetrics.smallPadding)
                    
                    Text("Notifications")
                        .font(.headline)
                        .padding(.top, SizeMetrics.smallPadding)
                    
                    NotificationsView(title: "Notifications", isOn: $viewModel.isNotificationsEnabled)
                    
                    Text("Password")
                        .font(.headline)
                        .padding(.top, SizeMetrics.smallPadding)
                    
                    NavigationLink(
                        destination: ChangePwdView(
                            newPassword: $viewModel.newPassword,
                            confirmPassword: $viewModel.confirmPassword
                        )
                    ) {
                        SettingsRow(title: "Change Password")
                    }
                    
                    Text("Support")
                        .font(.headline)
                        .padding(.top, SizeMetrics.smallPadding)
                    NavigationLink(destination: SupportView()){
                        SettingsRow(title: "Contact Us")
                    }
                    
                    Text("About App")
                        .font(.headline)
                        .padding(.top, SizeMetrics.smallPadding)
                    
                    VStack(spacing: SizeMetrics.smallPadding) {
                        NavigationLink(destination: AboutAppView()) {
                            SettingsRow(title: "About App")
                        }
                        NavigationLink(destination: PrivacyPolicyView()) {
                            SettingsRow(title: "Privacy Policy")
                        }
                        NavigationLink(destination: RateUsView()) {
                            SettingsRow(title: "Rate Us")
                        }
                        NavigationLink(destination: FAQs()) {
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
        .background(Color.gray.opacity(SizeMetrics.xsopacityThin))
        .cornerRadius(SizeMetrics.smallRadius)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}




