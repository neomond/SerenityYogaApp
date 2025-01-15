//
//  FeedbackComponent.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 15.01.25.
//

import SwiftUI

struct FeedbackComponent: View {
    @State private var likes: Int = 85
    @State private var dislikes: Int = 3
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Did you like the article?")
                .font(.headline)
                .foregroundColor(.black)
                .fontWeight(.regular)
            
            HStack(spacing: 20) {
                Button(action: {
                    likes += 1
                }) {
                    Text(" 👍 \(likes)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(width: 80)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Button(action: {
                    dislikes += 1
                }) {
                    Text("👎 \(dislikes)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(width: 80)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.1), Color.clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 2
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color.black.opacity(0.15), radius: 2, x: 0, y: -1)
        )
    }
}

#Preview {
    FeedbackComponent()
}
