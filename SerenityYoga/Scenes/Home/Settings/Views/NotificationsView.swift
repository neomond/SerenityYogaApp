//
//  NotificationsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct NotificationsView: View {
    let title: String
    @Binding var isOn: Bool // Use Binding from parent view
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.primary)
            Spacer()
            Toggle("", isOn: $isOn) // Bind directly to the parent state
                .labelsHidden()
                .tint(.primaryPurple)
        }
        .padding()
        .background(Color.gray.opacity(SizeMetrics.xsopacityThin))
        .cornerRadius(SizeMetrics.smallRadius)
    }
}
