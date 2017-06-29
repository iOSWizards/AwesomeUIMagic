//
//  DesignableButton.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 07/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

@IBDesignable
open class DesignableButton: UIButton {
    
    var shadowLayer: UIView?
    
    deinit {
        shadowLayer?.removeFromSuperview()
        shadowLayer = nil
    }
    
    // MARK: - Shapes
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var selectedBorderColor: UIColor = UIColor.clear
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable open var selectedBorderWidth: CGFloat = 0
    
    @IBInspectable open var unselectedBorderWidth: CGFloat = 0 {
        didSet {
            borderWidth = unselectedBorderWidth
        }
    }
    
    @IBInspectable open var focusedBorderWidth: CGFloat = 0
    
    @IBInspectable open var unfocusedBorderWidth: CGFloat = 0
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable open var selectedBackgroundColor: UIColor = UIColor.clear
    
    @IBInspectable open var unselectedBackgroundColor: UIColor = UIColor.clear {
        didSet {
            backgroundColor = unselectedBackgroundColor
        }
    }
    
    @IBInspectable open var focusedBackgroundColor: UIColor = UIColor.clear
    
    @IBInspectable open var unfocusedBackgroundColor: UIColor = UIColor.clear
    
    open override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        updateBackground()
        updateBorder()
    }
    
    open override var isSelected: Bool {
        didSet {
            updateBorder()
            updateBackground()
        }
    }
    
    func updateBackground() {
        backgroundColor = isFocused ? focusedBackgroundColor : (isSelected ? selectedBackgroundColor : unselectedBackgroundColor)
    }
    
    func updateBorder() {
        if focusedBorderWidth != 0 {
            borderWidth = isFocused ? focusedBorderWidth : (isSelected ? selectedBorderWidth : unfocusedBorderWidth)
            layer.borderColor = isFocused ? borderColor.cgColor : isSelected ? selectedBorderColor.cgColor : borderColor.cgColor
        }
    }
    
    // MARK: - Colors
    
    @IBInspectable open var gradientTopColor: UIColor = UIColor.clear {
        didSet{
            self.addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        }
    }
    
    @IBInspectable open var gradientBottomColor: UIColor = UIColor.clear {
        didSet{
            self.addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        }
    }
    
    @IBInspectable open var shadowColor: UIColor = UIColor.clear
    
    @IBInspectable open var shadowOffset: CGSize = CGSize.zero
    
    @IBInspectable open var shadowOpacity: Float = 0
    
    @IBInspectable open var shadowRadius: CGFloat = 0
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        addGradientLayer(gradientTopColor, bottomColor: gradientBottomColor)
        
        if(self.shadowRadius > 0) {
            if shadowLayer != nil {
                shadowLayer?.removeFromSuperview()
                shadowLayer = nil
            }
            
            shadowLayer = UIView(frame: self.frame)
            shadowLayer!.backgroundColor = UIColor.clear
            shadowLayer!.layer.shadowColor = self.shadowColor.cgColor
            shadowLayer!.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
            shadowLayer!.layer.shadowOffset = self.shadowOffset
            shadowLayer!.layer.shadowOpacity = self.shadowOpacity
            shadowLayer!.layer.shadowRadius = self.shadowRadius
            shadowLayer!.layer.shouldRasterize = true
            shadowLayer!.layer.masksToBounds = true
            shadowLayer!.clipsToBounds = false
            
            self.superview?.addSubview(shadowLayer!)
            self.superview?.bringSubview(toFront: self)
            
        }
    }

}
