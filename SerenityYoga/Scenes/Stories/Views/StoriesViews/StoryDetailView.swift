//
//  StoryDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.01.25.
//

import SwiftUI

struct StoryDetailView: View {
    let story: Story

    
    var body: some View {
        ZStack {
            if story.image.hasPrefix("system:") {
                Image(systemName: story.image.replacingOccurrences(of: "system:", with: ""))
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Image(story.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Text(story.name)
                .font(.largeTitle)
                .fontWeight(.bold)  
        }
    }
}


#Preview {
    StoryDetailView(story: Story(name: "Test", image: "yogaImage", isAddStory: true))
}
