//
//  LoadingView.swift
//  CurrencyConverter
//
//  Created by Vu Tiet on 10/09/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

class LoadingView : UIView, NibViewLoadable
{
    @IBOutlet weak var indicatorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let replicatorLayer = createReplicatorLayer()
        self.layer.addSublayer(replicatorLayer)
    }
    
    func createReplicatorLayer() -> CAReplicatorLayer {
        // original code from S.O:
        // https://stackoverflow.com/questions/42399720/fade-in-out-animation-for-a-series-of-dots
        
        let layer = CAReplicatorLayer()
        layer.frame = CGRect(x: (self.frame.size.width - 125) / 2, y: (self.frame.size.height - 20) / 2, width: 125, height: 20)
        
        let bar = CALayer()
        bar.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        bar.backgroundColor = UIColor.green.cgColor
        layer.addSublayer(bar)
        layer.instanceCount = 5
        layer.instanceTransform = CATransform3DMakeTranslation(25, 0, 0)
        
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1.0
        animation.toValue = 0.2
        animation.duration = 1.0
        animation.repeatCount = .infinity
        bar.add(animation, forKey: nil)
        layer.instanceDelay = animation.duration / Double(layer.instanceCount)
        
        return layer
    }
    
}
