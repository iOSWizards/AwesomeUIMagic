//
//  UIView+Layers.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 07/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

extension UIView{
    
    // MARK: - Gradient
    
    public func addGradientLayer(_ topColor: UIColor, bottomColor: UIColor){
        //remove sublayers
        if let sublayers = layer.sublayers {
            for sublayer in sublayers {
                if let gradientLayer = sublayer as? CAGradientLayer {
                    gradientLayer.removeFromSuperlayer()
                }
            }
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - Hexagonal
    
    public func addHexagonalMask(_ rotateAngle: CGFloat){
        let path = UIBezierPath(roundedPolygonPathWithRect:self.bounds, lineWidth: 10, sides: 6, cornerRadius: 30)
        if rotateAngle != 0 {
            let box = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            
            var translate = CGAffineTransform(translationX: -1 * (box.origin.x + (box.size.width / 2)), y: -1 * (box.origin.y + (box.size.height / 2)))
            path.apply(translate)
            
            let rotate = CGAffineTransform(rotationAngle: rotateAngle)
            path.apply(rotate)
            
            translate = CGAffineTransform(translationX: (box.origin.x + (box.size.width / 2)), y: (box.origin.y + (box.size.height / 2)));
            path.apply(translate)
        }
        
        let mask = CAShapeLayer()
        mask.path            = path.cgPath
        mask.lineWidth       = 0
        mask.strokeColor     = UIColor.clear.cgColor
        mask.fillColor       = UIColor.white.cgColor
        
        //shadow
        mask.shadowOffset = CGSize(width: 0, height: 1)
        mask.shadowColor = UIColor.black.cgColor
        mask.shadowRadius = 1
        mask.shadowOpacity = 0.25
        mask.shadowPath = path.cgPath
        
        self.layer.mask = mask
        self.layer.masksToBounds = true
    }
    
    // MARK: - Triangle 
    
    public func addTringleView(_ rect: CGRect, fillColor: UIColor) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.closePath()
        
        context.setFillColor(fillColor.cgColor)
        context.fillPath()
    }
    
    // MARK: - Single corner radius
    
    public func addCornerRadius(byRoundingCorners corners: UIRectCorner, radius: CGFloat) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.frame, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = rectShape
        self.layer.masksToBounds = true
        self.layoutIfNeeded()
    }
    
    // MARK: - Blur effect
    
    public func addBluredBackground(style: UIBlurEffectStyle = .dark) {
        for view in subviews {
            if view is UIVisualEffectView {
                view.removeFromSuperview()
            }
        }
        
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}

