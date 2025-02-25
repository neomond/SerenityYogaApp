//
//  YouTubeManager.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 25.02.25.
//

import Foundation

final class YouTubeManager {
    
    static let shared = YouTubeManager()
    private init() {} /// Prevents external instantiation
    
    /// Extracts YouTube Video ID from URL
    func extractYouTubeID(from url: String) -> String? {
        print("🕵️ Extracting ID from URL: \(url)")
        
        let patterns = [
            "youtube\\.com/watch\\?v=([\\w-]+)",  // Standard YouTube URL
            "youtu\\.be/([\\w-]+)"               // Shortened YouTube URL
        ]
        
        for pattern in patterns {
            if let range = url.range(of: pattern, options: .regularExpression) {
                return String(url[range].split(separator: "=").last ?? "")
            }
        }
        
        print("❌ No valid YouTube ID found in: \(url)")
        return nil
    }
    
    /// Returns the **embed URL** for YouTube videos
    func getEmbedURL(from videoURL: String) -> String? {
        guard let videoID = extractYouTubeID(from: videoURL) else { return nil }
        
        let embedURL = "https://www.youtube.com/embed/\(videoID)?playsinline=1&autoplay=1"
        print("🎬 YouTube Embed URL: \(embedURL)")
        
        return embedURL
    }
}
