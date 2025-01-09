//
//  SupportView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct SupportView: View {
    @State var comment: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                CustomNavigationBar(title: "Support")
                
                Text("If you have a special question, please write to us below, you will receive an answer by email.")
                    .font(.body)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 14)
                
                // MARK: - Multiline Input
                TextField("Add a comment", text: $comment, axis: .vertical)
                    .padding()
                    .lineLimit(7...12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                
                AppButton(title: "Save") {
                    print("Saved!")
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
