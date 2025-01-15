//
//  QuoteCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 15.01.25.
//

import SwiftUI

struct QuoteCardView: View {
    let title: String
    let author: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\"\(title)\"")
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .lineLimit(nil)
            
            if let author = author {
                Text(author)
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.coralpeachBg)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}


#Preview {
    QuoteCardView(
        title: "We can’t always change what’s happening around us, but we can change what happens within us.",
        author: "Andy Puddicombe"
    )
}
