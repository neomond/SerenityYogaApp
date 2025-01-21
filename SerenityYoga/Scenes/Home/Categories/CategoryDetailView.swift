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
                ScrollView {
                    VStack(spacing: 0) {
                        // MARK: - Header
                        HeaderView(title: "\(title) ✨") {
                            dismiss()
                        }
                        .padding(.bottom, SizeMetrics.verticalPadding)
                        
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
                        .padding(.top, SizeMetrics.xlargePadding)
                        
                        .background(
                            Color.white
                                .cornerRadius(40, corners: [.topLeft, .topRight])
                                .edgesIgnoringSafeArea(.bottom)
                        )
                    }
                    
                    .scrollBounce(enabled: false)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    CategoryDetailView(
        title: "Try this",
        items: [
            ContentCardModel(title: "Yoga Basic", duration: "25:00", imageName: "yogaImage"),
            ContentCardModel(title: "Morning Meditation", duration: "10:00", imageName: "yogaasana1"),
            ContentCardModel(title: "Unwind after work", duration: "15:30", imageName: "yogaasana2"),
            ContentCardModel(title: "Morning Yoga", duration: "25:00", imageName: "yogaasana3"),
            ContentCardModel(title: "Morning Yoga", duration: "25:00", imageName: "yogaasana3")
        ]
    )
}
