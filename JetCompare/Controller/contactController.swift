//
//  contactController.swift
//  mySidebar2
//
//  Created by ZainAnjum on 18/01/2018.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
class contactController: EditProfileVC {
    
    
    override func viewDidLoad() {
      
        let myURL = URL(string: "http://m.jetcompare.com.au/flightsw")
        setupWebView(url: myURL!)
        setupWebApp()
    }
    
}
