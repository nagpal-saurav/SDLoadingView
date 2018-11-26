//
//  SDLoadingIndicatorView.swift
//  SDLoadingViewExample
//
//  Created by Saurav Nagpal on 11/10/18.
//  Copyright © 2018 Saurav Nagpal. All rights reserved.
//

import UIKit

public enum SDActivityIndicatorType: Int{
    case standard
    case custom
}

@IBDesignable
class SDLoadingView: UIView {
    //MARK: - Ivar
    fileprivate var indicatorType:SDActivityIndicatorType
    fileprivate var opaqueView:UIView!
    public var dataSource:SDActivityIndicatorCustomViewDataSource?
    public var wantsFullScreen:Bool = false
    public var activityIndicatorBackgroundSize:CGSize = sActivityIndicatorBackgroundDefaultSize
    
    //MARK: - Class Ivar
    public static var activityText:String?
    /// Default Message for Activity Indicator. It is nil by Default.
    public static let sDefaulActvityColor = UIColor.white
    public static let sDefaulTopPadding:CGFloat = 8
    public static let sActivityContainerBackgroundColor = UIColor.lightGray
    public static let sActivityContainerAlphaValue:CGFloat = 0.5
    public static let sActivityIndicatorDefaultSize:CGSize = CGSize(width: 30, height: 30)
    public static let sActivityIndicatorBackgroundDefaultSize:CGSize = CGSize(width: 200, height: 150)
    //If not Full screen
    public static let sActivityIndicatorBackgroundCornerRadius:CGFloat = 5
    public static let sActivityIndicatorBackgroundBorderColor:UIColor = UIColor.black
    public static let sActivityIndicatorBackgroundBorderWidth:CGFloat = 5
    
    //MARK: - UI Element
    /// Color of activity indicator view.
    @IBInspectable public var color: UIColor = sDefaulActvityColor
    @IBInspectable public var topPadding: CGFloat = sDefaulTopPadding
    @IBInspectable public var activityIndicatorContainerBackgroundColor = sActivityContainerBackgroundColor
    @IBInspectable public var activityIndicatorContainerAlphaValue: CGFloat = sActivityContainerAlphaValue
    @IBInspectable lazy var activityIndicatorBackgroundBorderWidth:CGFloat = SDLoadingView.sActivityIndicatorBackgroundBorderWidth
    @IBInspectable lazy var activityIndicatorBackgroundBorderColor:UIColor = SDLoadingView.sActivityIndicatorBackgroundBorderColor
    @IBInspectable lazy var activityIndicatorBackgroundCornerRadius:CGFloat = SDLoadingView.sActivityIndicatorBackgroundCornerRadius
    @IBInspectable public var activityIndicatorSize:CGSize = sActivityIndicatorDefaultSize
    @IBInspectable var activityMessage:String?{
        didSet{
            if let  message = activityMessage {
                self.setupActivityMessage(message: message)
            }
        }
    }
    
    fileprivate var activityMessageLabel:UILabel?
    fileprivate var activityIndicatorView:SDActivityIndicatorView?
    
    //MARK: - Life Cycle
    init(frame: CGRect, type:SDActivityIndicatorType = .standard) {
        self.indicatorType = type
        super.init(frame: frame)
        self.setupActivityView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.indicatorType = .standard
        super.init(coder: aDecoder)
        self.setupActivityView()
    }
}

//MARK: - Setup Activity Indicator View
extension SDLoadingView{
    
    open func setupActivityView(){
        if let activityIndicatorView = self.activityIndicatorViewForType(self.indicatorType) as? UIView{
            //Set
            self.backgroundColor = UIColor.clear
            //Setup Activity Opaque View
            self.opaqueView = self.activityOpaqueView()
            self.addSubview(self.opaqueView)
            self.opaqueView.setViewInCenterToView(self, withSize: self.activityIndicatorBackgroundSize)
            //Setup Activity Indicator
            self.activityIndicatorView = activityIndicatorView as? SDActivityIndicatorView
            self.addSubview(activityIndicatorView)
            //Set Position
            activityIndicatorView.setViewInCenterToView(self, withSize: self.activityIndicatorSize)
        }
        
        //Common Text is Set
        if let message = SDLoadingView.activityText{
            self.setupActivityMessage(message: message)
        }
    }
    
    fileprivate func activityIndicatorViewForType(_ type:SDActivityIndicatorType)->SDActivityIndicatorView?{
        switch type {
        case .standard:
            return SDStandardActivityIndicatorView()
        case.custom:
            return self.dataSource?.activityIndicatorView()
        }
    }
    
    fileprivate func setupActivityMessage(message:String){
        guard let activityIndicatorView = self.activityIndicatorView as? UIView else{return}
        if activityMessageLabel == nil{
            //Setup Message N Font
            let labelRect = CGRect(x: 0, y: 0, width: 100, height: 50)
            let activityMessageLabel = UILabel(frame: labelRect)
            activityMessageLabel.text = message
            self.addSubview(activityMessageLabel)
            
            //Setup Position
            activityMessageLabel.translatesAutoresizingMaskIntoConstraints = false
            activityMessageLabel.setCenterXToView(self)
            activityMessageLabel.setTopFromView(topPadding, topView:activityIndicatorView)
            
            self.activityMessageLabel = activityMessageLabel
        }
    }
    
    fileprivate func activityOpaqueView()->UIView{
        var opaqueView:UIView!
        if self.wantsFullScreen == false{
            var frame = CGRect.zero
            frame.size = self.activityIndicatorBackgroundSize
            opaqueView = UIView(frame: frame)
            opaqueView.layer.cornerRadius = self.activityIndicatorBackgroundCornerRadius
            opaqueView.layer.borderWidth = self.activityIndicatorBackgroundBorderWidth
            opaqueView.layer.borderColor = self.activityIndicatorBackgroundBorderColor.cgColor
        }else{
            opaqueView = UIView(frame: self.frame)
        }
        opaqueView.backgroundColor = self.activityIndicatorContainerBackgroundColor
        opaqueView.alpha = self.activityIndicatorContainerAlphaValue
        return opaqueView
    }
}

//MARK: - Activity Indicator Show/Hide
extension SDLoadingView{
    func startAnimating(){
        self.activityIndicatorView?.startAnimating()
    }
    
    func stopAnimating(){
        self.activityIndicatorView?.stopAnimating()
    }
}

extension UIView{
    func setViewInCenterToView(_ containerView:UIView, withSize size:CGSize){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setSizeEqualTo(size)
        self.setCenterToView(containerView)
    }
    
    func setCenterToView(_ containerView:UIView){
        self.setCenterXToView(containerView)
        self.setCenterYToView(containerView)
    }
    
    func setCenterXToView(_ centerToView:UIView){
        let xConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: centerToView, attribute: .centerX, multiplier: 1, constant: 0)
        centerToView.addConstraint(xConstraint)
    }
    
    func setCenterYToView(_ centerToView:UIView){
        let yConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: centerToView, attribute: .centerY, multiplier: 1, constant: 0)
        centerToView.addConstraint(yConstraint)
    }
    
    func setTopFromView(_ top:CGFloat, topView:UIView){
        let topConstraint = NSLayoutConstraint(item: topView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: top)
        self.superview?.addConstraint(topConstraint)
    }
    
    func setSizeEqualTo(_ size:CGSize){
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.width)
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: size.height)
        self.addConstraints([width, height])
    }
}
