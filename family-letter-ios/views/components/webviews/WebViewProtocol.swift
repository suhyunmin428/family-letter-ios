//
//  WebViewProtocol.swift
//  family-letter-ios
//
//  Created by 우현민 on 2022/11/21.
//

import Combine
import SwiftUI
import WebKit

protocol WebView: UIViewRepresentable {
    var url: URL { get set }
    var urlRequest: URLRequest { get }
    func makeUIView(context: Context) -> WKWebView
    func updateUIView(_ uiView: WKWebView, context: Context)
}

extension WebView {
    var urlRequest: URLRequest {
        URLRequest(url: url)
    }
}

extension WKWebView {
    convenience init(cookies: [HTTPCookie]) {
        let dataStore = WKWebsiteDataStore.nonPersistent()
        let configuration = WKWebViewConfiguration()
        for cookie in cookies {
            dataStore.httpCookieStore.setCookie(cookie)
        }
        configuration.websiteDataStore = dataStore
        self.init(frame: .zero, configuration: configuration)
    }
}
