//
//  UIBezierPath+Polygon.swift
//  MV UI Hacks
//
//  Created by Evandro Harrison Hoffmann on 06/07/2016.
//  Copyright © 2016 It's Day Off. All rights reserved.
//

import UIKit

extension UIBezierPath {
    
    public convenience init(roundedPolygonPathWithRect rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat) {
        self.init()
        
        let theta = CGFloat(2.0 * Double.pi) / CGFloat(sides)                            // how much to turn at every corner
        let offset = CGFloat(cornerRadius) * CGFloat(tan(theta / 2.0))              // offset from which to start rounding corners
        let squareWidth = min(rect.size.width, rect.size.height)          // width of the square
        
        // calculate the length of the sides of the polygon
        
        var length = squareWidth - lineWidth
        if sides % 4 != 0 {                                               // if not dealing with polygon which will be square with all sides ...
            length = length * CGFloat(cos(theta / 2.0)) + offset/2.0               // ... offset it inside a circle inside the square
        }
        let sideLength = length * CGFloat(tan(theta / 2.0))
        
        // start drawing at `point` in lower right corner
        
        var point = CGPoint(x: squareWidth / 2.0 + sideLength / 2.0 - offset, y: squareWidth - (squareWidth - length) / 2.0)
        var angle = CGFloat(Double.pi)
        move(to: point)
        
        // draw the sides and rounded corners of the polygon
        
        for _ in 0 ..< sides {
            point = CGPoint(x: point.x + CGFloat(sideLength - offset * 2.0) * CGFloat(cos(angle)), y: point.y + CGFloat(sideLength - offset * 2.0) * CGFloat(sin(angle)))
            addLine(to: point)
            
            let center = CGPoint(x: point.x + cornerRadius * CGFloat(cos(angle + CGFloat(Double.pi/2))), y: point.y + cornerRadius * CGFloat(sin(angle + CGFloat(Double.pi/2))))
            addArc(withCenter: center, radius:CGFloat(cornerRadius), startAngle:angle - CGFloat(Double.pi/2), endAngle:angle + theta - CGFloat(Double.pi/2), clockwise:true)
            
            point = currentPoint // we don't have to calculate where the arc ended ... UIBezierPath did that for us
            angle += theta
        }
        
        close()
    }
}
