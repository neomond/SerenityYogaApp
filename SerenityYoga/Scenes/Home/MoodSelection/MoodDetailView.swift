//
//  MoodDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 21.12.24.
//

import SwiftUI

struct MoodItem: Identifiable {
    let id = UUID()
    let mood: String
}

struct MoodDetailView: View {
    let mood: String
    @Environment(\.dismiss) var dismiss
    
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
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 45, height: 45)
                            .overlay(
                                Image(systemName: "xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.white)
                                    .frame(width: 12, height: 12)
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack(spacing: 0) {
                    // MARK: - Header Section
                    VStack(alignment: .leading) {
                        Text(mood)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        Text("Keep busy taking care of your own life if you want to avoid \(mood.lowercased()).")
                            .font(.callout)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 26)
                    
                    // MARK: - Sessions Section
                    VStack(spacing: 16) {
                        ForEach(1...15, id: \.self) { index in
                            SmallCardView(item: ContentCardModel(
                                title: "Session \(index)",
                                duration: "\(10 + index * 5) min",
                                imageName: "yogaasana1"
                            ))
                            .padding(.leading, 10)
                            
                            // MARK: - Light Gray Divider
                            Divider()
                                .background(Color.gray.opacity(0.3))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 20)
                    .background(
                        Color.white
                            .clipShape(RoundedCorner(radius: 36, corners: [.topLeft, .topRight]))
                    )
                }
                
            }.scrollBounce(enabled: false)
            
        }
        // MARK: - Space for Bottom part
        //        HStack{}
        //        .frame(minHeight: 85)
        //        .frame(maxWidth: .infinity)
        //        .background(Color.white)
    }
}


#Preview {
    MoodDetailView(mood: "Stress")
}
