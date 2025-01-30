//
//  ContentCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 25.12.24.
//

import SwiftUI

struct ContentCardView: View {
    let item: ContentCardModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 270, height: 160)
                .cornerRadius(SizeMetrics.mediumSpacing)
                .clipped()
                .overlay(
                    Color.gray.opacity(SizeMetrics.xsopacityThin)
                        .cornerRadius(SizeMetrics.mediumSpacing)
                )
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: SizeMetrics.xxSmallIcon, height: SizeMetrics.xxSmallIcon)
                    Text(item.duration.formatted)
                        .font(SizeMetrics.Fonts.subtitle)
                    .foregroundColor(.white)}
                .fontWeight(.medium)
                
                Spacer()
                
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(SizeMetrics.smallPadding)
                    .background(Color.gray.opacity(SizeMetrics.opacityThin))
                    .cornerRadius(SizeMetrics.smallPadding)
                    .bold()
            }
            .padding(SizeMetrics.mediumSpacing)
        }
        .frame(width: 270, height: 160)
        .background(Color.gray.opacity(SizeMetrics.opacityThin))
        .cornerRadius(SizeMetrics.mediumSpacing)
    }
}

#Preview {
    ContentCardView(item: ContentCardModel(
        title: "Yoga Basic",
        duration: .time(600),
        imageName: "yogaasana3"))
    .previewLayout(.sizeThatFits)
    .padding()
}
