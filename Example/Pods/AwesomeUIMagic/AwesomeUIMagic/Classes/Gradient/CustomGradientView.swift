//
//  CustomGradientView.swift
//  AwesomeUIMagic
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 15/02/19.
//

import Foundation

public class CustomGradientView: UIView {
    
    fileprivate var gradientLayer: LinearGradientLayer = LinearGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: Public methods
    
    public func setColors(_ colors: [CGColor]) {
        gradientLayer.colors = colors
    }
    
    public func setDirection(_ direction: LinearGradientDirection) {
        gradientLayer.direction = direction
    }
}
