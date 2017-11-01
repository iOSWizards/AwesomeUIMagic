//
//  TransitionDelegate.swift
//  AwesomeUIMagic_Example
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 01/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

public class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let presentationAnimator = TransitionPresentationAnimator()
        return presentationAnimator
    }
    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//    }
}
