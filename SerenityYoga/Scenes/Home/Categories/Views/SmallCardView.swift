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
    
    let onListenTap: () -> Void

    var body: some View {
        HStack {
            ZStack(alignment: .topLeading) {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 114, height: 86)
                    .cornerRadius(SizeMetrics.mediumRadius)
                
                Text(item.duration)
                    .font(.callout)
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .padding(SizeMetrics.mediumSpacing)
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Spacer()
                HStack {
                    Button("Listen") {
                        onListenTap()
                        print("Play tapped")
                    }
                    .padding(.horizontal, SizeMetrics.xlargeSpacing)
                    .padding(.vertical, SizeMetrics.xsverticalPadding)
                    .background(Color.gray.opacity(SizeMetrics.opacityThin))
                    .cornerRadius(SizeMetrics.mediumPlusRadius)
                    .foregroundColor(.black)
                    
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
                                .foregroundColor(isDownloaded ? .green : .black)
                        }

                        Button(action: {
                            isLiked.toggle()
                        }) {
                            Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: SizeMetrics.extraSmallIcon,
                                       height: SizeMetrics.extraSmallIcon)
                                .foregroundColor(isLiked ? .purple : .black)
                        }
                    }
                }
            }
            .padding(.leading, SizeMetrics.smallPadding)
            
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(SizeMetrics.mediumSpacing)
    }
}


