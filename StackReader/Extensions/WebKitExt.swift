//
//  WebKitExt.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 20.09.2022.
//

import Foundation
import WebKit

extension WKWebView {

    /// load HTML String same font like the UIWebview
    ///
    //// - Parameters:
    ///   - content: HTML content which we need to load in the webview.
    ///   - baseURL: Content base url. It is optional.
    func loadHTMLStringWithMagic(content:String,baseURL:URL?){
        let headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=0.7, maximum-scale=0.7, minimum-scale=0.7, user-scalable=no'></header>"
        loadHTMLString(headerString + content, baseURL: baseURL)
    }
}
