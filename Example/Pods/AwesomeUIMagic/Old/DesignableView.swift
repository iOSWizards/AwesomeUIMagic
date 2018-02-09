//
//  DesignableView.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 06/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

enum ShapeType: Int {
    case `default` = 0
    case hexagon = 1
    case hexagonVertical = 2
}

@IBDesignable
open class DesignableView: UIView {
    
    // MARK: - Shapes
    
    @IBInspectable open var shapeType: Int = 0{
        didSet{
            updateShape(shapeType)
        }
    }
    
    open func updateShape(_ shapeType: Int){
        switch shapeType {
        case ShapeType.hexagon.rawValue:
            self.addHexagonalMask(0)
            break
        case ShapeType.hexagonVertical.rawValue:
            self.addHexagonalMask(CGFloat(Double.pi/2))
            break
        default:
            break
        }
    }
    
    @IBInspectable open var isTriangle: Bool = false {
        didSet{
            
        }
    }
    
    @IBInspectable open var triangleColor: UIColor = UIColor.white {
        didSet{
            
        }
    }
    
    @IBInspectable var autoRadius:Bool = false {
        didSet {
            if autoRadius {
                cornerRadius = layer.frame.height / 2
            }
        }
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        updateShape(shapeType)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if self.isTriangle {
            addTringleView(rect, fillColor: self.triangleColor)
        }
    }
}

