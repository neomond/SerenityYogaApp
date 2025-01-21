//
//  MeditationCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 20.01.25.
//

import SwiftUI

struct MeditationCardView: View {
    let image: String
    let title: String
    let description: String
    let meditationsCount: Int
    @State private var isLiked: Bool = false
    
    let destination: () -> MeditationCardDetailView

    var body: some View {
        NavigationLink(destination: destination()) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image(image)
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
                    Text("\(meditationsCount) meditations")
                        .font(.subheadline)
                        .foregroundColor(.primaryPurple)
                    
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
        }
    }
}

#Preview {
    MeditationCardView(
        image: "yogaImage",
        title: "Remember to Breathe",
        description: "Bring awareness back onto the menu. Reconnect with yourself.",
        meditationsCount: 10,
        destination: { MeditationCardDetailView()
        }
    )
}
