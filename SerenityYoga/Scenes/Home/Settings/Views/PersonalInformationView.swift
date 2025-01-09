//
//  PersonalInformationView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct PersonalInformationView: View {
    @State private var email: String = "nazrinatayeva@example.com"
    @State private var name: String = "Nazrin"
    @State private var age: String = "24"
    @State private var weight: String = "55kg"
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                CustomNavigationBar(title: "Personal Information")
                
                VStack(spacing: 12) {
                    InputFieldWithIcon(placeholder: "", text: $email, icon: "pencil")
                    
                    InputFieldWithIcon(placeholder: "", text: $name, icon: "pencil")
                    
                    InputFieldWithIcon(placeholder: "", text: $age, icon: "pencil")
                    
                    InputFieldWithIcon(placeholder: "", text: $weight, icon: "pencil")
                    
                    AppButton(title: "Save") {
                        print("Saved!")
                    }
                    .padding(.top, 20)
                }
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NavigationStack {
        PersonalInformationView()
    }
}

// MARK: - Custom Input Field with Icon
struct InputFieldWithIcon: View {
    var placeholder: String
    @Binding var text: String
    var icon: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .foregroundColor(.primary)
            
            Image(systemName: icon)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
