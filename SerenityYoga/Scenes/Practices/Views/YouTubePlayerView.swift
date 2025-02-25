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
        
        guard let embedURL = YouTubeManager.shared.getEmbedURL(from: videoURL) else {
            print("❌ Failed to get valid embed URL from: \(videoURL)")
            return
        }

        guard let url = URL(string: embedURL) else {
            print("❌ Invalid URL format: \(embedURL)")
            return
        }

        let request = URLRequest(url: url)
        uiView.load(request)
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
