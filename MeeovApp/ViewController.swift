//
//  ViewController.swift
//  MeeovApp
//
//  Created by İlyas Abiyev on 1/24/20.
//  Copyright © 2020 İlyas Abiyev. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var ActInt: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.meeov.com")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        webView.addSubview(ActInt)
        ActInt.startAnimating()
        
        webView.navigationDelegate = self
        ActInt.hidesWhenStopped = true
    }

    @IBAction func back(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func stop(_ sender: Any) {
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        ActInt.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ActInt.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ActInt.stopAnimating()
    }
}

