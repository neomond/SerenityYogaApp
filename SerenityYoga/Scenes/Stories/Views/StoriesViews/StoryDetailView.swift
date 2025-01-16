//
//  StoryDetailView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 14.01.25.
//

import SwiftUI

struct StoryDetailView: View {
    @Binding var currentIndex: Int
    let stories: [Story]
    @State private var progress: [CGFloat]
    @State private var isPaused: Bool = false
    @State private var timer: Timer? = nil

    init(currentIndex: Binding<Int>, stories: [Story]) {
        _currentIndex = currentIndex
        self.stories = stories
        _progress = State(initialValue: Array(repeating: 0, count: stories.count))
    }

    var body: some View {
        ZStack {
            // Display the image
            Image(stories[currentIndex].image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Progress bar
                HStack(spacing: 4) {
                    ForEach(stories.indices, id: \.self) { index in
                        ProgressBar(value: progress[index])
                            .frame(height: 4)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50)

                Spacer()

                // Story details
                Text(stories[currentIndex].name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 100)
            }

            // Navigation buttons
            HStack {
                // Go to previous story
                Button(action: {
                    if currentIndex > 0 {
                        resetProgress(for: currentIndex)
                        currentIndex -= 1
                        startTimer()
                    }
                }) {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                }
                .frame(width: UIScreen.main.bounds.width / 2)

                // Go to next story
                Button(action: {
                    if currentIndex < stories.count - 1 {
                        resetProgress(for: currentIndex)
                        currentIndex += 1
                        startTimer()
                    }
                }) {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                }
                .frame(width: UIScreen.main.bounds.width / 2)
            }
        }
        .gesture(
            LongPressGesture(minimumDuration: 0.2)
                .onChanged { _ in
                    isPaused = true
                    stopTimer()
                }
                .onEnded { _ in
                    isPaused = false
                    startTimer()
                }
        )
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    // MARK: - Timer Methods
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if !isPaused {
                progress[currentIndex] += 0.01
                if progress[currentIndex] >= 1.0 {
                    resetProgress(for: currentIndex)
                    if currentIndex < stories.count - 1 {
                        currentIndex += 1
                    } else {
                        stopTimer() // Stop when last story is done
                    }
                }
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func resetProgress(for index: Int) {
        progress[index] = 0
    }
}

struct ProgressBar: View {
    var value: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                Rectangle()
                    .fill(Color.white)
                    .frame(width: geometry.size.width * value)
            }
            .cornerRadius(2)
        }
    }
}

#Preview {
    StoryDetailView(currentIndex: .constant(0), stories: [
        Story(name: "Jeena", image: "yogaasana2", isAddStory: false),
        Story(name: "Emma", image: "yogaImage", isAddStory: false),
        Story(name: "Andy", image: "yogaImage", isAddStory: false)
    ])
}

