//
//  BlogCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.01.25.
//

import SwiftUI

struct BlogCardView: View {
    let blog: Blog

    var body: some View {
        NavigationLink(destination: BlogCardDetailView(blog: blog)) {
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(blog.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(blog.quote)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 200)
            .background(
                Group {
                    if let image = blog.image {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, .black.opacity(0.4)]),
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
        blog: Blog(
            title: "Self-love",
            quote: "Bring awareness back onto the menu. \nReconnect with yourself.",
            description: """
            Somewhere in our minds, removed from the day to day, there sits a judge. They watch what we do, study how we perform, examine the effect we have on others, track our successes and failures - and then, eventually, they pass a verdict.
            """,
            image: "yogaImage",
            author: "Nazrin Atayeva"
        )
    )
}

