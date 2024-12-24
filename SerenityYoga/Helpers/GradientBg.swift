//
//  GradientBg.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 24.12.24.
//

import SwiftUI

struct GradientBg: View {
    let colors: [Color]
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .topTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    GradientBg(colors: [.primaryPurple, .white])
}
