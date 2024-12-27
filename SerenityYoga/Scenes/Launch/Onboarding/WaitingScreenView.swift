//
//  WaitingScreenView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 18.12.24.
//

import SwiftUI

struct WaitingScreenView: View {
    var body: some View {
        ZStack {
            Image(.onboarding)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Color.black.opacity(SizeMetrics.opacityThinSecond)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: SizeMetrics.mediumSpacing) {
                Text("We build a plan based on your answers")
                    .font(SizeMetrics.Fonts.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: SizeMetrics.bgImgSize)
                
                Text("Please wait, it may take a little time")
                    .font(.callout)
                    .foregroundColor(.white.opacity(SizeMetrics.opacityMedium))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: SizeMetrics.bgImgSize)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}




#Preview {
    WaitingScreenView()
}
