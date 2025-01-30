//
//  PlayBackControlButton.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 27.01.25.
//

import SwiftUI

struct PlayBackControlButton: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundStyle(color)
        }
    }
}

#Preview {
    PlayBackControlButton(action: {})
        .preferredColorScheme(.dark)
}
