//
//  GreetingView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct GreetingView: View {
    let name: String

    var body: some View {
        VStack(alignment: .leading, spacing: SizeMetrics.smallPadding) {
            Text("Welcome, \(name)!")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("How are you feeling today?")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, SizeMetrics.largePadding)
    }
}


#Preview {
    ZStack {
        LinearGradient(
            gradient: Gradient(colors: [.primaryPurple, .mainPink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        GreetingView(name: "Nazrin")
    }
    .frame(height: 120)
}
