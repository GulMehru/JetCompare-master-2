//
//  contactUsController.swift
//  mySidebar2
//
//  Created by Gul Mehru on 1/18/18.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class contactUsController: EditProfileVC {
    
    override func viewDidLoad() {
     
        let myURL = URL(string: "http://m.jetcompare.com.au/contact-us")
        setupWebView(url: myURL!)
        setupWebApp()
        
        
    }
  
}
