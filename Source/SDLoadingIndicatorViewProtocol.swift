//
//  SDLoadingIndicatorViewProtocol.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 20/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import UIKit
import Foundation

@objc protocol SDLoadingIndicatorView where Self:UIView{
    func startAnimating()
    func stopAnimating()
}

@objc protocol SDLoadingIndicatorCustomViewDataSource: NSObjectProtocol{
    func loadingIndicatorView()->SDLoadingIndicatorView
}
