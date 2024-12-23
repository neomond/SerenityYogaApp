//
//  HorizontalContentSection.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 20.12.24.
//

import SwiftUI

struct HorizontalContentSection: View {
    let title: String
    let items: [ContentCardModel]
    let onViewAllTapped: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(title)
                    .font(.title2)
                    .foregroundColor(.black)
                Spacer()
                NavigationLink(destination: CategoryDetailView(title: title, items: items)) {
                    Text("View All")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(items, id: \.id) { item in
                        ContentCardView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

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
                .cornerRadius(12)
                .clipped()
                .overlay(
                    Color.gray.opacity(0.09)
                        .cornerRadius(12)
                )

            VStack(alignment: .leading) {
                Text(item.duration)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                Spacer()
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .bold()
            }
            .padding(12)
        }
        .frame(width: 270, height: 160)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}



#Preview {
    HorizontalContentSection(
        title: "Try this",
        items: [
            ContentCardModel(title: "Yoga Basic", duration: "25:00", imageName: "yogaImage"),
            ContentCardModel(title: "Unwind", duration: "15:00", imageName: "yogaImage")
        ],
        onViewAllTapped: {
            print("View All tapped")
        }
    )
}
