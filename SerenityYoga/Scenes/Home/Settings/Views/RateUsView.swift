//
//  RateUsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.01.25.
//

import SwiftUI

struct RateUsView: View {
    @State private var rating: Int = 0
    @State private var feedback: String = ""
    @State private var isSubmitted: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                CustomNavigationBar(title: "Rate Us ✨")
                
                if !isSubmitted {
                    // MARK: - Title and Description
                    VStack(spacing: 12) {
                        Text("We value your feedback!")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        Text("Tap on the stars to rate our app and share your thoughts.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    
                    // MARK: - Star Rating
                    HStack(spacing: 12) {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .foregroundColor(index <= rating ? .yellow : .lavenderBg)
                                .onTapGesture {
                                    withAnimation {
                                        rating = index
                                    }
                                }
                        }
                    }
                    
                    // MARK: - Feedback Text Input
                    TextField("Leave a comment...", text: $feedback, axis: .vertical)
                        .padding()
                        .lineLimit(3...6)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    
                    // MARK: - Submit Button
                    AppButton(
                        title: "Submit",
                        style: .primary,
                        action: {
                            withAnimation {
                                isSubmitted = true
                            }
                        }
                    )
                } else {
                    // MARK: - Thank You Message
                    VStack(spacing: 20) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.primaryPurple)
                        
                        Text("Thank you for your feedback!")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        Text("We appreciate your time and effort to help us improve.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        AppButton(
                            title: "Rate Again",
                            style: .secondary,
                            action: {
                                withAnimation {
                                    isSubmitted = false
                                    rating = 0
                                    feedback = ""
                                }
                            }
                        )
                    }
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
        RateUsView()
    }
}
