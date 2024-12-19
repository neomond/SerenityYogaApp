//
//  ScrollViewWithOffset.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 19.12.24.
//

import SwiftUI

struct ScrollViewWithOffset<Content: View>: View {
    let onScroll: (CGFloat) -> Void
    let content: () -> Content

    init(onScroll: @escaping (CGFloat) -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.onScroll = onScroll
        self.content = content
    }

    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .global).origin.y)
            }
            .frame(height: 0)

            content()
        }
        .onPreferenceChange(ScrollOffsetKey.self, perform: onScroll)
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

