//
//  YouTubeNavigator.swift
//  officeStretches
//
//  Created by Alex  on 4/6/24.
//

import Foundation
import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let YTUrl: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: YTUrl) else { return }
        uiView.load(URLRequest(url: demoURL))
    }
}
