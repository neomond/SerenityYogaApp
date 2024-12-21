//
//  ScrollBounceModifier.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 20.12.24.
//

import SwiftUI

struct ScrollBounceModifier: ViewModifier {
    let bounces: Bool

    func body(content: Content) -> some View {
        content
            .onAppear {
                UIScrollView.appearance().bounces = bounces
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true 
            }
    }
}

extension View {
    func scrollBounce(enabled: Bool) -> some View {
        self.modifier(ScrollBounceModifier(bounces: enabled))
    }
}
