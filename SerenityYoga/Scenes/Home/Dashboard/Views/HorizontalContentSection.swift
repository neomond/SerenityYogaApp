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
        VStack(alignment: .leading, spacing: SizeMetrics.mediumPadding) {
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
            .padding(.horizontal, SizeMetrics.mediumPadding)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: SizeMetrics.mediumPadding) {
                    ForEach(items, id: \.id) { item in
                        ContentCardView(item: item)
                    }
                }
                .padding(.horizontal, SizeMetrics.mediumPadding)
            }
        }
    }
}



#Preview {
    HorizontalContentSection(
        title: "Try this",
        items: [
            ContentCardModel(title: "Yoga Basic", duration: .string("10:00"), imageName: "yogaImage"),
            ContentCardModel(title: "Unwind", duration: .string("10:00"), imageName: "yogaImage")
        ],
        onViewAllTapped: {
            print("View All tapped")
        }
    )
}
