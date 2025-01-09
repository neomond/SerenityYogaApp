//
//  CustomNavigationBar.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct CustomNavigationBar: View {
    let title: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
            Spacer()
            Text(title)
            Spacer()
        }
        .padding(.bottom)
    }
}

#Preview {
    CustomNavigationBar(title: "Meow")
}
