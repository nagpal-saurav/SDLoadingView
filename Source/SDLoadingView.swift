//
//  SDLoadingIndicatorView.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 11/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import UIKit

public enum SDLoadingIndicatorType: Int{
    case standard
    case custom
}

class SDLoadingView: UIView {
    //MARK: - Ivar
    fileprivate var indicatorType:SDLoadingIndicatorType = .standard
    public var dataSource:SDLoadingIndicatorCustomViewDataSource?

    //MARK: - Life Cycle
    init(frame: CGRect, type:SDLoadingIndicatorType) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Loading Indicator View
    func loadingIndicatorViewForType(_ type:SDLoadingIndicatorType)->SDLoadingIndicatorView?{
        switch type {
        case .standard:
            return SDStandardLoadingIndicatorView()
        case.custom:
            return self.dataSource?.loadingIndicatorView()
        }
    }
    
}
