//
//  PracticesCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 28.01.25.
//

import SwiftUI

struct PracticesCardView: View {
    let viewModel: PracticesViewModel
    let practice: Practice
    
    @ObservedObject var favoritesViewModel: FavoritesViewModel

    @State private var isLiked: Bool = false
    
    var body: some View {
        NavigationLink(
            destination:  PracticeCardDetailView(viewModel: viewModel)
            ){
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image(practice.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 190)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [.clear, .black.opacity(0.4)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .clipped()
                    
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThin))
                            .frame(width: SizeMetrics.xmediumIcon,
                                   height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .font(.system(size: SizeMetrics.extraSmallIcon))
                                    .foregroundColor(isLiked ? .primaryPurple : .white)
                            )
                    }
                    .padding()
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("\(practice.sessions.count) practices")
                        .font(.subheadline)
                        .foregroundColor(.primaryPurple)
                    
                    Text(practice.title)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(practice.description)
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    let mockPractices = Practice(
        title: "Morning yoga",
        description: "Learn how to bring your best self forward in more moments of your life",
        duration: 1500,
        image: "yogaasana1",
        sessions: [
            Session(
                title: "Sun Salutation",
                duration: "10 min",
                imageName: "yogaasana1",
                description: "Learn how to bring your best self forward in more moments of your life",
                videoURL: "https://www.youtube.com/watch?v=abcd1234"
            )
        ]
    )
    let viewModel = PracticesViewModel(practices: [mockPractices])
    let favoritesViewModel = FavoritesViewModel()
    
    viewModel.selectedPractice = mockPractices
    
    return NavigationView {
        PracticesCardView(
            viewModel:          viewModel,
            practice:           mockPractices,
            favoritesViewModel: favoritesViewModel
        )
    }
}
