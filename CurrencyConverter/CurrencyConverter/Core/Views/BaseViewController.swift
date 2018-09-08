//
//  BaseViewController.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewProtocol {
    
//    var loadingView: EOLLoadingView?
//    var errorView:EOLErrorView!
//    var emptyView:EOLEmptyView?
    
    @IBOutlet weak var contentView:UIView!  //TODO: can't we use self.view instead of this outlet?
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        EOLApp.setEmptyTitleForBackButton(self.navigationItem)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        (UIApplication.shared.delegate as! AppDelegate).isPortraitOnly = supportPortraitOnly()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        (UIApplication.shared.delegate as! AppDelegate).isPortraitOnly = false
    }
    
    public func showLoading() {
//        if(self.loadingView == nil){
//            let loadingView = EOLLoadingView(frame: self.contentView.bounds)
//            loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            self.contentView.addSubview(loadingView)
//            self.loadingView = loadingView
//        }
    }
    
    public func showLoading(withBackgroundColor backgroundColor: UIColor) {
        self.showLoading()
//        self.loadingView?.backgroundColor = backgroundColor
    }
    
    public func hideLoading() {
//        if (self.loadingView != nil) {
//            UIView.animate(withDuration: 0.3, animations: {() -> Void in
//                self.loadingView?.alpha = 0
//            }, completion: {(_ finished: Bool) -> Void in
//                self.loadingView?.removeFromSuperview()
//                self.loadingView = nil
//            })
//        }
    }
    
    public func showError(_ message: String?) {
//        if (self.errorView != nil){
//            self.errorView = nil
//        }
//        let errorView = UIView.fromNib(EOLErrorView.nibName) as! EOLErrorView
//        errorView.frame = self.contentView.bounds
//        errorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        errorView.setMessage(message!)
//        self.contentView.addSubview(errorView)
//        self.errorView = errorView
    }
    
    public func showEmptyView(withMessage message: String, andImageName imageName: String) {
        if let image = UIImage(named: imageName) {
            showEmptyView(withMessage: message, andImage: image)
        }
    }
    
    public func showEmptyView(withMessage message: String, andImage image: UIImage) {
//        if (self.emptyView != nil) {
//            hideEmptyView()
//        }
//        let emptyView = UIView.fromNib(EOLEmptyView.nibName) as! EOLEmptyView
//        emptyView.frame = self.contentView.bounds
//        emptyView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        emptyView.set(message: message, image: image)
//        self.contentView.addSubview(emptyView)
//        self.emptyView = emptyView
    }
    
    public func addGestureRecognizerToEmptyViewIcon(_ gesture: UITapGestureRecognizer) {
//        if let emptyView = self.emptyView {
//            emptyView.iconImageView.isUserInteractionEnabled = true
//            emptyView.iconImageView.addGestureRecognizer(gesture)
//        }
    }
    
    public func hideEmptyView() {
//        self.emptyView?.removeFromSuperview()
//        self.emptyView = nil
    }
    
    public func addRightBarButtonItem(withTitle title: String) {
//        let nextButton = UIButton(type: .custom)
//        nextButton.frame = CGRect(x: 0, y: 0, width: 60, height: 20)
//        nextButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        nextButton.setTitle(title, for: .normal)
//        nextButton.setTitleColor(UIColor.white, for: .normal)
//        nextButton.addTarget(self, action: #selector(onRightBarButtonItemTapped), for: .touchUpInside)
//        let nextBarButton = UIBarButtonItem(customView: nextButton)
//        self.navigationItem.rightBarButtonItem = nextBarButton
    }
    
    public func removeRightBarButtonItem() {
        self.navigationItem.rightBarButtonItem = nil
    }
    
    public func onRightBarButtonItemTapped()
    {
    }
    
    public func scrollToTopIfNeeded(){
    }
    
    public func supportPortraitOnly() -> Bool {
        return false
    }
}
