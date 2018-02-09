//
//  ShadowLayer.swift
//  AwesomeUIMagic
//
//  Created by Evandro Harrison Hoffmann on 2/9/18.
//

import UIKit

public class ShadowLayer: UIView {
    
    public func setProperties(shadowColor: UIColor,
                              shadowOffset: CGSize,
                              shadowOpacity: Float,
                              shadowRadius: CGFloat) {
        
        backgroundColor = UIColor.clear
        layer.shadowColor = shadowColor.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shouldRasterize = true
        layer.masksToBounds = true
        clipsToBounds = false
    }
}

extension UIView {
    
    public func addShadowLayer(shadowColor: UIColor = UIColor.black,
                               shadowOffset: CGSize = CGSize(width: 2, height: 2),
                               shadowOpacity: Float = 0.5,
                               shadowRadius: CGFloat = 4) {
        removeShadowLayer()
        
        let shadowLayer = ShadowLayer(frame: self.frame)
        shadowLayer.setProperties(shadowColor: shadowColor,
                                  shadowOffset: shadowOffset,
                                  shadowOpacity: shadowOpacity,
                                  shadowRadius: self.layer.cornerRadius > 0 ? self.layer.cornerRadius/2 : shadowRadius)
        
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubview(toFront: self)
    }
    
    public func removeShadowLayer() {
        for subview in subviews {
            if let subview = subview as? ShadowLayer {
                subview.removeFromSuperview()
            }
        }
    }
}
