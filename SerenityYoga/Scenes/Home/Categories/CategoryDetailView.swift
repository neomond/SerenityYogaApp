//
//  CategoryDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 23.12.24.
//

import SwiftUI

struct CategoryDetailView: View {
    let title: String
    let items: [ContentCardModel]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Gradient Background
                GradientBg(colors: [.mainPink, .primaryPurple])
                
                
                // MARK: - Content
                VStack(spacing: 0) {
                    // MARK: - Header
                    HeaderView(title: "\(title) ✨") {
                        dismiss()
                    }
                    .padding(.bottom, SizeMetrics.verticalPadding)
                    
                    ScrollView{
                        VStack(spacing: SizeMetrics.mediumPadding) {
                            if let firstItem = items.first {
                                LargeCardView(item: firstItem)
                                    .padding(.bottom, SizeMetrics.mediumSpacing)
                            }
                            ForEach(items.dropFirst(), id: \.id) { item in
                                SmallCardView(item: item, onListenTap: {})
                                // MARK: - Light Gray Divider
                                Divider()
                                    .background(Color.gray.opacity(SizeMetrics.opacityThin))
                            }
                            Spacer()
                        }
                        .padding(.horizontal, SizeMetrics.largePadding)
                    }
                    .padding(.vertical, 32)
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }
                .scrollBounce(enabled: false)
                .scrollIndicators(ScrollIndicatorVisibility.hidden)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CategoryDetailView(
        title: "Try this",
        items: [
            ContentCardModel(title: "Yoga Basic", duration: .string("25:00"), imageName: "yogaImage"),
            ContentCardModel(title: "Morning Meditation", duration: .string("10:00"), imageName: "yogaasana1"),
            ContentCardModel(title: "Unwind after work", duration: .string("10:00"), imageName: "yogaasana2"),
            ContentCardModel(title: "Morning Yoga", duration: .string("10:00"), imageName: "yogaasana3"),
            ContentCardModel(title: "Morning Yoga", duration: .string("10:00"), imageName: "yogaasana3")
        ]
    )
}
