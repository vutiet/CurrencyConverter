//
//  BaseViewController.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 08/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController, BaseViewProtocol {
        
    @IBOutlet weak var contentView:UIView!  //TODO: can't we use self.view instead of this outlet?
    
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
    }
    
    
    public func hideLoading() {
    }
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onAppWillResignActive), name:NSNotification.Name.UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onAppWillTerminate), name:NSNotification.Name.UIApplicationWillTerminate, object: nil)
    }
    
    func deregisterNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationWillTerminate, object: nil)
    }
    
    @objc func onAppWillResignActive() {
        
    }
    
    @objc func onAppWillTerminate() {
        
    }

}
