//
//  UIView+Awesome.swift
//  Pods
//
//  Created by Evandro Harrison Hoffmann on 20/01/2017.
//
//

import Foundation

public extension UIView{
    private struct AssociatedKeys {
        static var borderColor    = "awesomeBorderColor"
        static var borderWidth    = "awesomeBorderWidth"
    }
    
    @IBInspectable public var borderColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.borderColor) as? UIColor
        } set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.borderColor,
                newValue as UIColor?,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.borderWidth) as? CGFloat
        } set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.borderWidth,
                newValue as CGFloat?,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            
            layer.borderWidth = newValue ?? 0
        }
    }
}
