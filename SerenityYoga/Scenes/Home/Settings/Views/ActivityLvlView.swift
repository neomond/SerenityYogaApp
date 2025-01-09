//
//  ActivityLvlView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct ActivityLvlView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                CustomNavigationBar(title: "Activity Level")
                
                AppButton(title: "Save") {
                    print("Saved!")
                }
            
                Spacer()
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ActivityLvlView()
}
