//
//  BlogCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.01.25.
//

import SwiftUI

struct BlogCardView: View {
    let image: String?
    let title: String
    let description: String
    let quote: String

    var body: some View {
        NavigationLink(destination: BlogCardDetailView(title: title, quote: quote, description: description, image: image, author: nil)) {
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(quote)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 200)
            .background(
                Group {
                    if let image = image {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    } else {
                        Color.coralpeachBg
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}



#Preview {
    BlogCardView(
        image: "yogaImage",
        title: "Self-love",
        description: "We can’t always change what’s happening around us, but we can change what happens within us.We can’t always change what’s happening around us, but we can change what happens within us.We can’t always change what’s happening around us, but we can change what happens within us.",
        quote: "We can’t always change what’s happening around us, but we can change what happens within us."
    )
}

