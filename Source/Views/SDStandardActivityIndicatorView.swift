//
//  SDStandardLoadingIndicatorView.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 20/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import UIKit

class SDStandardActivityIndicatorView: UIView, SDActivityIndicatorView {
    //MARK: - IVar
    private let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    //MARK: - Life Cycle Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareActivityIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepareActivityIndicatorView()
    }
    
    //MARK: - Setup Activity View
    func prepareActivityIndicatorView(){
        self.addSubview(self.activityIndicatorView)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.activityIndicatorViewStyle  = UIActivityIndicatorViewStyle.gray
        activityIndicatorView.setViewInCenterToView(self, withSize: frame.size)
    }
    
    //MARK: - Loading Animation Delegate
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }

}
