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
    @State private var isEditing: Bool = false
    
    var isPreview: Bool = false
    
    @ObservedObject var favoritesViewModel: FavoritesViewModel
    let meditation: Meditate
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
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
                // MARK: Top Nav Buttons (Dismiss and Like)
                HStack {
                    Button(action: {
                        audioManager.stop()
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
                        favoritesViewModel.toggleLike(for: meditation)
                        isLiked = favoritesViewModel.isLiked(meditation)
                    }) {
                        Circle()
                            .fill(Color.white.opacity(SizeMetrics.opacityThin))
                            .frame(width: SizeMetrics.xmediumIcon, height: SizeMetrics.xmediumIcon)
                            .overlay(
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .font(.system(size: SizeMetrics.extraSmallIcon))
                                    .foregroundColor(isLiked ? .primaryPurple : .white)
                            )
                    }
                    .onAppear {
                        isLiked = favoritesViewModel.isLiked(meditation) 
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
//                                .padding(.horizontal)
                
                Spacer()
                
                if let player = audioManager.player {
                    VStack(spacing: 5) {
                        // MARK: Playback Timeline
                        Slider(value: $value, in: 0...player.duration) { editing in
                            
                            print("editing", editing)
                            isEditing = editing
                            
                            if !editing {
                                player.currentTime = value
                            }
                        }
                            .accentColor(.white)
                        
                        // MARK: Playback Time
                        
                        HStack {
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "00:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: meditation.duration) ?? "00:00")
                        }
                        .font(.caption)
                        .foregroundStyle(.white)
                    }
                    HStack{
                        // MARK: Repeat Button
                        let color: Color = audioManager.isLooping ? .teal : .white
                        PlayBackControlButton(systemName: "repeat", color: color){
                            audioManager.toggleLoop()
                        }
                        Spacer()
                        
                        // MARK: Backward Button
                        PlayBackControlButton(systemName: "gobackward.10"){
                            player.currentTime -= 10
                        }
                        Spacer()
                        
                        // MARK: Play/Pause Button
                        PlayBackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44){
                            audioManager.playPause()
                        }
                        Spacer()
                        
                        // MARK: Forward Button
                        PlayBackControlButton(systemName: "goforward.10"){
                            player.currentTime += 10
                        }
                        Spacer()
                        
                        // MARK: Stop Button
                        PlayBackControlButton(systemName: "stop.fill"){
                            audioManager.stop()
                            dismiss()
                        }
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
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let favoritesVM = FavoritesViewModel()
    
    return MeditationPlayerView(
        isPreview: true,
        favoritesViewModel: favoritesVM,
        meditation: Meditate(
            title: "meow",
            duration: 80,
            imageName: "yogaImage",
            description: "meow",
            track: "meditation1")
    )
    .environmentObject(AudioManager())
}
