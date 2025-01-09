//
//  AboutAppView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct AboutAppView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                CustomNavigationBar(title: "About App")
                Text("AboutAppView")
                Spacer()
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AboutAppView()
}
