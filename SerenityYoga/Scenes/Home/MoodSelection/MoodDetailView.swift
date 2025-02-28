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
    
    @StateObject private var moodViewModel = MoodViewModel()
    @AppStorage("selectedMood") private var storedMood: String = ""
    
    var body: some View {
        NavigationStack { 
            ZStack(alignment: .top) {
            // MARK: - Gradient Background
            GradientBg(colors: [.mainPink, .primaryPurple])
            
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
                
                VStack(spacing: 0) {
                    // MARK: - Header Section
                    VStack(alignment: .leading) {
                        Text("\(mood) \(moodViewModel.getMoodIcon(for: mood))")
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
                    .padding(.top, SizeMetrics.extraLargeSpacing)
                    
                    ScrollView {
                        // MARK: - Sessions Section
                        LazyVStack(spacing: SizeMetrics.mediumPadding) {
                            ForEach(moodViewModel.moodSessions, id: \.title) { session in
                                SmallCardView(item: session, onListenTap: {})
                                    .padding(.leading, SizeMetrics.smallPadding)
                                
                                Divider()
                                .background(Color.gray.opacity(SizeMetrics.opacityThin))                        }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, SizeMetrics.mediumSpacing)
                        .padding(.top, SizeMetrics.xlargePadding)
                    }
                    .background(
                        Color.white
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                            .edgesIgnoringSafeArea(.bottom)
                    )
                }
            
            .edgesIgnoringSafeArea(.bottom)
            .scrollBounce(enabled: false)
            .onAppear {
                moodViewModel.fetchSessions(for: mood)
            }
            .navigationBarBackButtonHidden(true)
        }
            .frame(maxWidth: .infinity)
        }
    }
}


#Preview {
    MoodDetailView(mood: "Stress")
}
