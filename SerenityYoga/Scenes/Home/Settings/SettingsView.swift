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
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Profile")
                    .font(.headline)
                    .padding(.top)
                
                VStack(spacing: 8) {
                    NavigationLink(destination: PersonalInformationView()) {
                        SettingsRow(title: "Personal Information")
                    }
                    NavigationLink(destination: ActivityLevellView()) {
                        SettingsRow(title: "Activity level")
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                
                Text("Notifications")
                    .font(.headline)
                    .padding(.top, 8)
                
                SettingsRowWithToggle(title: "Notifications", isOn: $isNotificationsEnabled)
                
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
                    NavigationLink(destination: AboutAppView()) {
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
            .padding(.horizontal)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .customBackButton(color: .black)
        }
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

struct SettingsRowWithToggle: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(.primaryPurple)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct PersonalInformationView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text("Personal Information Details")
            .navigationTitle("Personal Information")
            .customBackButton(color: .black)
    }
}

struct ActivityLevellView: View {
    var body: some View {
        Text("Activity Level Details")
            .navigationTitle("Activity Level")
    }
}

struct SupportView: View {
    var body: some View {
        Text("Contact us Details")
            .navigationTitle("Support")
    }
}

struct AboutAppView: View {
    var body: some View {
        Text("About App Details")
            .navigationTitle("About App")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}




