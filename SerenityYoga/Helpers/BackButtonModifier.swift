//
//  CustomBackButtonModifier.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 08.01.25.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(color)
                    }
                }
            }
    }
}

extension View {
    func customBackButton(color: Color = .black) -> some View {
        self.modifier(BackButtonModifier(color: color))
    }
}
