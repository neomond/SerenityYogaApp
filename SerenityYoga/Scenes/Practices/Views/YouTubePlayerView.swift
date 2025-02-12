//
//  YouTubePlayerView.swift
//  SerenityYoga
//
//  Created by Nazrin Atayeva on 12.02.25.
//

import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoURL: String
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = preferences
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        config.allowsAirPlayForMediaPlayback = true
        config.userContentController = WKUserContentController()
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        var embedURL: String
        
        if videoURL.contains("youtube.com/watch") {
            guard let videoID = videoURL.split(separator: "=").last else { return }
            embedURL = "https://www.youtube.com/embed/\(videoID)?autoplay=1&playsinline=1"
        } else {
            embedURL = videoURL
        }
        
        guard let url = URL(string: embedURL) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


#Preview {
    YouTubePlayerView(videoURL: "https://www.youtube.com/watch?v=M7lc1UVf-VE")
}
