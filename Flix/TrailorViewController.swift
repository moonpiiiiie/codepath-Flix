//
//  TrailorViewController.swift
//  Flix
//
//  Created by Cheng Xue on 9/14/22.
//

import UIKit
import WebKit

class TrailorViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var movie: [String: Any]!
    var key: String = ""
    override func loadView() {
           let webConfiguration = WKWebViewConfiguration()
           webView = WKWebView(frame: .zero, configuration: webConfiguration)
           webView.uiDelegate = self
           view = webView
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(key)
        // Do any additional setup after loading the view.
        let myURL = URL(string:"https://www.youtube.com/watch?v=\(key)")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
