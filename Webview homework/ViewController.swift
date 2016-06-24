//
//  ViewController.swift
//  Webview homework
//
//  Created by jamespoyu on 2016/6/24.
//  Copyright © 2016年 AlphaCamp. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!

    var webView: WKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //         Do any additional setup after loading the view, typically from a nib.
        
        let webView = WKWebView(frame: UIScreen.mainScreen().bounds)
        
        
        webView.navigationDelegate = self
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options:.New, context: nil)
        
        
        self.view.addSubview(webView)
        self.view.insertSubview(webView, belowSubview: progressView)
        
        
        let url = NSURL(string: "https://www.google.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress"{
            self.progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goWeb(sender: AnyObject) {
//                let url = NSURL(string: "http://www.apple.com")
//                UIApplication.sharedApplication().openURL(url!)
//                let controller = SFSafariViewController(URL: url!)
//                self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    
    
    
    
}

extension ViewController: WKNavigationDelegate{
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!){
        self.progressView.hidden = true
        self.progressView.setProgress(0.0, animated: true)
    }
    
    
    
    
}