//
//  ActivityLevelView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 18.12.24.
//

import SwiftUI

struct ActivityLevelView: View {
    @Binding var selectedActivity: String
    let activities: [String]
    var onNext: () -> Void
    var onBack: () -> Void
    
    var body: some View {
        VStack(spacing: SizeMetrics.mediumSpacing) {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .frame(width: SizeMetrics.largeIcon, height: SizeMetrics.largeIcon)
            
            Text("What is your activity level?")
                .font(SizeMetrics.Fonts.title2)
                .padding(.bottom, SizeMetrics.mediumPadding)
            
            ForEach(activities, id: \.self) { activity in
                HStack {
                    Text(activity)
                    
                    Spacer()
                    ZStack {
                        if selectedActivity == activity {
                            Circle()
                                .fill(Color.primaryPurple)
                                .frame(width: SizeMetrics.extraSmallIcon,
                                       height: SizeMetrics.extraSmallIcon)
                            Circle()
                                .fill(Color.white)
                                .frame(width: SizeMetrics.smallPadding,
                                       height: SizeMetrics.smallPadding)
                        } else {
                            Circle()
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width: SizeMetrics.extraSmallIcon,
                                       height: SizeMetrics.extraSmallIcon)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(SizeMetrics.mediumRadius)
                
                .onTapGesture {
                    selectedActivity = activity
                }
            }
            
            HStack {
                AppButton(title: "Back", style: .secondary, action: onBack)
                AppButton(title: "Continue", style: .primary, action: onNext)
            }
            .padding(.top, SizeMetrics.largePadding)
            Spacer()
        }
        .padding(SizeMetrics.horizontalPadding)
    }
}


#Preview {
    @State var previewSelectedActivity: String = "Very Active"
    let activities = ["Very Active (daily exercise)",
                      "Active (exercise 3 times a week)",
                      "Intermittent (exercise once a week)",
                      "Not at all"]
    
    return ActivityLevelView(
        selectedActivity: $previewSelectedActivity,
        activities: activities,
        onNext: {
            print("Activity step completed: \(previewSelectedActivity)")
        },
        onBack: {
            print("Back button tapped")
        })
}
