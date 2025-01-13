//
//  PersonalInformationView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct PersonalInfoView: View {
    @State private var viewModel = PersonalInfoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: SizeMetrics.mediumPadding) {
                CustomNavigationBar(title: "Personal Information")
                
                VStack(spacing: SizeMetrics.mediumSpacing) {
                    InputFieldWithIcon(placeholder: "", text: $viewModel.email, icon: "pencil")
                    
                    InputFieldWithIcon(placeholder: "", text: $viewModel.name, icon: "pencil")
                    
                    InputFieldWithIcon(placeholder: "", text: $viewModel.age, icon: "pencil")
                    
                    InputFieldWithIcon(placeholder: "", text: $viewModel.weight, icon: "pencil")
                    
                    AppButton(title: "Save") {
                        viewModel.savePersonalInfo()
                    }
                    .padding(.top, SizeMetrics.largePadding)
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
        PersonalInfoView()
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
        .background(Color.gray.opacity(SizeMetrics.xsopacityThin))
        .cornerRadius(SizeMetrics.mediumRadius)
    }
}
