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
            // Background Image
            Image(.onboarding)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // Overlay with shadow for better text readability
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            // Centered Content
            VStack(spacing: SizeMetrics.mediumSpacing) {
                Text("We build a plan based on your answers")
                    .font(SizeMetrics.Fonts.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                
                Text("Please wait, it may take a little time")
                    .font(.callout)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}




#Preview {
    WaitingScreenView()
}
