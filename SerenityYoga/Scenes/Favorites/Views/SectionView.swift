//
//  SectionView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 30.01.25.
//

import SwiftUI

struct SectionView: View {
    let category: FavoriteCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: SizeMetrics.mediumPadding) {
            HStack {
                Text(category.title)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Spacer()
                
                Text("View All")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, SizeMetrics.smallPadding)
            
            // MARK: - Content List
            VStack(spacing: SizeMetrics.mediumPadding) {
                ForEach(category.items, id: \.title) { item in
                    SmallCardView(item: item, onListenTap: {})
                        .padding(.leading, SizeMetrics.smallPadding)
                    
                    // MARK: - Light Gray Divider
                    Divider()
                        .background(Color.gray.opacity(SizeMetrics.opacityThin))
                }
            }
        }
    }
}
