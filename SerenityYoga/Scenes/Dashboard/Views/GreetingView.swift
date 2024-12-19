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
        VStack(alignment: .leading, spacing: 8) {
            Text("Welcome, \(name)!")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text("How are you feeling today?")
                .font(.title3)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 150, alignment: .leading)
        .padding(.leading, 20)
    }
}


#Preview {
    GreetingView(name: "Nazrin")
}
