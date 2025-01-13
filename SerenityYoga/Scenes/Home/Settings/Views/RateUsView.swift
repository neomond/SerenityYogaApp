//
//  RateUsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 10.01.25.
//

import SwiftUI

struct RateUsView: View {
    
    @StateObject private var viewModel = RateUsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: SizeMetrics.largeSpacing) {
                CustomNavigationBar(title: "Rate Us ✨")
                
                if !viewModel.isSubmitted {
                    // MARK: - Title and Description
                    VStack(spacing: SizeMetrics.mediumSpacing) {
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
                    HStack(spacing: SizeMetrics.mediumSpacing) {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= viewModel.rating ? "star.fill" : "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: SizeMetrics.ratingImgSize,
                                       height: SizeMetrics.ratingImgSize)
                                .foregroundColor(index <= viewModel.rating ? .yellow : .lavenderBg)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.rating = index
                                    }
                                }
                        }
                    }
                    
                    // MARK: - Feedback Text Input
                    TextField("Leave a comment...", text: $viewModel.feedback, axis: .vertical)
                        .padding()
                        .lineLimit(3...6)
                        .background(Color.gray.opacity(SizeMetrics.xsopacityThin))
                        .cornerRadius(SizeMetrics.smallRadius)
                        .overlay(
                            RoundedRectangle(cornerRadius: SizeMetrics.smallRadius)
                                .stroke(Color.gray.opacity(SizeMetrics.opacityThin), lineWidth: 1)
                        )
                    
                    // MARK: - Submit Button
                    AppButton(
                        title: "Submit",
                        style: .primary,
                        action: {
                            withAnimation {
                                viewModel.submitFeedback()
                            }
                        }
                    )
                } else {
                    // MARK: - Thank You Message
                    VStack(spacing: SizeMetrics.largeSpacing) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: SizeMetrics.tyImgSize,
                                   height: SizeMetrics.tyImgSize)
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
                                    viewModel.resetFeedback()
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
