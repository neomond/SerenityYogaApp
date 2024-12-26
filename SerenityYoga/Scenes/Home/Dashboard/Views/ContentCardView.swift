//
//  ContentCardView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 25.12.24.
//

import SwiftUI

struct ContentCardModel: Identifiable {
    let id = UUID()
    let title: String
    let duration: String
    let imageName: String
}

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
                    Color.gray.opacity(0.09)
                        .cornerRadius(SizeMetrics.mediumSpacing)
                )
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: SizeMetrics.xxSmallIcon, height: SizeMetrics.xxSmallIcon)
                    Text(item.duration)
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
        duration: "25:00",
        imageName: "yogaasana3"))
    .previewLayout(.sizeThatFits)
    .padding()
}
