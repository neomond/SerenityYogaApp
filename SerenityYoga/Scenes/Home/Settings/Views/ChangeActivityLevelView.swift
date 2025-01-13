//
//  ChangeActivityLevelView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 09.01.25.
//

import SwiftUI

struct ChangeActivityLevelView: View {
    @StateObject var viewModel: ChangeActivityLevelViewModel
    
    var body: some View {
        VStack(spacing: SizeMetrics.largeSpacing) {
            CustomNavigationBar(title: "Change Activity Level")
            
            ForEach(viewModel.activities, id: \.self) { activity in
                HStack {
                    Text(activity)
                    
                    Spacer()
                    ZStack {
                        if viewModel.selectedActivity == activity {
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
                .background(Color.gray.opacity(SizeMetrics.xsopacityThin))
                .cornerRadius(SizeMetrics.mediumRadius)
                .onTapGesture {
                    viewModel.selectedActivity = activity
                }
            }
            
            AppButton(title: "Save", style: .primary) {
                print("Activity level saved: \(viewModel.selectedActivity)")
            }
            .padding(.top, SizeMetrics.largePadding)
            
            Spacer()
        }
        .padding(.horizontal)
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let activities = [
        "Very Active (daily exercise)",
        "Active (exercise 3 times a week)",
        "Intermittent (exercise once a week)",
        "Not at all"
    ]
    
    let previewViewModel = ChangeActivityLevelViewModel(
        selectedActivity: "Very Active (daily exercise)",
        activities: activities
    )
    
    return ChangeActivityLevelView(viewModel: previewViewModel)
}

