//
//  MoodDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 21.12.24.
//

import SwiftUI

struct MoodDetailView: View {
    let mood: String
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("selectedMood") private var storedMood: String = ""
    
    var body: some View {
        ZStack {
            // MARK: - Gradient Background
            GradientBg(colors: [.mainPink, .primaryPurple])
            
            ScrollView {
                
                // MARK: - Close button
                HStack {
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThin))
                            .frame(width: SizeMetrics.xmediumIcon, height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.white)
                                    .frame(width: SizeMetrics.mediumSpacing, height: SizeMetrics.mediumSpacing)
                            )
                    }
                }
                .padding(.horizontal, SizeMetrics.largePadding)
                .padding(.top, SizeMetrics.largePadding)
                
                VStack(spacing: 0) {
                    // MARK: - Header Section
                    VStack(alignment: .leading) {
                        Text(mood)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, SizeMetrics.smallPadding)
                        Text("Keep busy taking care of your own life if you want to avoid \(mood.lowercased()).")
                            .font(.callout)
                            .foregroundColor(.white.opacity(SizeMetrics.opacityMedium))
                    }
                    .padding(.horizontal, SizeMetrics.mediumPadding)
                    .padding(.bottom, SizeMetrics.xlargeSpacing)
                    
                    // MARK: - Sessions Section
                    VStack(spacing: SizeMetrics.mediumPadding) {
                        ForEach(1...15, id: \.self) { index in
                            SmallCardView(item: ContentCardModel(
                                title: "Session \(index)",
                                duration: .string("\(10 + index * 5) min"),
                                imageName: "yogaasana1"
                            ),
                                          onListenTap: {})
                            .padding(.leading, SizeMetrics.smallPadding)
                            
                            // MARK: - Light Gray Divider
                            Divider()
                                .background(Color.gray.opacity(SizeMetrics.opacityThin))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, SizeMetrics.mediumSpacing)
                    .padding(.top, SizeMetrics.xlargePadding)
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                    )
                }
            }
            .navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            .scrollBounce(enabled: false)
            
        }
    }
}


#Preview {
    MoodDetailView(mood: "Stress")
}
