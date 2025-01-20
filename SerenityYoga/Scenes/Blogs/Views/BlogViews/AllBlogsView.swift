//
//  AllBlogsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 15.01.25.
//

import SwiftUI

struct AllBlogsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: BlogViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // MARK: - Gradient Background
                GradientBg(colors: [.cornflowerblueBg, .skyblueBg, .blueBg])
                
                VStack(spacing: 0) {
                    // MARK: - Top Icons View
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Circle()
                                .fill(Color.white.opacity(SizeMetrics.opacityThin))
                                .frame(width: SizeMetrics.xmediumIcon,
                                       height: SizeMetrics.xmediumIcon)
                                .overlay(
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                )
                        }
                        Spacer()
                        
                        Text("All Stories 🧡")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                    }
                    .padding(.horizontal, SizeMetrics.largePadding)
                    .padding(.bottom, SizeMetrics.largePadding)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.blogs) { blog in
                                            BlogCardView(blog: blog)
                                        }
                         
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.top, 28)
                    }
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }
                .frame(maxWidth: .infinity)
            }
            .scrollBounce(enabled: false)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AllBlogsView(
        viewModel: BlogViewModel()
    )
}

