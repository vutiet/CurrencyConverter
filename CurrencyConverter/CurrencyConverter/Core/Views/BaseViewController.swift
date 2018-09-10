//
//  BaseViewController.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController, BaseViewProtocol {
    
    var loadingView: LoadingView?
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterNotifications()
    }
    
    public func showLoading() {
        if(self.loadingView == nil) {
            let loadingView = UIView.fromNib(LoadingView.nibName) as! LoadingView
            loadingView.frame = self.view.bounds
            loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(loadingView)
            self.loadingView = loadingView
        }
    }
    
    
    public func hideLoading() {
        if (self.loadingView != nil) {
            UIView.animate(withDuration: 0.3, animations: {() -> Void in
                self.loadingView?.alpha = 0
            }, completion: {(_ finished: Bool) -> Void in
                self.loadingView?.removeFromSuperview()
                self.loadingView = nil
            })
        }
    }
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onAppWillResignActive), name:Notification.Name.UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onAppWillTerminate), name:Notification.Name.UIApplicationWillTerminate, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onAppDidBecomeActive), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    func deregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationWillTerminate, object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    @objc func onAppWillResignActive() {
        
    }
    
    @objc func onAppWillTerminate() {
        
    }

    @objc func onAppDidBecomeActive() {
        
    }
}
