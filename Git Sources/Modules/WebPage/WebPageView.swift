//
//  WebPageView.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import UIKit
import PKHUD

protocol WebPageModuleInput: class {
    func configure(pageUrl:String)
}

protocol WebPageViewInput: class {
    
}

protocol WebPageViewOutput: class {
    
}

final class WebPageView: UIViewController, WebPageViewInput, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var pageUrl:String = ""
    var presenter: WebPageViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Content"
        webView.delegate = self
        
        if let url = URL(string: pageUrl) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        HUD.show(.progress)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            HUD.flash(.success, delay: 0.3)
        }
    }

}

extension WebPageView: WebPageModuleInput {
    func configure(pageUrl:String) {
        self.pageUrl = pageUrl
    }
}
