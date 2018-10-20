//
//  SDStandardLoadingIndicatorView.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 20/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import UIKit

class SDStandardLoadingIndicatorView: UIView, SDLoadingIndicatorView {
    //MARK: - IVar
    private let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    //MARK: - Life Cycle Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareActivityIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Activity View
    func prepareActivityIndicatorView(){
        activityIndicatorView.hidesWhenStopped = true;
        activityIndicatorView.activityIndicatorViewStyle  = UIActivityIndicatorViewStyle.gray;
        activityIndicatorView.center = self.center;
    }
    
    //MARK: - Loading Animation Delegate
    func startAnimating() {
        activityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicatorView.stopAnimating()
    }

}
