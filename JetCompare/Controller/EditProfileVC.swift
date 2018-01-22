//
//  EditProfileVC.swift
//  mySidebar2
//
//  Created by Gul on 10/12/17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit

class EditProfileVC: ViewController{
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: "http://m.jetcompare.com.au/")
        setupWebView(url: myURL!)
        setupWebApp()
    }
    
   
}
