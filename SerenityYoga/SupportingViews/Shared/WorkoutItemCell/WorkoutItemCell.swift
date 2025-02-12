//
//  WorkoutItemCell.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 12.02.25.
//

import SwiftUI

struct WorkoutItemCell: View {
    let emoji: String
    let title: String
    let duration: String
    
    var body: some View {
        HStack {
            Text("\(emoji) \(title)")
                .font(.subheadline)
            Spacer()
            Text(duration)
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}
