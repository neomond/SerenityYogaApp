//
//  AddStoryView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 15.01.25.
//

import SwiftUI

struct AddStoryView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var storyName: String = ""
    @State private var storyImage: String = "yogaasana2"
    
    let onSave: (Story) -> Void
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Enter Story Name", text: $storyName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Picker("Select an Image", selection: $storyImage) {
                    Text("Yoga Asana").tag("yogaasana2")
                    Text("Yoga Pose").tag("yogaImage")
                    Text("Person").tag("system:person.circle")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                
                Button(action: {
                    // Save the new story
                    let newStory = Story(name: storyName, image: storyImage, isAddStory: false)
                    onSave(newStory)
                    dismiss()
                }) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(storyName.isEmpty) // Disable button if name is empty
            }
            .padding()
            .navigationTitle("Add New Story")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
        }
    }
}


#Preview {
    AddStoryView { newStory in
        print("New story added: \(newStory.name)")
    }
 }
