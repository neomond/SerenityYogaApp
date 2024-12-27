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
                .frame(maxWidth: .infinity,
                       minHeight: SizeMetrics.mediumImgSize,
                       maxHeight: SizeMetrics.mediumImgSize)
                .cornerRadius(SizeMetrics.mediumPlusRadius)
                .clipped()
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: SizeMetrics.extraSmallIcon,
                               height: SizeMetrics.extraSmallIcon)
                    Text(item.duration)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    
                    HStack(spacing: SizeMetrics.mediumPadding) {
                        Button(action: {
                            isDownloaded.toggle()
                            print("Download \(isDownloaded ? "started" : "canceled")")
                        }) {
                            Image(systemName: isDownloaded ? "arrow.down.circle.fill" : "arrow.down.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: SizeMetrics.extraSmallIcon,
                                       height: SizeMetrics.extraSmallIcon)
                                .foregroundColor(isDownloaded ? .green : .white)
                        }
                        
                        Button(action: {
                            isLiked.toggle()
                        }) {
                            Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: SizeMetrics.extraSmallIcon,
                                       height: SizeMetrics.extraSmallIcon)
                                .foregroundColor(isLiked ? .purple : .white)
                        }
                    }
                }
                .padding(SizeMetrics.largePadding)
                Spacer()
                HStack {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Button("Play") {
                        print("\(item.title) Play tapped")
                    }
                    .padding(.horizontal, SizeMetrics.xlargePadding)
                    .padding(.vertical, SizeMetrics.smallPadding)
                    .background(Color.lavenderBg)
                    .cornerRadius(SizeMetrics.mediumPlusRadius)
                    .foregroundColor(.black)
                }
                .padding(.horizontal, SizeMetrics.mediumPadding)
                .padding(.bottom, SizeMetrics.mediumSpacing)
            }
            .background(Color.black.opacity(SizeMetrics.opacityThin))
            .cornerRadius(SizeMetrics.mediumPlusRadius)
        }
    }
}

