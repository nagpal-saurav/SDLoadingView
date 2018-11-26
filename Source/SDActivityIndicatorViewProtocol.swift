//
//  SDLoadingIndicatorViewProtocol.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 20/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import UIKit
import Foundation

@objc protocol SDActivityIndicatorView where Self:UIView{
    func startAnimating()
    func stopAnimating()
}

@objc protocol SDActivityIndicatorCustomViewDataSource: NSObjectProtocol{
    func activityIndicatorView()->SDActivityIndicatorView
}
