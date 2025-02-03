//
//  MeditationPlayerView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 21.01.25.
//

import SwiftUI

struct MeditationPlayerView: View {    
    @EnvironmentObject var audioManager: AudioManager
    @Environment(\.dismiss) var dismiss
    @State private var isLiked: Bool = false
    @State private var value: Double = 0.0
    var isPreview: Bool = false
    
    let meditation: Meditate
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // MARK: Background Image
            
            Image(meditation.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            // MARK: Blur View
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                // MARK: Back and Like Buttons
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThin))
                            .frame(width: SizeMetrics.xmediumIcon,
                                   height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            )
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThin))
                            .frame(width: SizeMetrics.xmediumIcon,
                                   height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .font(.system(size: SizeMetrics.extraSmallIcon))
                                    .foregroundColor(isLiked ? .primaryPurple : .white)
                            )
                    }
                }
                
                Spacer()
                
                // MARK: Texts
                VStack(spacing: 16) {
                    Text(meditation.title)
                        .font(.title)
                    Text(meditation.description)
                        .multilineTextAlignment(.center)
                        .font(.title3)
                    Text(meditation.title)
                        .font(.callout)
                }
               
                .foregroundStyle(.white)
//                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 5) {
                    // MARK: Playback Timeline
                    Slider(value: $value, in: 0...meditation.duration)
                        .accentColor(.white)
                    
                    // MARK: Playback Time
                    HStack {
                        Text("0:00")
                        Spacer()
                        Text(DateComponentsFormatter.positional.string(from: meditation.duration) ?? "00:00") // ✅ Format duration
                    }
                    .font(.caption)
                    .foregroundStyle(.white)
                }
                
                HStack{
                    // MARK: Repeat Button
                    PlayBackControlButton(systemName: "repeat"){
                        
                    }
                    Spacer()
                    
                    // MARK: Backward Button
                    PlayBackControlButton(systemName: "gobackward.10"){
                        
                    }
                    Spacer()
                    
                    // MARK: Play/Pause Button
                    PlayBackControlButton(systemName: "play.circle.fill", fontSize: 44){
                        
                    }
                    Spacer()
                    
                    // MARK: Forward Button
                    PlayBackControlButton(systemName: "goforward.10"){
                        
                    }
                    Spacer()
                    
                    // MARK: Stop Button
                    PlayBackControlButton(systemName: "stop.fill"){
                        
                    }
                }
            }
                .padding(.vertical, 60)
                .padding(.horizontal, 20)
        }
        .onAppear {
//            AudioManager.shared.startPlayer(track: meditation.track, isPreview: isPreview)
            audioManager.startPlayer(track: meditation.track, isPreview: isPreview)
        }
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MeditationPlayerView(isPreview: true, meditation: Meditate(title: "meow", duration: 80, imageName: "yogaImage", description: "meow", track: "meditation1"))
        .environmentObject(AudioManager())
}
