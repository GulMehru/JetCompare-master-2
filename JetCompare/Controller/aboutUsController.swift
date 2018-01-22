//
//  AppDelegate.swift
//  JetCompare
//
//  Created by ZainAnjum on 20/01/2018.
//  Copyright © 2018 itEmpire. All rights reserved.
//

import UIKit
class aboutUsController: EditProfileVC {
    
   
    override func viewDidLoad() {
   
        let myURL = URL(string: "http://m.jetcompare.com.au/About-Us")
        setupWebView(url: myURL!)
        setupWebApp()
        
    }
    
}

