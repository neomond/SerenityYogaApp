//
//  HeaderView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 24.12.24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let onClose: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Button(action: onClose) {
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
        .padding(.vertical, 16)
    }
}
