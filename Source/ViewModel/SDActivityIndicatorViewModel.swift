//
//  SDActivityIndicatorViewModel.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 20/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import Foundation
import UIKit

internal final class SDActivityIndicatorViewModel {
    //Size of Activity Indicator
    let activityIndicatorSize:CGSize
    
    //Size of Activity Indicator Background
    let activityIndicatorBackgroundSize:CGSize
    
    //MARK: - Object Life Cycle
    init(indicatorSize:CGSize? = nil,
         indicatorSizeBackgroundSize:CGSize? = nil) {
        self.activityIndicatorSize = indicatorSize ?? SDLoadingView.sActivityIndicatorDefaultSize
        self.activityIndicatorBackgroundSize = indicatorSizeBackgroundSize ?? SDLoadingView.sActivityIndicatorBackgroundDefaultSize
    }
}
