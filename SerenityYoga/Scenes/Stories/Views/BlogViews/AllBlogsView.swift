//
//  AllBlogsView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 15.01.25.
//

import SwiftUI

struct AllBlogsView: View {
    let stories: [Story]
    
    var body: some View {
        ScrollView {
           
                ForEach(stories) { story in
                        Text(story.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                }
            .padding()
        }
        .navigationTitle("All Stories")
    }
}



#Preview {
    AllBlogsView(
        stories: [
            Story(name: "Your Story", image: "system:add.circle.fill", isAddStory: true),
            Story(name: "Jeena", image: "yogaasana2", isAddStory: false),
            Story(name: "Emma", image: "yogaImage", isAddStory: false),
            Story(name: "Andy", image: "yogaImage", isAddStory: false),
            Story(name: "Sara", image: "system:person.circle", isAddStory: false),
            Story(name: "Mike", image: "system:star.fill", isAddStory: false)
        ]
    )
}
