//
//  SupportView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct SupportView: View {
    @StateObject private var viewModel = SupportViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: SizeMetrics.largeSpacing) {
                CustomNavigationBar(title: "Support 💬")
                
                Text("If you have a special question, please write to us below, you will receive an answer by email.")
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, SizeMetrics.bottomPadding)
                
                // MARK: - Multiline Input
                TextField("Add a comment", text: $viewModel.comment, axis: .vertical)
                    .padding()
                    .lineLimit(7...12)
                    .background(Color.gray.opacity(SizeMetrics.xsopacityThin))
                    .cornerRadius(SizeMetrics.smallRadius)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: SizeMetrics.smallRadius)
                            .stroke(Color.gray.opacity(SizeMetrics.opacityThin), lineWidth: 1)
                    )
                
                AppButton(title: "Save") {
                    viewModel.saveComment()
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
        SupportView()
    }
}
