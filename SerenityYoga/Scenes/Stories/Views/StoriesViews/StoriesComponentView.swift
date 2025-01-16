//
//  StoriesComponentView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.01.25.
//

import SwiftUI

// MARK: - Story Model
struct Story: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let isAddStory: Bool
}


struct StoriesComponentView: View {
    let stories: [Story]
    let onStoryTapped: (Story) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(stories) { story in
                    VStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .stroke(story.isAddStory ? Color.gray.opacity(0.2) : Color.primaryPurple, lineWidth: 2)
                                .frame(width: 68, height: 68)
                            
                            if story.image.hasPrefix("system:") {
                                Image(systemName: story.image.replacingOccurrences(of: "system:", with: ""))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .foregroundColor(story.isAddStory ? .gray : .gray.opacity(0.7))
                            } else {
                                Image(story.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                            
                            if story.isAddStory {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onTapGesture {
                            onStoryTapped(story)
                        }
                        
                        Text(story.name)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
    }
}

//
//#Preview {
//    StoriesComponentView(
//        stories: [
//            Story(name: "Your Story", image: "system:add.circle.fill", isAddStory: true),
//            Story(name: "John", image: "yogaasana2", isAddStory: false),
//            Story(name: "Emma", image: "yogaImage", isAddStory: false),
//            Story(name: "Andy", image: "yogaImage", isAddStory: false),
//            Story(name: "Sara", image: "system:person.circle", isAddStory: false)
//        ]
//    )
//}

