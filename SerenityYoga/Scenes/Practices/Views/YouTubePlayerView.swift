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
        webView.navigationDelegate = context.coordinator
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .black

        return webView
    }


    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        print("🕵️ Received YouTube URL: \(videoURL)")
        
        guard let videoID = extractYouTubeID(from: videoURL) else {
            print("❌ Failed to extract YouTube ID from: \(videoURL)")
            return
        }

        let embedURL = "https://www.youtube.com/embed/\(videoID)?playsinline=1&autoplay=1"
        
        print("🎬 Final YouTube URL: \(embedURL)") // ✅ Debug URL

        guard let url = URL(string: embedURL) else {
            print("❌ Invalid URL format: \(embedURL)")
            return
        }

        let request = URLRequest(url: url)
        uiView.load(request)
    }



    private func extractYouTubeID(from url: String) -> String? {
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
        return nil
    }




    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            if let nsError = error as NSError? {
                print("❌ WebView Load Error: \(nsError.localizedDescription) (code: \(nsError.code))")
            }
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            if let nsError = error as NSError? {
                print("❌ WebView Provisional Load Error: \(nsError.localizedDescription) (code: \(nsError.code))")
                print("🔍 Possible Causes:")
                print("1️⃣ App Transport Security (ATS) is blocking the request.")
                print("2️⃣ YouTube's SSL certificate might not be trusted.")
                print("3️⃣ The URL format may be incorrect.")
            }
        }
    }

}

// MARK: - Preview
#Preview {
    YouTubePlayerView(videoURL: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")
}
