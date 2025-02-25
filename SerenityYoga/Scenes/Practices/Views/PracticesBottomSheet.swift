//
//  PracticesBottomSheet.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 12.02.25.
//

import SwiftUI

struct PracticesBottomSheet: View {
    @Binding var offsetY: CGFloat
    let minHeight: CGFloat = 50
    let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.2
    let collapsedHeight: CGFloat = UIScreen.main.bounds.height * 0.6
    
    let session: Session
    
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 40, height: 5)
                .padding(.top, 8)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(session.title)
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("with Elly")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(session.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                    AppButton(title: "Start Workout") {
                        print("Workout Started")
                    }
                    .padding(.horizontal)
                    
                    VStack {
                        HStack {
                            Label {
                                Text(session.duration)
                                    .foregroundColor(.black)
                            } icon: {
                                Image(systemName: "clock")
                                    .foregroundColor(.primaryPurple)
                            }
                            .font(.callout)
                            
                            
                            // MARK: - Intensity Level Indicator
                            IntensityLevelView()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)

                        .background(.white)
                        .cornerRadius(12)
                        
                        Text("""
                        This 10-minute morning yoga workout is designed to give you full-body results and wake up your body. Whether you're a beginner or experienced yogi, this flow has something for everyone. Follow along and let's get moving!
                        """)
                        .font(.subheadline)
                        .padding(.vertical)
                        
                        Text("Workout Structure")
                            .font(.headline)
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // MARK: - Workout Item
                        VStack(spacing: 10) {
                            WorkoutItemCell(
                                emoji: "🧘‍♀️",
                                title: "Workout",
                                duration: session.duration)
                            WorkoutItemCell(
                                emoji: "😌",
                                title: session.title,
                                duration: session.duration)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }.scrollBounce(enabled: false)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .offset(y: max(min(offsetY + dragOffset, collapsedHeight), maxHeight))
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation.height
                }
                .onEnded { value in
                    withAnimation(.easeInOut) {
                        if value.translation.height < -100 {
                            offsetY = maxHeight  /// Fully expand
                        } else if value.translation.height > 100 {
                            offsetY = collapsedHeight /// Collapse
                        }
                    }
                }
        )
        .animation(.easeInOut(duration: 0.3), value: offsetY)
    }
}
