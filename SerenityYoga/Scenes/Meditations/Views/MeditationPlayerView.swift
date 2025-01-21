//
//  MeditationPlayerView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 21.01.25.
//

import SwiftUI

struct MeditationPlayerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isLiked: Bool = false
    
    var body: some View {
      
        VStack(alignment: .leading, spacing: 20) {
            ZStack(alignment: .top) {
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
                    
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThin))
                            .frame(width: SizeMetrics.xmediumIcon,
                                   height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .font(.system(size: SizeMetrics.extraSmallIcon))
                                    .foregroundColor(isLiked ? .primaryPurple : .white)
                            )
                    }
                }
                .padding(.vertical, 40)
                .padding(.horizontal)
            }
            .background(.purple)
        }
            .edgesIgnoringSafeArea(.vertical)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MeditationPlayerView()
}
