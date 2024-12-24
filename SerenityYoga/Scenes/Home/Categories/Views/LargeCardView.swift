//
//  LargeCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 24.12.24.
//

import SwiftUI

struct LargeCardView: View {
    let item: ContentCardModel
    @State private var isLiked: Bool = false
    @State private var isDownloaded: Bool = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                .cornerRadius(16)
                .clipped()
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                    Text(item.duration)
                        .font(.headline)
                        .foregroundColor(.white)
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
                                .foregroundColor(isDownloaded ? .green : .white)
                        }
                        
                        Button(action: {
                            isLiked.toggle()
                        }) {
                            Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(isLiked ? .purple : .white)
                        }
                    }
                }
                .padding(20)
                Spacer()
                HStack {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Button("Play") {
                        print("\(item.title) Play tapped")
                    }
                    .padding(.horizontal, 34)
                    .padding(.vertical, 6)
                    .background(Color.lavenderBg)
                    .cornerRadius(16)
                    .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            }
            .background(Color.black.opacity(0.2))
            .cornerRadius(16)
        }
    }
}

