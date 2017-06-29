//
//  ParallaxHeaderView.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 08/08/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

open class ParallaxHeaderView: UIView {

    @IBOutlet open weak var backgroundImageView: UIImageView!
    @IBOutlet open weak var closedView: UIView!
    @IBOutlet open weak var gradientView: DesignableView!
    @IBOutlet open weak var titleLabel: UILabel!
    
    open var kParallaxDeltaFactor: CGFloat = 0.5
    open var kMaxTitleAlphaOffset: CGFloat = 100.0
    open var kLabelPaddingDist: CGFloat = 20.0
    open var kNavigationBarHeight: CGFloat = 64.0
    open var kDefaultHeaderFrame = CGRect(x: 0, y: 0, width: 375, height: 166)
    
    open override func awakeFromNib() {
        backgroundImageView.layer.masksToBounds = true
        kDefaultHeaderFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.frame.size.height)
    }
    
    open func updateLayout(_ offset: CGPoint, showNavigationBar:((_ show: Bool) -> Void)?){
        var frame = self.frame
        if offset.y > 0 {
            frame.origin.y = max(offset.y*kParallaxDeltaFactor, 0)
            self.frame = frame
            self.closedView.alpha = 1 / kDefaultHeaderFrame.size.height * offset.y * 2
            self.clipsToBounds = true
        }else{
            self.closedView.alpha = 0
            let delta: CGFloat = fabs(min(0.0, offset.y))
            var rect = kDefaultHeaderFrame
            rect.size.width = UIScreen.main.bounds.width
            rect.size.height = kDefaultHeaderFrame.size.height
            rect.origin.y -= delta
            rect.size.height += delta
            self.backgroundImageView.frame = rect
            self.clipsToBounds = false
            self.titleLabel.alpha = 1 - (delta) * 0.4 / kMaxTitleAlphaOffset
        }
        
        if let showNavigationBar = showNavigationBar {
            showNavigationBar(offset.y > (kDefaultHeaderFrame.size.height - kNavigationBarHeight))
        }
    }

}
