//
//  WelcomeVC.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/3/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chatting & Sharing";
        let eclipseView = EclipseViewAnimation(frame: CGRect(x: 80, y: 167, width: 180, height: 330))
        self.view.addSubview(eclipseView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
