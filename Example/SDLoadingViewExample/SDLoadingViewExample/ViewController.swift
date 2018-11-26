//
//  ViewController.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 10/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loadingView:SDLoadingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SDLoadingView.activityText = "Loading..."
        self.loadingView = SDLoadingView(frame: self.view.frame, type: .standard)
        self.view.addSubview(self.loadingView)
        self.loadingView.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

