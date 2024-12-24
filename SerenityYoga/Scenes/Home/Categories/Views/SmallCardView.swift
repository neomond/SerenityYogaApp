//
//  SmallCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 24.12.24.
//

import SwiftUI

struct SmallCardView: View {
    let item: ContentCardModel
    @State private var isLiked: Bool = false
    @State private var isDownloaded: Bool = false

    var body: some View {
        HStack {
            ZStack(alignment: .topLeading) {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 114, height: 86)
                    .cornerRadius(10)
                
                Text(item.duration)
                    .font(.callout)
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .padding(12)
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Spacer()
                HStack {
                    Button("Listen") {
                        print("Play tapped")
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(16)
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            isDownloaded.toggle()
                            print("Download \(isDownloaded ? "started" : "canceled")")
                        }) {
                            Image(systemName: isDownloaded ? "arrow.down.circle.fill" : "arrow.down.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(isDownloaded ? .green : .black)
                        }

                        Button(action: {
                            isLiked.toggle()
                        }) {
                            Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(isLiked ? .purple : .black)
                        }
                    }
                }
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(12)
    }
}


