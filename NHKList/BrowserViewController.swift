//
//  BrowtherViewController.swift
//  NHKList
//
//  Created by  intern on 2015/08/20.
//  Copyright (c) 2015年 sonicmoov. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController{
    
    @IBOutlet weak var webView: UIWebView!
    var URL: NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(NSURLRequest(URL:URL!));
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}

