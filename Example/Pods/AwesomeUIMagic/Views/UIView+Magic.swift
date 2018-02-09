//
//  UIView+Magic.swift
//  AwesomeUIMagic
//
//  Created by Evandro Harrison Hoffmann on 2/9/18.
//

import UIKit

@IBDesignable
extension UIView {
    
    // MARK: - Associations
    
    private static let cornerRadiusAssociation = ObjectAssociation<NSObject>()
    
    // MARK: - Inspectables
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return UIView.cornerRadiusAssociation[self] as? CGFloat ?? 0
        }
        set (cornerRadius) {
            UIView.cornerRadiusAssociation[self] = cornerRadius as NSObject
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    // MARK: - Shimmering Effect
    
}
